import 'package:bookapp/features/books/domain/entity/author_entity.dart';
import 'package:bookapp/features/books/domain/entity/formats_entity.dart';

class BookEntity {
  final int id;
  final String title;
  final List<AuthorEntity> authors;
  final List<String> summaries;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool? copyright;
  final String mediaType;
  final FormatsEntity formats;
  final int downloadCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });
}
