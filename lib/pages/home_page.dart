import 'package:book_library_app/const/const.dart';
import 'package:book_library_app/data_provider/dummy.dart';
import 'package:book_library_app/models/book_model.dart';
import 'package:book_library_app/util/util.dart';
import 'package:book_library_app/widget/menu_navbar.dart';
import 'package:flutter/material.dart';

import 'books_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = Dummy.books;
  List<String> favBooks = [];
  int index = 0;
  void toggleFav(String bookId) {
    setState(() {
      if (favBooks.contains(bookId)) {
        favBooks.remove(bookId);
      } else {
        favBooks.add(bookId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Util util = Util(context: context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: util.isPhone ? 120 : 80,
              width: double.infinity,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: !util.isPhone
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Book Library",
                      style: defaultTxt.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (!util.isPhone)
                    SizedBox(
                      width: 150,
                      child: MenuNavbar(
                        activeIndex: index,
                        changeIndex: (ind) {
                          setState(() {
                            index = ind;
                          });
                        },
                      ),
                    ),
                  if (util.isPhone) const SizedBox(height: 10),
                  if (util.isPhone)
                    SizedBox(
                      width: util.width,
                      child: MenuNavbar(
                        activeIndex: index,
                        changeIndex: (ind) {
                          setState(() {
                            index = ind;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //----------------MAIN SECTION
            Expanded(
              child: SizedBox(
                width: util.width * 0.8,
                child: Column(children: [
                  if (index == 0)
                    BooksPage(
                        util: util,
                        books: books,
                        favBooks: favBooks,
                        toggleFav: toggleFav),
                  if (index == 1)
                    Builder(builder: (context) {
                      List<BookModel> filteredBooks = [
                        ...books.where((book) => favBooks.contains(book.bookId))
                      ];
                      return FavoritePage(
                          util: util,
                          books: filteredBooks,
                          favBooks: favBooks,
                          toggleFav: toggleFav);
                    }),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
