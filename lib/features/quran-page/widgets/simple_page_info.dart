import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';
import 'package:islami_c10_str/features/quran-page/screens/search_screen.dart';
import 'package:provider/provider.dart';

import '../providers/quran.dart';

class SimplePageInfo extends StatelessWidget {
  const SimplePageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    String number = (quran.juz).toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'سورة ${quran.surahName}',
            style: getBodyStyle(
              context,
            ),
          ),
          Text(
            'الجزء $number',
            style: getBodyStyle(
              context,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: const Icon(
                Icons.search_rounded,
                color: primaryColor,
              ))
        ],
      ),
    );
  }
}
