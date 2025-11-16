import 'package:dio/dio.dart';
import 'package:librarymanager/data/models/book_model.dart';

class BookRemoteDs {
  final Dio dio;

  BookRemoteDs({required this.dio});

  Future<List<BookModel>> getBooks() async {
    final response = await dio.get('/books');
    return (response.data as List)
        .map((json) => BookModel.fromJson(json))
        .toList();
  }

  Future<BookModel> createBook(BookModel book) async {
    final response = await dio.post('/books', data: book.toJson());
    return BookModel.fromJson(response.data);
  }
}
