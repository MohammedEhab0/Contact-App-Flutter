import 'package:contactapp/Utils/AppAssets.dart';
import 'package:contactapp/Utils/AppColors.dart';
import 'package:flutter/material.dart';

import 'Dialog.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.DarkBlue,
      child: SafeArea(
        minimum: EdgeInsets.all(10),
        bottom: true,
        right: true,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: AppAssets.Title,
            backgroundColor: AppColors.DarkBlue,
          ),
          body: Column(
            children: [
              Spacer(),
              Image.asset("assets/images/list-purple-Xetxuqguwn.png"),
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
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => ContactDialog(context),
                  child: Icon(
                    Icons.add,
                    color: AppColors.DarkBlue,
                  ),
                  backgroundColor: AppColors.gold,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
