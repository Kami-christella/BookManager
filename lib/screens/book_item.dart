// import 'package:flutter/material.dart';
// import 'dart:convert';
// import '../models/book.dart';
// import 'star_rating.dart';
// import 'book_detail_screen.dart';
// import 'add_edit_book_screen.dart';

// class BookItem extends StatelessWidget {
//   final Book book;
//   final Function(Book) onEdit;
//   final Function(String) onDelete;
//   final Function(String) onToggleRead;

//   BookItem({
//     required this.book,
//     required this.onEdit,
//     required this.onDelete,
//     required this.onToggleRead,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(30.0),
//                 child: book.imageUrl != null
//                     ? Image.memory(
//                         base64Decode(book.imageUrl!),
//                         width: 60,
//                         height: 60,
//                         fit: BoxFit.cover,
//                       )
//                     : CircleAvatar(
//                         backgroundColor: Theme.of(context).colorScheme.secondary,
//                         child: Text(
//                           book.title[0].toUpperCase(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         radius: 30,
//                       ),
//               ),
//               title: Text(
//                 book.title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                 ),
//               ),
//               subtitle: Text('Author: ${book.author}'),
//               trailing: IconButton(
//                 icon: Icon(book.isRead ? Icons.check_circle : Icons.check_circle_outline),
//                 onPressed: () => onToggleRead(book.id),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BookDetailScreen(book: book),
//                   ),
//                 );
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: StarRating(rating: book.rating),
//             ),
//             ButtonBar(
//               alignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   child: Text('Edit'),
//                   onPressed: () async {
//                     final updatedBook = await Navigator.push<Book>(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddEditBookScreen(book: book),
//                       ),
//                     );
//                     if (updatedBook != null) {
//                       onEdit(updatedBook);
//                     }
//                   },
//                 ),
//                 TextButton(
//                   child: Text('Delete'),
//                   onPressed: () => onDelete(book.id),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }









import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  BookItem({
    required this.book,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: book.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.memory(
                  base64Decode(book.imageUrl!),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              )
            : CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Text(
                  book.title[0].toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
        title: Text('Title: ${book.title}'),
        subtitle: Text('Author: ${book.author} - Rating: ${book.rating}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}




