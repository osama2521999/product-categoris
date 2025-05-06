import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';

class ToastService {
  static void showErrorToast(String msg, {Toast? length}) {
    FToast fToast;
    fToast = FToast();
    fToast.init(navigatorKey.currentState!.context);

    fToast.showToast(
      isDismissible: true,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFCCD74).withOpacity(0.95),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                msg,
                style: Theme.of(navigatorKey.currentState!.context)
                    .textTheme
                    .titleSmall,
              ),
            ),
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.black.withOpacity(0.6),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showSuccessToast(String msg, {Toast? length}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 14,
      toastLength: length ?? Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
    );
  }
}
