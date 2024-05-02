import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c10_str/core/utils/font_styles.dart';

class SearchFeild extends StatefulWidget {
  const SearchFeild(
      {super.key, required this.onChanged, this.hintText = 'إبحث عن آيه'});

  final void Function(String) onChanged;
  final String hintText;

  @override
  State<SearchFeild> createState() => _SearchFeildState();
}

class _SearchFeildState extends State<SearchFeild> {
  late TextEditingController textController;
  // late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    // focusNode = FocusNode();
    // focusNode.requestFocus();
  }

  @override
  void dispose() {
    textController.dispose();
    // focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      style: getBodyStyle(context, color: Colors.black),
      onChanged: widget.onChanged,
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"^[\u0621-\u064A_ -]+"))
      ], // Only arabic char
      // focusNode: focusNode,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 50),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        hintText: widget.hintText,
        border: _inputBorder(),
        prefixIcon: const Icon(
          Icons.search,
          size: 16,
        ),
        hintStyle:
            TextStyle(fontSize: 15, fontFamily: GoogleFonts.cairo().fontFamily),
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 3,
        color: Color(0xffB7935F),
      ),
    );
  }
}
