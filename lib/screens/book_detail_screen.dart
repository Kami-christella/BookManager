import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${book.title}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Author: ${book.author}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('Rating: ${book.rating}/5', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Status: ${book.isRead ? 'Read' : 'Unread'}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

