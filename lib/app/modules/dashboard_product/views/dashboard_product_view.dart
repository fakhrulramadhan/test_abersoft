import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_product_controller.dart';

class DashboardProductView extends GetView<DashboardProductController> {
  const DashboardProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
