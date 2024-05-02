import 'dart:developer';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:islami_c10_str/features/quran-page/providers/quran.dart';
import 'package:islami_c10_str/features/quran-page/quran-data/quran.dart';
import 'package:islami_c10_str/features/quran-page/screens/home_screen.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/quran_header.png",
            height: 150,
          ),
          const Divider(
            thickness: 3,
            color: Color(0xFFB7935F),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'القرآن الكريم',
              textAlign: TextAlign.center,
              style: getTitleStyle(context),
            ),
          ),
          const Divider(
            thickness: 3,
            color: Color(0xFFB7935F),
          ),
          Expanded(
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: Color(0xFFB7935F),
                    endIndent: 40,
                    indent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        int page = getSurahFirstPage(index + 1);
                        if (page == 0 && index != 0) {
                          page = getSurahFirstPage(index);
                        }
                        if (page == 0 && index != 0) {
                          page = getSurahFirstPage(index - 1);
                        }
                        quran.currentPage = page;
                        log(page.toString());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return QuranPagesView(page: page);
                        }));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xFFB7935F),
                            child: Text(
                              ArabicNumbers().convert(index + 1),
                              style: getBodyStyle(
                                context,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Gap(30),
                          Text(
                            suraName[index],
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Text(
                            getSurahData(index + 1),
                            style: getBodyStyle(
                              context,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: suraName.length,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
