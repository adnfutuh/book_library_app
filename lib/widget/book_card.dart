import 'package:flutter/material.dart';

import '../const/const.dart';
import '../models/book_model.dart';
import '../models/enum.dart';
import '../util/util.dart';

class BookCard extends StatelessWidget {
  final BookModel book;

  final List<String> favBooks;
  final Function(String) toggleFav;
  const BookCard(
      {super.key,
      required this.book,
      required this.favBooks,
      required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.asset(
            height: double.infinity,
            book.imageUrl,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (book.availability == Availability.borrowed)
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Text(
                      'Borrowed',
                      style: defaultTxt.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              Container(
                height: 70 + Util(context: context).width / 400 * 10,
                color: Colors.black.withOpacity(0.9),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  book.title,
                  textAlign: TextAlign.center,
                  style: defaultTxt.copyWith(
                    fontSize: 12,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: favBooks.contains(book.bookId)
                    ? Colors.red
                    : Colors.black.withOpacity(0.7),
              ),
              onPressed: () {
                toggleFav(book.bookId);
              },
            ),
          )
        ],
      ),
    );
  }
}
