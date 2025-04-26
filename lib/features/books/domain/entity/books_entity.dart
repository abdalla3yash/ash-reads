import 'package:bookapp/features/books/domain/entity/book_entity.dart';

class BooksEntity {
  final int count;
  final String? next;
  final String? previous;
  final List<BookEntity> results;

  BooksEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}
