import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_abersoft/app/core/error_handling/exceptions.dart';
import 'package:test_abersoft/app/core/helpers/feedback_helpers.dart';
import 'package:test_abersoft/app/data/repositories/product_repository.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController

  ProductRepository repository;

  AddProductController(this.repository);

  final count = 0.obs;
  final _validateMode = false.obs;

  final ImagePicker picker = ImagePicker();

  XFile? image; //enggak bisa dipanntau karena tipenya bukan rx

  final attendanceFile = <String, dynamic>{'name': null, 'path': null};

  final ImagePicker _picker = ImagePicker();

  List<XFile>? _imageFileList;

  final loginformKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormBuilderState>();
  final productnameCtrl = TextEditingController();
  final productdescCtrl = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;

  Future<XFile?> pickImage() async {
    // Pick an image
    //final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    //td enggak muncul karena taruh xfilenya disini, bukan diluar
    image = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1200,
        maxHeight: 1200,
        requestFullMetadata: true);

    update();
    return null; //update diseluruhnya
  }

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  Future<bool> takePicture() async {
    try {
      final XFile? photo = await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 20,
          preferredCameraDevice: CameraDevice.front);

      _setImageFileListFromFile(photo);

      attendanceFile.addAll({
        'path': photo?.path,
        'name': photo?.name,
      });

      return photo != null ? true : false;
    } catch (error) {
      FeedbackHelper.alertDialog(
          title: 'Terjadi kesalahan',
          content: '$error',
          textBtn: 'Ok',
          onPressed: Get.back);
      return false;
    }
  }

  //set lat longnya disini
  Future<void> postProduct({required Map resultData}) async {
    try {
      FeedbackHelper.loadingDialog();
      await repository.postProduct(resultData);
    } catch (error) {
      FeedbackHelper.catchOpenDialog(error);
    }
  }

  void onSubmit() async {
    //formKey.currentState?.removeInternalFieldValue('date_range');

    if (formKey.currentState?.saveAndValidate() ?? false) {
      try {
        final resultBody = formKey.currentState!.value;

        FeedbackHelper.loadingDialog();
        final resLeaveData = await repository.postProduct(resultBody);

        FeedbackHelper.closeLoading();

        FeedbackHelper.alertDialog(
            title: 'Berhasil',
            content: "Data Produk sukses ditambahkan",
            textBtn: 'Kembali',
            onPressed: () => Get.back(closeOverlays: true));
      } catch (error) {
        FeedbackHelper.closeLoading();
        final title = ExceptionResponse.message(error, 0);
        final message = ExceptionResponse.message(error);

        FeedbackHelper.alertDialog(
            title: title,
            content: message,
            textBtn: 'Ok',
            onPressed: () => Get.back());
      }
    } else {
      FeedbackHelper.snackBar(message: 'Harap periksa kembali', isValid: false);
      _validateMode(true);
    }
  }
}
