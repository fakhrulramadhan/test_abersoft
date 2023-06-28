import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_abersoft/app/core/error_handling/exceptions.dart';
import 'package:test_abersoft/app/themes/theme_color.dart';
import 'package:test_abersoft/app/themes/theme_text_style.dart';

class FeedbackHelper {
  static alertDialog(
      {String? title,
      required String textBtn,
      required VoidCallback? onPressed,
      dynamic content,
      String? leading,
      VoidCallback? leadingOnPressed,
      bool barrierDismissible = false}) {
    if (content.runtimeType == String) {
      content = content;
    }

    Get.dialog(
        AlertDialog(
          title: title != null
              ? Text(
                  title,
                  style: ThemeTextStyle.textXlBold(),
                )
              : null,
          content: Text(content!.toString()),
          actions: [
            if (leading != null) ...{
              TextButton(
                  onPressed: leadingOnPressed,
                  child: Text(
                    leading,
                  )),
            },
            ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  textBtn,
                ))
          ],
        ),
        barrierDismissible: barrierDismissible);
  }

  static comingSoonAlertDialog() {
    alertDialog(
        title: 'Coming Soon',
        content: 'In development stage...',
        textBtn: 'Ok',
        onPressed: Get.back);
  }

  static snackBar(
      {String? title,
      required String message,
      bool? isValid,
      int? durationSeconds,
      bool mainButton = false,
      String? mainButtonText,
      VoidCallback? mainButtonPressed,
      Color? backgroundColor}) {
    if (Get.isSnackbarOpen) return;

    return Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        mainButton: mainButton == true
            ? TextButton(
                onPressed: mainButtonPressed,
                child: Text(
                  '$mainButtonText',
                  style: const TextStyle(color: Colors.white),
                ))
            : null,
        duration: durationSeconds == null
            ? const Duration(seconds: 2)
            : Duration(seconds: durationSeconds),
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        borderRadius: 8,
        backgroundColor: backgroundColor ??
            (isValid == true ? ThemeColor.success : ThemeColor.danger),
      ),
    );
  }

  static loading() {
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
  }

  static loadingDialog({String? loadingText, bool hideLoadingText = false}) {
    Get.dialog(
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(child: CircularProgressIndicator()),
              if (!hideLoadingText) ...{
                const SizedBox(height: 16),
                Builder(
                  builder: (context) {
                    if (loadingText != null) {
                      loadingText = loadingText;
                    } else {
                      loadingText = 'Harap Tunggu';
                    }

                    return Text(
                      '$loadingText',
                      style: ThemeTextStyle.textBase(),
                    );
                  },
                ),
              },
            ],
          ),
        ),
        barrierDismissible: false);
  }

  static closeLoading() {
    Get.back();
  }

  static catchOpenDialog(dynamic error, {isCloseLoading = true}) {
    if (isCloseLoading) {
      FeedbackHelper.closeLoading();
    }

    final title = ExceptionResponse.title(error);
    final message = ExceptionResponse.message(error);

    FeedbackHelper.alertDialog(
        title: "$title",
        content: "$message",
        textBtn: 'Ok',
        onPressed: () => Get.back());
  }

  static tryCatchOpenDialog(dynamic error, VoidCallback? onPressed,
      {bool closeLoading = true}) {
    if (closeLoading == true) {
      FeedbackHelper.closeLoading();
    }

    final title = ExceptionResponse.title(error);
    final message = ExceptionResponse.message(error);
    final statusCode = ExceptionResponse.statusCode(error);

    String textBtn;

    String? leading;
    VoidCallback? leadingOnPressed;

    switch (statusCode) {
      case 400:
      case 404:
        textBtn = 'Kembali';
        onPressed = () => Get.back();

        leading = null;
        leadingOnPressed = null;
        break;
      default:
        textBtn = 'Coba Lagi';
        leading = 'Kembali';
        leadingOnPressed = () => Get.back();
        break;
    }

    if (Get.isDialogOpen == true) {
      Get.close(1);
    }

    FeedbackHelper.alertDialog(
      title: title,
      content: message,
      textBtn: textBtn,
      onPressed: onPressed,
      leading: leading,
      leadingOnPressed: leadingOnPressed,
    );
  }
}
