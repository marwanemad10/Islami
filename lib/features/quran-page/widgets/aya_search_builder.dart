import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';
import 'package:islami_c10_str/features/quran-page/widgets/search_item.dart';
import 'package:provider/provider.dart';

import '../providers/quran.dart';
import '../quran-data/quran_model.dart';

class AyahSearcBuilder extends StatelessWidget {
  const AyahSearcBuilder({
    super.key,
    required this.model,
  });
  final List<QuranModel2> model;

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'عدد مرات التكرار : ',
              style: getBodyStyle(
                context,
              ),
            ),
            const Gap(10),
            Text(
              ArabicNumbers().convert(model.length.toString()),
              style: getTitleStyle(context, color: primaryColor),
            ),
          ],
        ),
        const Gap(10),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    quran.goToPage(int.parse(model[index].page ?? '') - 1);
                    Navigator.pop(context);
                  },
                  child: SearchItemWidget(
                    model: model[index],
                    index: index + 1,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: model.length),
        ),
      ],
    );
  }
}
