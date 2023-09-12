import 'package:flutter/material.dart';

class PageViewModel extends ChangeNotifier {
  final _pageController = PageController(initialPage: 0);
  get pageController => _pageController;

  int _pageIndex = 0;
  get pageIndex => _pageIndex;

  void pageViewChange(newPageIndex) {
    _pageIndex = newPageIndex;
    notifyListeners();
  }

  void bottomNavTap(pageIndex) {
    _pageController.animateToPage(
      _pageIndex,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}
