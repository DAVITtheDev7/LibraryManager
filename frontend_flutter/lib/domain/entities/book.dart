import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int? id;
  final String title;
  final String author;
  final int publishYear;
  final bool available;

  const Book({
    this.id,
    required this.title,
    required this.author,
    required this.publishYear,
    required this.available,
  });

  @override
  List<Object?> get props => [id, title, author, publishYear, available];
}
