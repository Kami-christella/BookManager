// book_list.dart
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books = [
    Book(id: Uuid().v4(), title: 'Book 1', author: 'Author 1', rating: 4), // Specify rating
    Book(id: Uuid().v4(), title: 'Book 2', author: 'Author 2', rating: 3), // Specify rating
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(books[index].title),
          subtitle: Text(books[index].author),
          onTap: () {
            // Navigate to book detail view
          },
        );
      },
    );
  }
}


