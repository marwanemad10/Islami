import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../providers/quran.dart';
import '../quran-data/page_data.dart';
import '../widgets/page_number.dart';
import '../widgets/quran_page.dart';
import '../widgets/simple_page_info.dart';

class QuranPagesView extends StatefulWidget {
  const QuranPagesView({super.key, required this.page});
  final int page;

  @override
  State<QuranPagesView> createState() => _QuranPagesViewState();
}

class _QuranPagesViewState extends State<QuranPagesView> {
  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final quranListenFalse = Provider.of<Quran>(context, listen: false);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GestureDetector(
      onTap: () {},
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: CarouselSlider.builder(
                    carouselController: quran.carouselController,
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: double.infinity,
                        initialPage: widget.page - 1,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        onPageChanged: (int newIndex, _) {
                          quranListenFalse.changePage(newIndex);
                        }),
                    itemCount: quranPages.length,
                    itemBuilder: (_, pageIndex, __) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SimplePageInfo(),
                          const Gap(5),
                          Expanded(
                            child: QuranPage(
                              pageIndex: pageIndex,
                            ),
                          ),
                          const PageNumber()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
