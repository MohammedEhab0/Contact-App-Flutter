import 'dart:io';

import 'package:contactapp/Ui/Contacts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../Utils/AppColors.dart';
import '../ContactData.dart';
import 'CustemButton.dart';
import 'CustemTextField.dart';
import 'HomeScreen.dart';

class ContactDialog extends StatefulWidget {
  @override
  _ContactDialogState createState() => _ContactDialogState();
}

class _ContactDialogState extends State<ContactDialog> {
  final GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  File? selectedImage;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  Future<void> pickImageFrom() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: width,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.DarkBlue,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(40)), // Rounded top corners
        ),
        child: Form(
          key: formState,
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
                    onPressed: () {
                      pickImageFrom();
                    },
                    child: (selectedImage == null
                        ? Lottie.asset('assets/animation/image_picker.json',
                            height: height * 0.143)
                        : ClipOval(
                            child: Image.file(
                              selectedImage!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          )),
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
                            nameController.text.isEmpty
                                ? ''
                                : nameController.text,
                            style:
                                TextStyle(fontSize: 16, color: AppColors.gold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: AppColors.gold),
                              )),
                          child: Text(
                            emailController.text.isEmpty
                                ? ''
                                : emailController.text,
                            style:
                                TextStyle(fontSize: 16, color: AppColors.gold),
                          ),
                        ),
                        Text(
                          numberController.text.isEmpty
                              ? ''
                              : numberController.text,
                          style: TextStyle(fontSize: 16, color: AppColors.gold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              CustemTextField(
                controller: nameController,
                hint: 'Enter User Name',
                type: TextInputType.name,
              ),
              CustemTextField(
                controller: emailController,
                hint: 'Enter User Email',
                type: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              CustemTextField(
                controller: numberController,
                hint: 'Enter User Number',
                type: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomButton(
                enterUser: enterUser,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void enterUser() {
    if (formState.currentState!.validate()) {
      ContactData newUser = ContactData(
        id: Contacts.contactList.length + 1,
        image: selectedImage?.path ?? '',
        email: emailController.text,
        name: nameController.text,
        number: numberController.text,
      );

      Contacts.contactList.add(newUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Contact added successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}

Future<void> showContactDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        backgroundColor: Colors.transparent,
        child: ContactDialog(),
      );
    },
  );
}