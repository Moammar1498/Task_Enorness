import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task_enorness/utils/appcolors.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static snackBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Card(
          color: AppColors.primaryColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Container(
            color: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  static String handleException(dynamic e, BuildContext context) {
    if (e is SocketException) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No Internet Connection')));
      return "Network Error: Please check your internet connection.";
    } else if (e is HttpException) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An error occurred while fetch response')));
      return "HTTP Error ${e.hashCode}: ${e.message}";
    } else if (e is FormatException) {
      return "Invalid Response Format.";
    } else if (e is FormatException) {
      return "JSON Parsing Error: ${e.message}";
    } else {
      return "An unexpected error occurred. Please try again later.";
    }
  }

  static bool isValidEmail(String email) {
    // Regular expression for email validation
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
