import 'package:bookapp/core/base/api_response.dart';
import 'package:bookapp/features/books/data/data_source/book_remote_data_source.dart';
import 'package:bookapp/features/books/data/model/book_model.dart';
import 'package:bookapp/features/books/data/model/mappers/books_mapper.dart';
import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:bookapp/features/books/domain/repository/book_repository.dart';
import 'package:dartz/dartz.dart';
class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, List<BookEntity>>> getBooks({int? page,String? search}) async {
    try {
      final ApiResponse apiResponse = await remoteDataSource.fetchBooks(page: page,search: search);

      if (apiResponse.response != null && apiResponse.data != null) {
        final booksModel = BooksModel.fromJson(apiResponse.data);
        final books = booksModel.results?.map((book) => book.toEntity()).toList() ?? [];
        return Right(books);
      } else {
        return Left(apiResponse.error?.toString() ?? "Unknown Error");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
