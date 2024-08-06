// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
// import '../models/book.dart';
// import 'star_rating.dart';

// class AddEditBookScreen extends StatefulWidget {
//   final Book? book;

//   AddEditBookScreen({this.book});

//   @override
//   _AddEditBookScreenState createState() => _AddEditBookScreenState();
// }

// class _AddEditBookScreenState extends State<AddEditBookScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _titleController = TextEditingController();
//   final _authorController = TextEditingController();
//   int _rating = 0;
//   String? _imageData;
//   final picker = ImagePicker();

//   bool get _isEditing => widget.book != null;

//   @override
//   void initState() {
//     super.initState();
//     if (_isEditing) {
//       _titleController.text = widget.book!.title;
//       _authorController.text = widget.book!.author;
//       _rating = widget.book!.rating;
//       _imageData = widget.book!.imageUrl;
//     }
//   }

//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final bytes = await pickedFile.readAsBytes();
//       setState(() {
//         _imageData = base64Encode(bytes);
//       });
//     }
//   }

//   void _saveBook() {
//     if (_formKey.currentState!.validate()) {
//       final newBook = Book(
//         id: widget.book?.id ?? '',
//         title: _titleController.text,
//         author: _authorController.text,
//         rating: _isEditing ? _rating : 0,
//         imageUrl: _imageData,
//       );
//       Navigator.pop(context, newBook);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isEditing ? 'Edit Book' : 'Add Book'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: getImage,
//                 child: Container(
//                   width: 150,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: _imageData != null
//                       ? Image.memory(
//                           base64Decode(_imageData!),
//                           fit: BoxFit.cover,
//                         )
//                       : Icon(Icons.add_photo_alternate, size: 50),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(labelText: 'Title'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _authorController,
//                 decoration: InputDecoration(labelText: 'Author'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an author';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               if (_isEditing) ...[
//                 Text('Rating:'),
//                 StarRating(
//                   rating: _rating,
//                   onRatingChanged: (rating) {
//                     setState(() {
//                       _rating = rating;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 20),
//               ],
//               ElevatedButton(
//                 onPressed: _saveBook,
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import '../models/book.dart';
import 'star_rating.dart';

class AddEditBookScreen extends StatefulWidget {
  final Book? book;

  AddEditBookScreen({this.book});

  @override
  _AddEditBookScreenState createState() => _AddEditBookScreenState();
}

class _AddEditBookScreenState extends State<AddEditBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  int _rating = 0;
  String? _imageData;
  final picker = ImagePicker();

  bool get _isEditing => widget.book != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _titleController.text = widget.book!.title;
      _authorController.text = widget.book!.author;
      _rating = widget.book!.rating;
      _imageData = widget.book!.imageUrl;
    }
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageData = base64Encode(bytes);
      });
    }
  }

  void _saveBook() {
    if (_formKey.currentState!.validate()) {
      final newBook = Book(
        id: widget.book?.id ?? '',
        title: _titleController.text,
        author: _authorController.text,
        rating: _isEditing ? _rating : 0,
        imageUrl: _imageData,
      );
      Navigator.pop(context, newBook);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Book' : 'Add Book'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: getImage,
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _imageData != null
                      ? Image.memory(
                          base64Decode(_imageData!),
                          fit: BoxFit.cover,
                        )
                      : Icon(Icons.add_photo_alternate, size: 50),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (_isEditing) ...[
                Text('Rating:'),
                StarRating(
                  rating: _rating,
                  onRatingChanged: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
              ElevatedButton(
                onPressed: _saveBook,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

