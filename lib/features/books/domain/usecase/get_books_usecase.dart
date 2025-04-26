import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:bookapp/features/books/domain/repository/book_repository.dart';
import 'package:dartz/dartz.dart';

class GetBooksUseCase {
  final BookRepository repository;
  GetBooksUseCase(this.repository);

  Future<Either<String, List<BookEntity>>> call({int? page,String? search}) async => await repository.getBooks(page: page,search: search);  
}
