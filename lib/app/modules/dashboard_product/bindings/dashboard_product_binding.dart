import 'package:get/get.dart';

import '../controllers/dashboard_product_controller.dart';

class DashboardProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProductController>(
      () => DashboardProductController(),
    );
  }
}
