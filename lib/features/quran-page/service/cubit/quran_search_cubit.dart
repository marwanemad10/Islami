import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c10_str/features/quran-page/quran-data/quran_model.dart';

part 'quran_search_state.dart';

class QuranSearchCubit extends Cubit<QuranSearchState> {
  QuranSearchCubit() : super(QuranSearchInitial());

  static QuranSearchCubit get(context) => BlocProvider.of(context);

  List<QuranModel2> ayahList = [];
  Future<void> getSearchData(String searchKey, context) async {
    emit(QuranSearchLoading());
    try {
      if (searchKey.isEmpty) {
        ayahList.clear();
        emit(QuranSearchSuccess(model: []));
      } else {
        ayahList.clear();
        await DefaultAssetBundle.of(context)
            .loadString('assets/files/tafseer.json')
            .then((value) {
          var list = parseJson(value.toString());
          for (var element in list) {
            if (element.aya_text_emlaey!.trim().contains(searchKey.trim())) {
              ayahList.add(element);
            }
          }
          list.clear();
        });
        emit(QuranSearchSuccess(model: ayahList));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(QuranSearchError());
    }
  }

  List<QuranModel2> parseJson(String response) {
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<QuranModel2>((json) => QuranModel2.fromJson(json))
        .toList();
  }
}
