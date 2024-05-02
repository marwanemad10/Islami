import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';

import '../quran-data/quran_model.dart';

class SearchItemWidget extends StatelessWidget {
  final QuranModel2 model;
  final int index;

  const SearchItemWidget({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          )),
      child: Column(
        children: [
          // top bar of ayah widget
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      border: Border.symmetric(
                          vertical: BorderSide(
                              color: Theme.of(context).colorScheme.surface,
                              width: 2))),
                  width: double.infinity,
                  // Counter
                  child: Row(
                    children: [
                      // BorderNumber(number: index),
                      const Gap(10),
                      Text(
                        'سورة ${ArabicNumbers().convert(
                          model.sura_name_ar.toString(),
                        )}',
                        style: getTitleStyle(context, color: primaryColor),
                      ),
                      const Spacer(),
                      Text(
                        'الصفحة : ${ArabicNumbers().convert(model.page.toString())}',
                        style: getTitleStyle(context, color: primaryColor),
                      ),
                      const Gap(20),
                    ],
                  ),
                  //
                ),
              ),
            ],
          ),
          //
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: model.aya_text
                                ?.substring(0, model.aya_text!.length - 1) ??
                            '',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.lateef().fontFamily,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: primaryColor,
                            child: Text(
                              ' ${ArabicNumbers().convert(model.aya_no.toString())} ',
                              style: getBodyStyle(context, color: Colors.white),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20 + 5,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.lateef().fontFamily,
                          color: Colors.black,
                        ),
                      )
                    ]),
                  )
                ])),
          )
        ],
      ),
    );
  }
}
