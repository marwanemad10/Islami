import 'package:flutter/material.dart';
import 'package:islami_c10_str/features/radio/radio_list.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/quran_header.png",
          height: 150,
        ),
        const Divider(
          thickness: 3,
          color: Color(0xFFB7935F),
        ),
        const Expanded(child: RadioListBuilder())
      ],
    );
  }
}
