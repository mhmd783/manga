import 'package:flutter/material.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class TextFormFiledProfil extends StatelessWidget {
  TextFormFiledProfil(
      {super.key,
      required this.hintText,
      required this.controll,
      required this.sufixicon,
      //required this.controll,
      required this.keyboard});
  final String hintText;
  final Widget sufixicon;
  final TextEditingController controll;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          textAlign: TextAlign.start,
          keyboardType: keyboard,
          controller: controll,
          decoration: InputDecoration(
            hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15,
                fontWeight: FontWeight.w300),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hintText,
            prefixIcon: sufixicon,
          ),
        ),
      );
    });
  }
}
