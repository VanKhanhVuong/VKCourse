import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Bài viết',
        ),
      ],
    );
  }
}

class CustomNavigationRail extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationRail({
    Key? key,
    required this.currentIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Trang chủ'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.book),
          label: Text('Bài viết'),
        ),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      leading: Container(
        color: Colors.amber,
      ),
      labelType: NavigationRailLabelType.all,
    );
  }
}
