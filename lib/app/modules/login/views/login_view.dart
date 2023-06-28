import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 250,
                decoration: const BoxDecoration(
                  //color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/pictures/abersoft.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Form(
                          key: controller.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    labelText: "Username",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(),
                                      child: Icon(Icons.person_outline),
                                    )),
                                controller: controller.usernameCtrl,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Username wajib di isi'),
                                ]),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ).marginOnly(bottom: 16),
                              Obx(() => TextFormField(
                                    controller: controller.passwordCtrl,
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Password wajib di isi'),
                                    ]),
                                    obscureText: controller.shownPassword.value,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.only(),
                                        child: Icon(Icons.lock_outline),
                                      ),
                                      suffixIcon: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Icon(
                                            controller.shownPassword.value
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                        onTap: () {
                                          controller.showPassword();
                                        },
                                      ),
                                    ),
                                  ).marginOnly(bottom: 16)),
                              Obx(
                                () => ElevatedButton(
                                  onPressed: () {
                                    controller.onSubmit();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(42)),
                                  child: controller.isLoadingAuth.value == true
                                      ? SizedBox(
                                          width: 24,
                                          height: 24,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.green,
                                          ).paddingAll(2),
                                        )
                                      : const Text(
                                          'Log In',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                ).marginOnly(bottom: 8),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
