import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';
import 'package:islami_c10_str/core/utils/my_theme.dart';
import 'package:islami_c10_str/core/widgets/play_button.dart';
import 'package:islami_c10_str/features/radio/radio.dart';

class RadioWidget extends StatelessWidget {
  final int index;
  final RadioModel radioModel;
  const RadioWidget({super.key, required this.radioModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        trailing: PlayButton(
          index: index,
          url: radioModel.url,
        ),
        title: Text(
          radioModel.name,
          textDirection: TextDirection.rtl,
          style: getTitleStyle(context, color: Colors.white),
        ),
      ),
    );
  }
}
