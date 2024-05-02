import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c10_str/core/providers/audio_player_provider.dart';
import 'package:islami_c10_str/core/providers/my_provider.dart';
import 'package:islami_c10_str/core/providers/radio_provider.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';
import 'package:islami_c10_str/features/hadith/hadeth_details.dart';
import 'package:islami_c10_str/features/home/home.dart';
import 'package:islami_c10_str/features/quran-page/providers/quran.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Quran>(
      create: (context) => Quran(),
    ),
    ChangeNotifierProvider<AudioPlayerProvider>(
      create: (_) => AudioPlayerProvider(),
    ),
    ChangeNotifierProvider<RadioProvider>(
      create: (_) => RadioProvider()..getLists(),
    ),
    ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
    ),
    ChangeNotifierProvider<Quran>(
      create: (context) => Quran(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      themeMode: provider.themeMode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      locale: const Locale('ar'),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
    );
  }
}
