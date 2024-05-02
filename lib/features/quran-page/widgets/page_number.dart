import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:provider/provider.dart';

import '../providers/quran.dart';

class PageNumber extends StatelessWidget {
  const PageNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);

    String number = ArabicNumbers().convert((quran.currentPage).toString());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Text('صفحة $number',
          textAlign: TextAlign.center,
          style: getBodyStyle(
            context,
          )),
    );
  }
}
