import 'package:flutter/material.dart';

import '../quran-data/quran.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pageDir(pageIndex + 1),
      fit: BoxFit.fill,
    );
  }
}
