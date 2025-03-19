import 'package:flutter/material.dart';

import '../../Utils/AppColors.dart';

class CustemTextField extends StatelessWidget {
  String hint;
  TextInputType type;

  CustemTextField({required this.hint, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5), // Add margin of 10
        child: TextFormField(
          keyboardType: type,
          decoration: InputDecoration(
            fillColor: AppColors.DarkBlue,
            hintStyle: TextStyle(color: AppColors.LiteBlue),
            hintText: hint,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.gold),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.gold),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.gold),
            ),
          ),
        ));
  }
}
