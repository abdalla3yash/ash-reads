import 'package:bookapp/features/books/data/model/authors_model.dart';
import 'package:bookapp/features/books/data/model/book_model.dart';
import 'package:bookapp/features/books/data/model/books_model.dart';
import 'package:bookapp/features/books/data/model/format_model.dart';
import 'package:bookapp/features/books/domain/entity/author_entity.dart';
import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:bookapp/features/books/domain/entity/books_entity.dart';
import 'package:bookapp/features/books/domain/entity/formats_entity.dart';

extension BooksModelMapper on BooksModel {
  BooksEntity toEntity() {
    return BooksEntity(
      count: count ?? 0,
      next: next,
      previous: previous,
      results: results?.map((book) => book.toEntity()).toList() ?? [],
    );
  }
}

extension BookModelMapper on BookModel {
  BookEntity toEntity() {
    return BookEntity(
      id: id ?? 0,
      title: title ?? '',
      authors: authors?.map((author) => author.toEntity()).toList() ?? [],
      summaries: summaries ?? [],
      subjects: subjects ?? [],
      bookshelves: bookshelves ?? [],
      languages: languages ?? [],
      copyright: copyright,
      mediaType: mediaType ?? '',
      formats: formats?.toEntity() ?? FormatsEntity(),
      downloadCount: downloadCount ?? 0,
    );
  }
}

extension AuthorModelMapper on Authors {
  AuthorEntity toEntity() {
    return AuthorEntity(
      name: name ?? '',
      birthYear: birthYear,
      deathYear: deathYear,
    );
  }
}

extension FormatsModelMapper on Formats {
  FormatsEntity toEntity() {
    return FormatsEntity(
      textHtml: textHtml,
      applicationEpubZip: applicationEpubZip,
      applicationXMobipocketEbook: applicationXMobipocketEbook,
      applicationRdfXml: applicationRdfXml,
      imageJpeg: imageJpeg,
      textPlainCharsetUsAscii: textPlainCharsetUsAscii,
      applicationOctetStream: applicationOctetStream,
      textPlainCharsetUtf8: textPlainCharsetUtf8,
      textHtmlCharsetUtf8: textHtmlCharsetUtf8,
      textPlainCharsetIso88591: textPlainCharsetIso88591,
      textHtmlCharsetIso88591: textHtmlCharsetIso88591,
    );
  }
}
