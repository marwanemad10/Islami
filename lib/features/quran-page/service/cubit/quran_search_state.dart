part of 'quran_search_cubit.dart';

abstract class QuranSearchState {}

class QuranSearchInitial extends QuranSearchState {}

class QuranSearchLoading extends QuranSearchState {}

class QuranSearchSuccess extends QuranSearchState {
  final List<QuranModel2> model;

  QuranSearchSuccess({required this.model});
}

class QuranSearchError extends QuranSearchState {}
