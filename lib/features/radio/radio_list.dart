import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/providers/radio_provider.dart';
import 'package:islami_c10_str/features/radio/radio.dart';
import 'package:islami_c10_str/features/radio/radio_widget.dart';
import 'package:provider/provider.dart';

class RadioListBuilder extends StatefulWidget {
  const RadioListBuilder({super.key});

  @override
  State<RadioListBuilder> createState() => _RadioListBuilderState();
}

class _RadioListBuilderState extends State<RadioListBuilder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<RadioModel> radiosList = context.watch<RadioProvider>().radios;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thickness: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: RadioWidget(
                  radioModel: radiosList[index],
                  index: index,
                ),
              );
            },
            itemCount: radiosList.length,
          ),
        ),
      ),
    );
  }
}
