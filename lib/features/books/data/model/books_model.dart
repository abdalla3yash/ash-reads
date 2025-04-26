import 'package:bookapp/features/books/data/model/book_model.dart';

class BooksModel {
  int? count;
  String? next;
  String? previous;
  List<BookModel>? results;

  BooksModel({this.count, this.next, this.previous, this.results});

  BooksModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <BookModel>[];
      json['results'].forEach((v) {
        results!.add(BookModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

