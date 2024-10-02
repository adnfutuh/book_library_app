import 'package:book_library_app/const/const.dart';
import 'package:flutter/material.dart';

class MenuNavbar extends StatelessWidget {
  final int activeIndex;
  final Function(int) changeIndex;
  const MenuNavbar(
      {super.key, required this.changeIndex, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    List<NavItem> navItems = [
      NavItem(name: 'Home', icon: Icons.home),
      NavItem(name: 'Favorite', icon: Icons.favorite)
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(navItems.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              changeIndex(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  navItems[index].icon,
                  color: index == activeIndex ? Colors.black : Colors.white,
                ),
                const SizedBox(height: 5),
                if (index == activeIndex)
                  Text(
                    navItems[index].name,
                    style: defaultTxt.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class NavItem {
  final String name;
  final IconData icon;
  NavItem({
    required this.name,
    required this.icon,
  });
}
