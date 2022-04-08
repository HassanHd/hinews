import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/view/Screenes/categoryscreen.dart';

import '../../constant.dart';

class CategoriesButton extends StatelessWidget {
  String textCategories;
  Color colorButton;

  CategoriesButton({required this.textCategories, required this.colorButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CategoryScreen(textCategories);
            },
          ));
        },
        color: colorButton,
        child: Text(
          "$textCategories",
          style: TextStyle(fontWeight: FontWeight.w800, color: white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
