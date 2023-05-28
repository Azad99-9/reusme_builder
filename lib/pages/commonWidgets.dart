import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class fourLineInput extends StatelessWidget {
  fourLineInput({
    super.key,
    required this.hinttext,
    required this.inputController,
  });

  TextEditingController inputController;
  String hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TextField(
            maxLines: 4,
            autocorrect: true,
            style: GoogleFonts.oswald(),
            controller: inputController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                hintStyle: GoogleFonts.oswald(
                    color: Colors.grey.withOpacity(0.5)),
                hintText: hinttext,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 0.5,
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.grey)))),
          ),
        ));
  }
}

Padding sectionHeading(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: GoogleFonts.oswald(fontSize: 18),
    ),
  );
}

class InputField extends StatefulWidget {
  InputField(
      {super.key, required this.hinttext, required this.inputController});

  String hinttext;
  TextEditingController inputController;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TextField(
            autocorrect: true,
            style: GoogleFonts.oswald(),
            controller: widget.inputController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                hintStyle:
                    GoogleFonts.oswald(color: Colors.grey.withOpacity(0.5)),
                hintText: widget.hinttext,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 0.5,
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.grey)))),
          ),
        ));
  }
}

Widget goToNextPage({required String preScreenName, required String nextScreenName,
    required void Function()? nextAction, required void Function()? preAction}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: preAction,
            child: Row(
              children: [Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black,), Text(preScreenName, style: GoogleFonts.oswald(color: Colors.black),)],
            )),
        TextButton(
            onPressed: nextAction,
            child: Row(
              children: [
                Text(nextScreenName, style: GoogleFonts.oswald(color: Colors.black),),
                Icon(Icons.keyboard_arrow_right_sharp, color: Colors.black,)
              ],
            ))
      ],
    ),
  );
}
