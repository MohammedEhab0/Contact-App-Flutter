import 'package:contactapp/Utils/AppAssets.dart';
import 'package:contactapp/Utils/AppColors.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final String name;
  final String email;
  final String number;
  final String image;
  final int id;
  final Function(int) deleteUser;

  Contact({
    required this.image,
    required this.name,
    required this.email,
    required this.number,
    required this.id,
    required this.deleteUser,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextStyle textStyle = TextStyle(color: AppColors.DarkBlue, fontSize: 10);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      width: width * 0.44,
      height: height * 0.33,
      // Adjusted height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                AppAssets.El_balf,
                fit: BoxFit.cover, // Ensure the image covers the area
                width: width,
                height: height * 0.2,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * .02, vertical: height * .01),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  name,
                  style: textStyle,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10), // Added spacing
                Row(
                  children: [
                    Image.asset(AppAssets.email, color: AppColors.DarkBlue),
                    SizedBox(width: 5),
                    Text(
                      email,
                      style: textStyle,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(AppAssets.call, color: AppColors.DarkBlue),
                    SizedBox(width: 5),
                    Text(
                      number,
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: ElevatedButton(
                onPressed: () {
                  deleteUser(id); // Call deleteUser  with the id
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Delete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.Red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
