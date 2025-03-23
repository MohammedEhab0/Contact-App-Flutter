import 'package:contactapp/Ui/HomeScreen/Contact.dart';
import 'package:contactapp/Ui/HomeScreen/EmtyHomeScreen.dart'; // Ensure this is the correct import
import 'package:contactapp/Utils/AppAssets.dart';
import 'package:contactapp/Utils/AppColors.dart';
import 'package:flutter/material.dart';

import '../ContactData.dart';
import '../Contacts.dart';
import 'Dialog.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactData> contactList = Contacts.contactList;

  void _showContactDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ContactDialog();
      },
    );
  }

  void deleteSelectedUser(int id) {
    setState(() {
      contactList.removeWhere((contact) => contact.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.DarkBlue,
      child: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Image.asset(AppAssets.Title),
            backgroundColor: AppColors.DarkBlue,
          ),
          body: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                child: contactList.isEmpty
                    ? EmtyHomeScreen() // Ensure this class is defined correctly
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .69,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: contactList.length,
                        itemBuilder: (context, index) {
                          return Contact(
                            deleteUser: deleteSelectedUser,
                            // Correctly pass the function reference
                            image: contactList[index].image,
                            name: contactList[index].name,
                            email: contactList[index].email,
                            number: contactList[index].number,
                            id: contactList[index].id, // Pass the id
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        showContactDialog(context);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.DarkBlue,
                      ),
                      backgroundColor: AppColors.gold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(height: 10),
                    (contactList.isNotEmpty
                        ? FloatingActionButton(
                            onPressed: () {
                              Contacts.contactList.removeLast();
                              setState(() {});
                            },
                            child: Icon(
                              Icons.delete,
                              color: AppColors.White,
                            ),
                            backgroundColor: AppColors.Red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : SizedBox()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}