import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:librarymanager/domain/entities/book.dart';
import 'package:librarymanager/presentation/blocs/book/book_bloc.dart';
import 'package:librarymanager/presentation/blocs/book/book_event.dart';
import 'package:librarymanager/presentation/blocs/book/book_state.dart';
import 'package:librarymanager/presentation/widgets/book_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(LoadBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library Manager'), centerTitle: true),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BookError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          if (state is BookLoaded) {
            final books = state.books;

            if (books.isEmpty) {
              return const Center(child: Text("No books yet"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookTile(
                  book: books[index],
                  onEdit: (b) => _showUpdateDialog(context, b),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBookDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddBookDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final authorCtrl = TextEditingController();
    final yearCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Book"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: authorCtrl,
                decoration: const InputDecoration(labelText: "Author"),
              ),
              TextField(
                controller: yearCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Publish Year"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleCtrl.text.trim();
                final author = authorCtrl.text.trim();
                final year = int.tryParse(yearCtrl.text.trim()) ?? 0;

                if (title.isNotEmpty && author.isNotEmpty) {
                  context.read<BookBloc>().add(
                    AddBookEvent(
                      book: Book(
                        title: title,
                        author: author,
                        publishYear: year,
                        available: true,
                      ),
                    ),
                  );
                }

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context, Book oldBook) {
    final titleCtrl = TextEditingController(text: oldBook.title);
    final authorCtrl = TextEditingController(text: oldBook.author);
    final yearCtrl = TextEditingController(
      text: oldBook.publishYear.toString(),
    );

    bool isAvailable = oldBook.available;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Update Book"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleCtrl,
                    decoration: const InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    controller: authorCtrl,
                    decoration: const InputDecoration(labelText: "Author"),
                  ),
                  TextField(
                    controller: yearCtrl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Publish Year",
                    ),
                  ),

                  const SizedBox(height: 8),

                  ToggleButtons(
                    isSelected: [isAvailable],
                    children: const [Text("Available")],
                    onPressed: (_) {
                      setState(() => isAvailable = !isAvailable);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = titleCtrl.text.trim();
                    final author = authorCtrl.text.trim();
                    final year = int.tryParse(yearCtrl.text.trim()) ?? 0;

                    if (title.isNotEmpty && author.isNotEmpty) {
                      context.read<BookBloc>().add(
                        UpdateBookEvent(
                          id: oldBook.id!,
                          book: Book(
                            id: oldBook.id,
                            title: title,
                            author: author,
                            publishYear: year,
                            available: isAvailable,
                          ),
                        ),
                      );
                    }

                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
