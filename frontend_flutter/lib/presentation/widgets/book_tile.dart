import 'package:flutter/material.dart';
import 'package:librarymanager/domain/entities/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final void Function(Book)? onEdit;

  const BookTile({super.key, required this.book, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () => onEdit?.call(book),
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
