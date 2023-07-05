import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/models/user_model.dart';

class AuthController extends BaseController {
  bool isIntro = true;
  bool isRegister = false;

  bool showPassword = false;

  List<String> firstNames = ['Sardorbek', 'Nodir', 'Egamberdi'];
  List<String> lastNames = ['Ismoilov', 'Abdulabbozov', 'Jabborov'];

  void changePasswordVisibility() {
    showPassword = !showPassword;
    update();
  }

  final RegExp regExpForPassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~_]).{8,}$');

  final formKeyRegister = GlobalKey<FormState>(debugLabel: 'register');
  final formKeyLogin = GlobalKey<FormState>(debugLabel: 'login');

  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();

  String username = '';
  String firstName = '';
  String lastName = '';
  String password = '';

  Future<void> login() async {
    final isValid = formKeyLogin.currentState?.validate();
    if (isValid == true) {
      formKeyLogin.currentState?.save();
      setLoading(true);
      formKeyLogin.currentState?.reset();
      Future.delayed(
        const Duration(seconds: 1),
        () async {
          await localSource
              .setUserDetails(
            UserModel(
              firstName: firstNames[Random().nextInt(3)],
              lastName: lastNames[Random().nextInt(3)],
              username: username,
              token: '',
            ),
          )
              .then(
            (value) {
              setLoading(false);
              Get.toNamed(AppRoutes.home);
            },
          );
        },
      );
    }
  }

  Future<void> register() async {
    final isValid = formKeyRegister.currentState?.validate();
    if (isValid == true) {
      formKeyRegister.currentState?.save();
      if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty) {
        setLoading(true);
        formKeyRegister.currentState?.reset();
        Future.delayed(
          const Duration(seconds: 1),
          () async {
            await localSource
                .setUserDetails(
              UserModel(
                firstName: firstName,
                lastName: lastName,
                username: username,
                token: '',
              ),
            )
                .then(
              (_) {
                setLoading(false);
                Get.toNamed(AppRoutes.home);
              },
            );
          },
        );
      }
    }
  }

  void changeAuthMode({required bool isRegister}) {
    this.isRegister = isRegister;
    isIntro = false;
    update();
  }
}
