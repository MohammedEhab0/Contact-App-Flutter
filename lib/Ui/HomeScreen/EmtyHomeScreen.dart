import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Make sure to import Lottie

import '../../Utils/AppColors.dart';

class EmtyHomeScreen extends StatelessWidget {
  // Fixed missing semicolon

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/animation/empty_list.json'),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'There are no contacts added here',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.gold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
