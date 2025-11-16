import 'package:flutter/material.dart';
import 'package:librarymanager/domain/entities/book.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(book.title),
        subtitle: Text('${book.author} • ${book.publishYear}'),
        trailing: Icon(
          book.available ? Icons.check_circle : Icons.cancel,
          color: book.available ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
