import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c10_str/features/hadith/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
          ),
        ),
        body: model.content.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    endIndent: 50,
                    indent: 50,
                    color: Color(0xffB7935F),
                  ),
                  itemBuilder: (context, index) {
                    return Text(
                      "${model.content[index]} (${index + 1})",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style:
                          GoogleFonts.elMessiri(fontSize: 20, letterSpacing: 1),
                    );
                  },
                  itemCount: model.content.length,
                ),
              ),
      ),
    );
  }
}
