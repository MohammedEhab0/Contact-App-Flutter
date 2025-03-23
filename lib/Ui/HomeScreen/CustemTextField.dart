import 'package:flutter/material.dart';

import '../../Utils/AppColors.dart';

class CustemTextField extends StatelessWidget {
  final String hint;
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Added validator parameter

  CustemTextField({
    required this.hint,
    required this.type,
    required this.controller,
    this.validator, // Make it optional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
        style: TextStyle(color: AppColors.LiteBlue),
        controller: controller,
        keyboardType: type,
        validator: validator,
        // Use the validator here
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
      ),
    );
  }
}