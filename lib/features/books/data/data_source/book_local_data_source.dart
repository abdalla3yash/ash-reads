import 'package:bookapp/core/resources/app_constant.dart';
import 'package:bookapp/features/books/data/model/book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BookLocalDataSource {
  Future<void> cacheBooks(List<BookModel> books);
  Future<List<BookModel>> getCachedBooks();
}

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final Box box;
  BookLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheBooks(List<BookModel> books) async {
    final List<Map<String, dynamic>> booksMap = books.map((e) => e.toMap()).toList();
    await box.put(AppConstant.localStorageBooks, booksMap);
  }

  @override
  Future<List<BookModel>> getCachedBooks() async {
    final cachedData = box.get(AppConstant.localStorageBooks, defaultValue: []);
    if (cachedData != null && cachedData.isNotEmpty) {
      final List<BookModel> books = (cachedData as List).map((e) => BookModel.fromMap(Map<String, dynamic>.from(e as Map))).toList();
      return books;
    } else {
      throw Exception('No Cached Data');
    }
  }
}
