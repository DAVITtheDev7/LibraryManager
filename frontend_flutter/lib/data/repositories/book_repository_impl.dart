import 'package:librarymanager/data/datasources/book_remote_ds.dart';
import 'package:librarymanager/data/models/book_model.dart';
import 'package:librarymanager/domain/entities/book.dart';
import 'package:librarymanager/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDs bookRemoteDs;

  BookRepositoryImpl({required this.bookRemoteDs});

  @override
  Future<List<Book>> getBooks() => bookRemoteDs.getBooks();

  @override
  Future<Book> createBook(Book book) => bookRemoteDs.createBook(
    BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      publishYear: book.publishYear,
      available: book.available,
    ),
  );
}
