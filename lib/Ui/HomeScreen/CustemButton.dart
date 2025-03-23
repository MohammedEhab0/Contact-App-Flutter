import 'package:contactapp/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function enterUser;

  CustomButton({required this.enterUser});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        enterUser();
      },
      child: Text(
        'Enter User',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.DarkBlue,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gold,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
