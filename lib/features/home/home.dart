import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/providers/my_provider.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';
import 'package:islami_c10_str/features/home/tabs/ahadeth_tab.dart';
import 'package:islami_c10_str/features/home/tabs/quran_tab.dart';
import 'package:islami_c10_str/features/home/tabs/radio_tab.dart';
import 'package:islami_c10_str/features/home/tabs/sebha_tab.dart';
import 'package:islami_c10_str/features/qiblah/qiblah_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var mode = provider.themeMode;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'اسلامي',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.changeTheme(mode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
                  },
                  icon: mode == ThemeMode.light
                      ? const Icon(
                          Icons.sunny,
                          color: primaryColor,
                        )
                      : const Icon(
                          Icons.dark_mode,
                          color: primaryColor,
                        )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ic_ahadeth.png")),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_location),
                label: "",
              ),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    const SebhaTab(),
    const RadioTab(),
    const AhadethTab(),
    const QiblahView(),
  ];
}
