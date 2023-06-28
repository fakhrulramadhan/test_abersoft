import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_abersoft/app/core/error_handling/exceptions.dart';
import 'package:test_abersoft/app/routes/app_pages.dart';

import '../../../core/helpers/feedback_helpers.dart';
import '../../../data/repositories/login_repository.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  LoginRepository repository;
  LoginController(this.repository);

  final loginFormKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final shownPassword = true.obs;
  final isLoadingAuth = false.obs;

  final count = 0.obs;

  void increment() => count.value++;

  void showPassword() {
    shownPassword.value = !shownPassword.value;
  }

  void onSubmit() async {
    print(usernameCtrl.text);
    print(passwordCtrl.text);
    if (loginFormKey.currentState!.validate()) {
      try {
        isLoadingAuth(true);
        await repository.login(
            username: usernameCtrl.text, password: passwordCtrl.text);
        isLoadingAuth(false);

        Get.offAndToNamed(Routes.HOME);
      } catch (error) {
        isLoadingAuth(false);
        String message = ExceptionResponse.message(error);
        FeedbackHelper.snackBar(message: message, isValid: false);
      }
    }
  }
}
