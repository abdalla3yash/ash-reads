import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<String, List<BookEntity>>> getBooks({int? page,String? search});
}
