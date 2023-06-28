import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/utils/environment_util.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // final box = GetStorage();
  // final getEnvState = box.read('ENV_STATE');

  // EnvironmentState environmentState;

  // if (getEnvState == null || getEnvState == EnvironmentState.test.toString()) {
  //   environmentState = EnvironmentState.test;
  // } else {
  //   environmentState = EnvironmentState.test;
  // }

  // await EnvironmentUtil.initializeApp(state: environmentState);

  await EnvironmentUtil.initializeApp(state: EnvironmentState.test);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
