part of "./book_cubit.dart";

abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<BookEntity> books;
  final bool hasReachedEnd;

  BookLoaded(this.books, this.hasReachedEnd);
}

class BookError extends BookState {
  final String message;

  BookError(this.message);
}
