import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  addOne() {
    setState(() {
      counter++;
    });
  }

  reset() {
    setState(() {
      counter = 0;
    });
  }

  List sebhaTitle = [
    'سُبْحَانَ اللَّهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ',
    'سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
    'لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
    'الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ',
    'الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد',
    'أستغفر الله',
    'سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
    'الْلَّهُ أَكْبَرُ',
    'اللَّهُ أَكْبَرُ كَبِيرًا ، وَالْحَمْدُ لِلَّهِ كَثِيرًا ، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلاً',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 70,
              child: Center(
                child: Text(
                  '<<<قم بالتمرير للمزيد من التسابيح>>>',
                  style: getTitleStyle(context),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: CarouselSlider.builder(
                  itemCount: sebhaTitle.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor,
                        ),
                        child: Text(
                          sebhaTitle[index],
                          textAlign: TextAlign.center,
                          style: getTitleStyle(context,
                              fontSize: 27, color: Colors.white),
                        ));
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        counter = 0;
                      });
                    },
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    autoPlayInterval: const Duration(seconds: 3),
                  )),
            ),
            const Gap(30),
            Expanded(
              child: Center(
                child: Text(
                  counter.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          addOne();
                        },
                        child: const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 50,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 50,
                          ),
                        )),
                  ),
                  Expanded(
                    child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          reset();
                        },
                        icon: const Icon(Icons.refresh_outlined)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
