// add_contact_dialog.dart
import 'package:flutter/material.dart';
import '../../Utils/AppAssets.dart';
import '../../Utils/AppColors.dart';
import 'CustemButton.dart';
import 'CustemTextField.dart';

void ContactDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: AppColors.shadow,
    barrierLabel: 'Dismiss',
    // Add a barrier label for accessibility
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Scaffold(
        backgroundColor: Colors.transparent, // Make the background transparent
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // Align content to the bottom
          children: [
            Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.DarkBlue,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40)), // Rounded top corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          side: BorderSide(
                            color: AppColors.gold,
                            width: 1,
                          ),
                        ),
                        onPressed: () {},
                        child: AppAssets.AddImage(context),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(color: AppColors.gold),
                              )),
                              child: Text(
                                'User  Name',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.gold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(color: AppColors.gold),
                              )),
                              child: Text(
                                ' example@email.com',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.gold),
                              ),
                            ),
                            Text(
                              '+2000000000',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.gold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  CustemTextField(
                    hint: 'Enter User Name',
                    type: TextInputType.name,
                  ),
                  CustemTextField(
                    hint: 'Enter User Email',
                    type: TextInputType.emailAddress,
                  ),
                  CustemTextField(
                    hint: 'Enter User Number',
                    type: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  CustomButton(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
