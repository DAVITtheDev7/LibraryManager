import 'package:librarymanager/domain/entities/book.dart';
import 'package:librarymanager/domain/repositories/book_repository.dart';

class CreateBook {
  final BookRepository repo;

  CreateBook(this.repo);

  Future<void> call(Book book) {
    return repo.createBook(book);
  }
}
