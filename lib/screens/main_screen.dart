// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'home_screen.dart';
// import 'add_edit_book_screen.dart';
// import '../models/book.dart';
// import 'settings_screen.dart';
// import '../services/preferences_service.dart';

// class MainScreen extends StatefulWidget {
//   final Function(bool) toggleTheme;

//   MainScreen({required this.toggleTheme});

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   List<Book> books = []; // Empty list to start with
//   final uuid = Uuid();
//   String _sortBy = 'title';
//   String _searchQuery = '';
//   final PreferencesService _prefsService = PreferencesService();

//   @override
//   void initState() {
//     super.initState();
//     _loadSortPreference();
//   }

//   void _loadSortPreference() async {
//     final sortPreference = await _prefsService.getSortPreference();
//     setState(() {
//       _sortBy = sortPreference;
//     });
//   }

//   void _onItemTapped(int index) async {
//     if (index == 1) {
//       final newBook = await Navigator.push<Book>(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AddEditBookScreen(),
//         ),
//       );
//       if (newBook != null) {
//         setState(() {
//           books.add(newBook.copyWith(id: uuid.v4()));
//           _selectedIndex = 0;
//         });
//       }
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   void _editBook(Book updatedBook) {
//     setState(() {
//       final index = books.indexWhere((book) => book.id == updatedBook.id);
//       if (index != -1) {
//         books[index] = updatedBook;
//       }
//     });
//   }

//   void _deleteBook(String bookId) {
//     setState(() {
//       books.removeWhere((book) => book.id == bookId);
//     });
//   }

//   void _toggleReadStatus(String bookId) {
//     setState(() {
//       final bookIndex = books.indexWhere((book) => book.id == bookId);
//       if (bookIndex != -1) {
//         books[bookIndex] = books[bookIndex].copyWith(isRead: !books[bookIndex].isRead);
//       }
//     });
//   }

//   void _setSortBy(String sortBy) {
//     setState(() {
//       _sortBy = sortBy;
//     });
//     _prefsService.setSortPreference(sortBy);
//   }

//   void _setSearchQuery(String query) {
//     setState(() {
//       _searchQuery = query;
//     });
//   }

//   List<Book> get _filteredAndSortedBooks {
//     List<Book> filteredBooks = books.where((book) =>
//         book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//         book.author.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

//     filteredBooks.sort((a, b) {
//       switch (_sortBy) {
//         case 'title':
//           return a.title.compareTo(b.title);
//         case 'author':
//           return a.author.compareTo(b.author);
//         case 'rating':
//           return b.rating.compareTo(a.rating); // Note: Descending order for rating
//         default:
//           return 0;
//       }
//     });

//     return filteredBooks;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _widgetOptions = <Widget>[
//       HomeScreen(
//         books: _filteredAndSortedBooks,
//         onEdit: _editBook,
//         onDelete: _deleteBook,
//         onToggleRead: _toggleReadStatus,
//         onSearch: _setSearchQuery,
//         sortBy: _sortBy,
//         onSortChange: _setSortBy,
//       ),
//       Container(),
//       SettingsScreen(
//         onSortChange: _setSortBy,
//         currentSort: _sortBy,
//         toggleTheme: widget.toggleTheme,
//       ),
//     ];

//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Books',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Add Book',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Theme.of(context).colorScheme.secondary,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'home_screen.dart';
import 'add_edit_book_screen.dart';
import '../models/book.dart';
import 'settings_screen.dart';
import '../services/preferences_service.dart';

class MainScreen extends StatefulWidget {
  final Function(bool) toggleTheme;

  MainScreen({required this.toggleTheme});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Book> books = []; // Empty list to start with
  final uuid = Uuid();
  String _sortBy = 'title';
  String _searchQuery = '';
  final PreferencesService _prefsService = PreferencesService();

  @override
  void initState() {
    super.initState();
    _loadSortPreference();
  }

  void _loadSortPreference() async {
    final sortPreference = await _prefsService.getSortPreference();
    setState(() {
      _sortBy = sortPreference;
    });
  }

  void _onItemTapped(int index) async {
    if (index == 1) {
      final newBook = await Navigator.push<Book>(
        context,
        MaterialPageRoute(
          builder: (context) => AddEditBookScreen(),
        ),
      );
      if (newBook != null) {
        setState(() {
          books.add(newBook.copyWith(id: uuid.v4()));
          _selectedIndex = 0;
        });
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _editBook(Book updatedBook) {
    setState(() {
      final index = books.indexWhere((book) => book.id == updatedBook.id);
      if (index != -1) {
        books[index] = updatedBook;
      }
    });
  }

  void _deleteBook(String bookId) {
    setState(() {
      books.removeWhere((book) => book.id == bookId);
    });
  }

  void _toggleReadStatus(String bookId) {
    setState(() {
      final bookIndex = books.indexWhere((book) => book.id == bookId);
      if (bookIndex != -1) {
        books[bookIndex] = books[bookIndex].copyWith(isRead: !books[bookIndex].isRead);
      }
    });
  }

  void _setSortBy(String sortBy) {
    setState(() {
      _sortBy = sortBy;
    });
    _prefsService.setSortPreference(sortBy);
  }

  void _setSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<Book> get _filteredAndSortedBooks {
    List<Book> filteredBooks = books.where((book) =>
        book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        book.author.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

    filteredBooks.sort((a, b) {
      switch (_sortBy) {
        case 'title':
          return a.title.compareTo(b.title);
        case 'author':
          return a.author.compareTo(b.author);
        case 'rating':
          return b.rating.compareTo(a.rating); // Note: Descending order for rating
        default:
          return 0;
      }
    });

    return filteredBooks;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(
        books: _filteredAndSortedBooks,
        onEdit: _editBook,
        onDelete: _deleteBook,
        onToggleRead: _toggleReadStatus,
        onSearch: _setSearchQuery,
        sortBy: _sortBy,
        onSortChange: _setSortBy,
      ),
      Container(),
      SettingsScreen(
        onSortChange: _setSortBy,
        currentSort: _sortBy,
        toggleTheme: widget.toggleTheme,
      ),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}


