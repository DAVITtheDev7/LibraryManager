import 'package:librarymanager/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<Book> createBook(Book book);
  Future<Book> updateBook(Book book);
}
