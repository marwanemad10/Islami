import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Image.network(
          'https://github.com/Mohamed-Nagdy/Quran-App-Data/blob/main/quran_images_new_2/102.png'),
    );
  }
}
