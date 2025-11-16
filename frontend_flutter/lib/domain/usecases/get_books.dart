import 'package:librarymanager/domain/entities/book.dart';
import 'package:librarymanager/domain/repositories/book_repository.dart';

class GetBooks {
  final BookRepository repo;

  GetBooks(this.repo);

  Future<List<Book>> call() {
    return repo.getBooks();
  }
}
