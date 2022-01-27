import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:DungxApp/utils/storage.dart';
import 'package:DungxApp/widgets/button.dart';
import 'package:DungxApp/widgets/text_input.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Widget _avatarWidget() {
    return Container(
        margin: const EdgeInsets.only(top: 44),
        child: Center(
            child: Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      image: NetworkImage(StorageConstants.defaultAvatar))),
            ),
            Positioned(
                top: 70,
                right: 0,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primary),
                  child: const Icon(
                    AppIcon.ic_camera,
                    size: 18,
                    color: AppColors.white,
                  ),
                ))
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text('Profile', style: Theme.of(context).textTheme.headline3),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.3,
      ),
      body: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _avatarWidget(),
                    TextInput(
                      mTop: 40,
                      mBottom: 16,
                      hintText: 'Full name',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    TextInput(
                      mBottom: 16,
                      hintText: 'Enter Email',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    TextInput(
                      mBottom: 16,
                      hintText: 'Country',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    TextInput(
                      mBottom: 16,
                      hintText: 'Birthday',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  title: 'Save',
                  onPress: () {},
                ),
              )
            ],
          )),
    );
  }
}
