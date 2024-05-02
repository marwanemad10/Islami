import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../quran-data/page_data.dart';
import '../quran-data/quran.dart';

class Quran extends ChangeNotifier {
  late int currentPage;

  final carouselController = CarouselController();

  int get surahNumber => quranPages[currentPage - 1].surah;

  String get surahName => getSurahNameArabic(surahNumber);

  int get juz => quranPages[currentPage - 1].juz;





  void goToPage(int pageIndex) {
    carouselController.jumpToPage(pageIndex);
  }

  void changePage(int newIndex) {
    currentPage = newIndex + 1;
    notifyListeners();
  }
}
