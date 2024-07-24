import 'package:flutter/material.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class TextFormFiledAppVerfyEmail extends StatelessWidget {
  TextFormFiledAppVerfyEmail({
    super.key,
    required this.controll,
  });
  final TextEditingController controll;
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
          }
          return null;
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        controller: controll,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 15,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );});
  }
}
