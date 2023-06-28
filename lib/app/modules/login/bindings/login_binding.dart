import 'package:get/get.dart';

import '../../../data/providers/login_provider.dart';
import '../../../data/repositories/login_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(LoginRepository(LoginProvider())),
    );
  }
}
