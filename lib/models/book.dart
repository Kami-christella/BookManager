class Book {
  final String id;
  final String title;
  final String author;
  final int rating;
  final bool isRead;
  final String? imageUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.rating = 0,
    this.isRead = false,
    this.imageUrl,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    int? rating,
    bool? isRead,
    String? imageUrl,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      rating: rating ?? this.rating,
      isRead: isRead ?? this.isRead,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

