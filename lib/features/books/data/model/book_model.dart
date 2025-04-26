import 'package:bookapp/features/books/data/model/authors_model.dart';
import 'package:bookapp/features/books/data/model/format_model.dart';

class BookModel {
  int? id;
  String? title;
  List<Authors>? authors;
  List<String>? summaries;
  List<String>? subjects;
  List<String>? bookshelves;
  List<String>? languages;
  bool? copyright;
  String? mediaType;
  Formats? formats;
  int? downloadCount;

  BookModel(
      {this.id,
      this.title,
      this.authors,
      this.summaries,
      this.subjects,
      this.bookshelves,
      this.languages,
      this.copyright,
      this.mediaType,
      this.formats,
      this.downloadCount});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
    summaries = json['summaries'].cast<String>();
    subjects = json['subjects'].cast<String>();
    bookshelves = json['bookshelves'].cast<String>();
    languages = json['languages'].cast<String>();
    copyright = json['copyright'];
    mediaType = json['media_type'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    downloadCount = json['download_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    data['summaries'] = summaries;
    data['subjects'] = subjects;
    data['bookshelves'] = bookshelves;
    data['languages'] = languages;
    data['copyright'] = copyright;
    data['media_type'] = mediaType;
    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    data['download_count'] = downloadCount;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'authors': authors?.map((e) => e.toMap()).toList(), 
      'summaries': summaries,
      'subjects': subjects,
      'bookshelves': bookshelves,
      'languages': languages,
      'copyright': copyright,
      'mediaType': mediaType,
      'formats': formats?.toMap(), 
      'downloadCount': downloadCount,
    };
  }

   factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'],
      title: map['title'],
      authors: (map['authors'] as List).map((author) => Authors.fromMap(Map<String, dynamic>.from(author))).toList(),
      summaries: List<String>.from(map['summaries']),
      subjects: List<String>.from(map['subjects']),
      bookshelves: List<String>.from(map['bookshelves']),
      languages: List<String>.from(map['languages']),
      copyright: map['copyright'],
      mediaType: map['mediaType'],
      formats: Formats.fromMap(Map<String, dynamic>.from(map['formats'])),
      downloadCount: map['downloadCount'],
    );
  }
}