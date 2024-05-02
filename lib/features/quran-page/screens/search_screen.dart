import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c10_str/features/quran-page/widgets/search_field.dart';

import '../service/cubit/quran_search_cubit.dart';
import '../widgets/aya_search_builder.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuranSearchCubit>(
      create: (BuildContext context) => QuranSearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('البحث عن آيه'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocBuilder<QuranSearchCubit, QuranSearchState>(
                builder: (context, state) {
                  return SearchFeild(
                    onChanged: (value) {
                      BlocProvider.of<QuranSearchCubit>(context)
                          .getSearchData(value, context);
                    },
                  );
                },
              ),
            ),
            BlocBuilder<QuranSearchCubit, QuranSearchState>(
              builder: (context, state) {
                if (state is QuranSearchLoading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is QuranSearchSuccess) {
                  if (state.model.isEmpty) {
                    return const Expanded(child: EmptySearchWidget());
                  } else {
                    return Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: AyahSearcBuilder(
                          model: state.model,
                        ),
                      ),
                    );
                  }
                } else {
                  return const Expanded(child: EmptySearchWidget());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.search),
        Text(
          'لا يوجد آيات لعرضها.\n قم بالبحث ',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
