// import 'package:flutter/material.dart';
// import '../models/book.dart';
// import 'book_detail_screen.dart';
// import 'add_edit_book_screen.dart';
// import 'star_rating.dart';

// class HomeScreen extends StatelessWidget {
//   final List<Book> books;
//   final Function(Book) onEdit;
//   final Function(String) onDelete;
//   final Function(String) onToggleRead;
//   final Function(String) onSearch;
//   final String sortBy;
//   final Function(String) onSortChange;

//   HomeScreen({
//     required this.books,
//     required this.onEdit,
//     required this.onDelete,
//     required this.onToggleRead,
//     required this.onSearch,
//     required this.sortBy,
//     required this.onSortChange,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Books'),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(48.0),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: TextField(
//               onChanged: onSearch,
//               decoration: InputDecoration(
//                 hintText: 'Search books...',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text('Sort by: '),
//                 DropdownButton<String>(
//                   value: sortBy,
//                   items: ['title', 'author', 'rating'].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value.capitalize()),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     if (newValue != null) {
//                       onSortChange(newValue);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: books.isEmpty
//                 ? Center(child: Text('No books added yet!'))
//                 : ListView.builder(
//                     itemCount: books.length,
//                     itemBuilder: (context, index) {
//                       final book = books[index];
//                       return Card(
//                         elevation: 2,
//                         margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: Theme.of(context).colorScheme.secondary,
//                             child: Text(
//                               book.title[0].toUpperCase(),
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           title: Text(book.title),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Author: ${book.author}'),
//                               StarRating(rating: book.rating),
//                               Text('Status: ${book.isRead ? 'Read' : 'Unread'}'),
//                             ],
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.edit),
//                                 onPressed: () async {
//                                   final updatedBook = await Navigator.push<Book>(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => AddEditBookScreen(book: book),
//                                     ),
//                                   );
//                                   if (updatedBook != null) {
//                                     onEdit(updatedBook);
//                                   }
//                                 },
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () => onDelete(book.id),
//                               ),
//                               IconButton(
//                                 icon: Icon(book.isRead ? Icons.check_circle : Icons.check_circle_outline),
//                                 onPressed: () => onToggleRead(book.id),
//                               ),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => BookDetailScreen(book: book),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}";
//   }
// }



import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_detail_screen.dart';
import 'add_edit_book_screen.dart';
import 'star_rating.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> books;
  final Function(Book) onEdit;
  final Function(String) onDelete;
  final Function(String) onToggleRead;
  final Function(String) onSearch;
  final String sortBy;
  final Function(String) onSortChange;

  HomeScreen({
    required this.books,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleRead,
    required this.onSearch,
    required this.sortBy,
    required this.onSortChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Books'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Sort by: '),
                DropdownButton<String>(
                  value: sortBy,
                  items: ['title', 'author', 'rating'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.capitalize()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      onSortChange(newValue);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: books.isEmpty
                ? Center(child: Text('No books added yet!'))
                : ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            child: Text(
                              book.title[0].toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(book.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Author: ${book.author}'),
                              StarRating(rating: book.rating),
                              Text('Status: ${book.isRead ? 'Read' : 'Unread'}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  final updatedBook = await Navigator.push<Book>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddEditBookScreen(book: book),
                                    ),
                                  );
                                  if (updatedBook != null) {
                                    onEdit(updatedBook);
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => onDelete(book.id),
                              ),
                              IconButton(
                                icon: Icon(book.isRead ? Icons.check_circle : Icons.check_circle_outline),
                                onPressed: () => onToggleRead(book.id),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetailScreen(book: book),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}



