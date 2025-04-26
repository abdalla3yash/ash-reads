import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:bookapp/features/books/domain/usecase/get_books_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './book_state.dart';

class BookCubit extends Cubit<BookState> {
  final GetBooksUseCase getBooksUseCase;

  int currentPage = 1;
  List<BookEntity> allBooks = [];
  bool _hasMoreData = true;
  bool isLoading = false;

  BookCubit(this.getBooksUseCase) : super(BookInitial());

  void fetchBooks({String? searchWord, bool isRefresh = false}) async {
  if (isLoading || state is BookLoading) return;
  if (isRefresh) {
    currentPage = 1;
    allBooks.clear();
    _hasMoreData = true;
    emit(BookInitial());
  }

  if (!_hasMoreData) return;

  final isFirstFetch = currentPage == 1;

  if (isFirstFetch) emit(BookLoading());
  isLoading = true; 
  final result = await getBooksUseCase(page: currentPage,search: searchWord ?? ''); 
  isLoading = false;
  result.fold(
    (error) => emit(BookError(error)),
    (books) {
      if (books.isEmpty) {
        _hasMoreData = false;
      } else {  
        if (kDebugMode) print("total Books in fetch list ${books.length}");
        if (kDebugMode) print("total Books before ${allBooks.length} -- Page $currentPage");
        allBooks.addAll(books);
        currentPage++;
        if (kDebugMode) print("total Books after ${allBooks.length} -- Page $currentPage");
      }
      emit(BookLoaded(allBooks,!_hasMoreData));
    },
  );
}

  void resetBooks() {
    currentPage = 1;
    allBooks.clear();
    _hasMoreData = true;
    emit(BookInitial());
  }
}
