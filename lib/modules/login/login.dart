import 'package:DungxApp/modules/login/auth_controller.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/widgets/button.dart';
import 'package:DungxApp/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final currentState = controller.loginFormKey.currentState;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
        ),
        body: Container(
          height: Constants(context).height,
          color: Theme.of(context).backgroundColor,
          child: SingleChildScrollView(
              child: Form(
                  key: controller.loginFormKey,
                  autovalidateMode:
                      currentState != null && !currentState.validate()
                          ? AutovalidateMode.onUserInteraction
                          : null,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(right: 20, left: 20, top: 10),
                        constraints: const BoxConstraints.expand(height: 130),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 50, right: 24, left: 24),
                        child: Column(
                          children: [
                            TextInput(
                                hintText: 'Email',
                                controller: controller.loginEmailController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                validator: (value) {
                                  final text =
                                      controller.loginEmailController.text;
                                  return controller.validateEmail(value, text);
                                }),
                            TextInput(
                                hintText: 'Password',
                                controller: controller.loginPasswordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (value) {
                                  final text =
                                      controller.loginPasswordController.text;
                                  return controller.validatePassword(
                                      value, text);
                                }),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 24),
                        alignment: Alignment.centerLeft,
                        child: const Text('Forgot password?',
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 12)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 24, right: 24, bottom: 20),
                          child: Button(
                            onPress: () {
                              controller.login(context);
                            },
                            title: 'LOGIN'.tr,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Don’t have account?',
                              style: TextStyle(fontSize: 12)),
                          Text(' Register now',
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 12)),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32, bottom: 24),
                        child: const Text('Or log in with',
                            style: TextStyle(fontSize: 12)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            constraints: const BoxConstraints.expand(
                                height: 40, width: 40),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icFacebook.png'),
                                    fit: BoxFit.contain)),
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(
                                height: 40, width: 40),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/icApple.png'),
                                    fit: BoxFit.contain)),
                          ),
                          Container(
                            constraints: const BoxConstraints.expand(
                                height: 40, width: 40),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icGoogle.png'),
                                    fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ));
  }
}
