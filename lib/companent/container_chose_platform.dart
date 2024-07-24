import 'package:flutter/material.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class PlatForm extends StatelessWidget {
  PlatForm({
    super.key,
    required this.text,
    required this.image,
    required this.color,
  });

  final String text;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 40,
              width: 40,
              child: Image.asset("$image"),
            ),
            Text("$text")
          ],
        ),
      );
    });
  }
}
