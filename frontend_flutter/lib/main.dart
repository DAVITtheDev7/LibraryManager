import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:librarymanager/core/network/dio_client.dart';
import 'package:librarymanager/data/datasources/book_remote_ds.dart';
import 'package:librarymanager/data/repositories/book_repository_impl.dart';
import 'package:librarymanager/domain/usecases/get_books.dart';
import 'package:librarymanager/domain/usecases/create_book.dart';
import 'package:librarymanager/domain/usecases/update_book.dart';
import 'package:librarymanager/presentation/blocs/book/book_bloc.dart';
import 'package:librarymanager/presentation/pages/home/home_page.dart';

void main() {
  // Dio client
  final dioClient = DioClient();

  // Remote DataSource
  final remote = BookRemoteDs(dio: dioClient.dio);

  // Repository
  final repo = BookRepositoryImpl(bookRemoteDs: remote);

  // UseCases
  final getBooks = GetBooks(repo);
  final createBook = CreateBook(repo);
  final updateBook = UpdateBook(repo);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BookBloc(
            getBooks: getBooks,
            createBook: createBook,
            updateBook: updateBook,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
