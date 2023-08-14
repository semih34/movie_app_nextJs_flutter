import 'package:flutter/material.dart';

class NavigationBarItems {
  static const double _iconSize = 30;
  static const List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.movie_creation,
        color: Colors.white,
        size: _iconSize,
      ),
      label: "Movies",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.local_movies_outlined,
        color: Colors.white,
        size: _iconSize,
      ),
      label: "TV Series",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.child_care,
        color: Colors.white,
        size: _iconSize,
      ),
      label: "Kids",
    ),
  ];
}
