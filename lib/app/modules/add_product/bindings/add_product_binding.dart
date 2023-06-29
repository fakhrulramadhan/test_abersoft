import 'package:get/get.dart';
import 'package:test_abersoft/app/data/providers/product_provider.dart';
import 'package:test_abersoft/app/data/repositories/product_repository.dart';

import '../controllers/add_product_controller.dart';
import '../../';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(ProductRepository(ProductProvider())),
    );
  }
}
