import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarymanager/domain/usecases/update_book.dart';

import 'book_event.dart';
import 'book_state.dart';

import 'package:librarymanager/domain/usecases/get_books.dart';
import 'package:librarymanager/domain/usecases/create_book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;
  final CreateBook createBook;
  final UpdateBook updateBook;

  BookBloc({
    required this.getBooks,
    required this.createBook,
    required this.updateBook,
  }) : super(BookInitial()) {
    on<LoadBooksEvent>(_onLoadBooks);
    on<AddBookEvent>(_onAddBook);
    on<UpdateBookEvent>(_onUpdateBook);
  }

  Future<void> _onLoadBooks(
    LoadBooksEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      final list = await getBooks();
      emit(BookLoaded(list));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> _onAddBook(AddBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      await createBook(event.book);
      final list = await getBooks();
      emit(BookLoaded(list));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  Future<void> _onUpdateBook(
    UpdateBookEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      await updateBook(event.book);
      final list = await getBooks();
      emit(BookLoaded(list));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
