import 'package:librarymanager/domain/entities/book.dart';
import 'package:librarymanager/domain/repositories/book_repository.dart';

class UpdateBook {
  final BookRepository repo;

  UpdateBook(this.repo);

  Future<void> call(Book book) {
    return repo.updateBook(book);
  }
}
