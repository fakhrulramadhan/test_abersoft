import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AddProductView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        //controller: controller,
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Create Product",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Column(
                  children: [
                    GetBuilder<AddProductController>(
                      builder: (controller) {
                        if (controller.image != null) {
                          //sudah pasti ada
                          return Container(
                            child: SizedBox(
                              height: 130,
                              width: 130,
                              //pilih yang image file, karena membutuhkan direktori path file dari hpnya
                              child: GestureDetector(
                                onTap: () async {
                                  await controller.pickImage();
                                },
                                //color: Colors.transparent,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: Image.file(
                                          File(controller.image!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.4,
                                        child: Container(
                                          color: Colors.black,
                                          height: 120,
                                          width: 120,
                                          child: const Icon(
                                            Icons.photo,
                                            size: 35.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // child: Image.file(
                              //   File(controller.image!.path),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          );
                        } else {
                          return Container(
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              //pilih yang image file, karena membutuhkan direktori path file dari hpnya
                              child: GestureDetector(
                                onTap: () async {
                                  controller.pickImage();
                                },
                                //color: Colors.transparent,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        height: 120,
                                        width: 120,
                                        child: const Icon(
                                          Icons.photo,
                                          size: 35.0,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // child: Image.file(
                              //   File(controller.image!.path),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Product Name",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(Icons.person_outline),
                          )),
                      controller: controller.productnameCtrl,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Product Name is required'),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ).marginOnly(bottom: 16),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Product Description",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(Icons.person_outline),
                          )),
                      controller: controller.productnameCtrl,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Product Description is required'),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ).marginOnly(bottom: 16),
                    ElevatedButton(
                      onPressed: () {
                        controller.onSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(42)),
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
