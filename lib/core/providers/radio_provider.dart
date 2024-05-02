import 'package:flutter/material.dart';
import 'package:islami_c10_str/features/radio/radio.dart';
import 'package:islami_c10_str/features/radio/radio_api.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radios = [];

  // get all radios and reciters list
  Future getLists() async {
    radios = await RadioApi().getRadiosList();
    notifyListeners();
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }
}
