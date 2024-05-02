import 'package:arabic_numbers/arabic_numbers.dart';

import 'page_data.dart';
import 'surah_data.dart';

String getSurahData(int surahNumber) {
  return '${getPlaceOfRevelation(surahNumber)}, آياتها ${ArabicNumbers().convert((getNumberOfAyahs(surahNumber)).toString())}';
}

String getSurahDataWithName(int page) {
  return 'سورة ${getSurahName(page)} (${getSurahData(page)})';
}

// simple methods
int getSurahNumberByPage(int page) {
  return quranPages[page - 1].surah;
}

String getSurahName(int page) {
  return getSurahNameArabic(getSurahNumberByPage(page));
}

int getNumberOfAyahs(int surahNumber) {
  return surah[surahNumber - 1]['aya'] as int;
}

String getSurahNameArabic(int surahNumber) {
  return surah[surahNumber - 1]['arabic'] as String;
}

String getPlaceOfRevelation(int surahNumber) {
  return surah[surahNumber - 1]['place'] as String;
}

int getSurahFirstPage(int surahNumber) {
  return quranPages.indexWhere((page) => page.surah == surahNumber) + 1;
}

String pageDir(int number) {
  return 'assets/quran-images/page${formattedPageNumber(number)}.png';
}

String formattedPageNumber(int number) {
  if (number < 10) return '00$number';
  if (number < 100) return '0$number';
  return '$number';
}
