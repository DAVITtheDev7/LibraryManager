import 'package:librarymanager/domain/entities/book.dart';

abstract class BookEvent {}

class LoadBooksEvent extends BookEvent {}

class AddBookEvent extends BookEvent {
  final Book book;

  AddBookEvent({required this.book});
}
