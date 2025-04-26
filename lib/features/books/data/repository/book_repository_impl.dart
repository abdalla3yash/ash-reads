import 'package:bookapp/core/base/api_response.dart';
import 'package:bookapp/features/books/data/data_source/book_local_data_source.dart';
import 'package:bookapp/features/books/data/data_source/book_remote_data_source.dart';
import 'package:bookapp/features/books/data/model/books_model.dart';
import 'package:bookapp/features/books/data/model/mappers/books_mapper.dart';
import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:bookapp/features/books/domain/repository/book_repository.dart';
import 'package:dartz/dartz.dart';
class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  final BookLocalDataSource localDataSource;


  BookRepositoryImpl(this.remoteDataSource,this.localDataSource);

  @override
  Future<Either<String, List<BookEntity>>> getBooks({int? page,String? search}) async {
    try {
      final ApiResponse apiResponse = await remoteDataSource.fetchBooks(page: page,search: search);
      final booksModel = BooksModel.fromJson(apiResponse.data);
      final books = booksModel.results?.map((book) => book.toEntity()).toList() ?? [];
      if(booksModel.results != null) await localDataSource.cacheBooks(booksModel.results!);
      return Right(books);
    } catch (e) {
      try {
        final cachedBooks = await localDataSource.getCachedBooks();
        final books = cachedBooks.map((book) => book.toEntity()).toList();
        return Right(books);
      } catch (cacheError) {
        return Left(cacheError.toString());
      }
    }
  }
}
