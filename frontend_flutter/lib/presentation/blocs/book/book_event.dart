import 'package:librarymanager/domain/entities/book.dart';

abstract class BookEvent {}

class LoadBooksEvent extends BookEvent {}

class AddBookEvent extends BookEvent {
  final Book book;

  AddBookEvent({required this.book});
}

class UpdateBookEvent extends BookEvent {
  final int id;
  final Book book;

  UpdateBookEvent({required this.id, required this.book});
}
