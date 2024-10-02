import 'package:book_library_app/const/const.dart';
import 'package:book_library_app/util/util.dart';
import 'package:book_library_app/widget/menu_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Util util = Util(context: context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: util.width,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: !util.isPhone
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Book Library",
                    style: defaultTxt.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
                  //                  if (util.isPhone) const SizedBox(height: 10),
                  // if (util.isPhone)
                  //   SizedBox(
                  //     width: util.width,
                  //     child: MenuNavbar(
                  //       activeIndex: index,
                  //       changeIndex: (ind) {
                  //         setState(() {
                  //           index = ind;
                  //         });
                  //       },
                  //     ),
                  //   )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
