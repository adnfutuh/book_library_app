import 'package:book_library_app/models/enum.dart';

class BookModel {
  final String imageUrl;
  final String bookId;
  final String title;
  final String author;
  final String isbn;
  final String publisher;
  final String description;
  final Category category;
  final Availability availability;

  BookModel({
    required this.imageUrl,
    required this.bookId,
    required this.title,
    required this.author,
    required this.isbn,
    required this.publisher,
    required this.description,
    required this.category,
    required this.availability,
  });
}
