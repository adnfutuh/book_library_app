import 'package:book_library_app/const/const.dart';
import 'package:book_library_app/data_provider/dummy.dart';
import 'package:book_library_app/models/book_model.dart';
import 'package:book_library_app/util/util.dart';
import 'package:book_library_app/widget/menu_navbar.dart';
import 'package:flutter/material.dart';

import '../widget/book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = Dummy.books;
  int index = 0;
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

            //-------------------MAIN SECTION

            //-------------------IF PHONE DEVICE
            if (util.isPhone)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookCard(book: books[index]);
                  },
                ),
              ),
            const SizedBox(height: 20),

            //-------------------MAIN SECTION

            //-------------------IF TABLET DEVICE
            if (util.isTablet)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookCard(book: books[index]);
                  },
                ),
              ),
            const SizedBox(height: 20),

            //-------------------MAIN SECTION

            //-------------------IF PC DEVICE
            if (util.isPc)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookCard(book: books[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
