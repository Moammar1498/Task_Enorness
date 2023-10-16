import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<dynamic> getProducts(BuildContext context) async {
    try {
      final url = Uri.parse(
          'https://targo-api.thesuitchstaging.com/api/vendor/dashboard');

      final response = await http.get(url, headers: {
        'Authorization': 'Bearer 850|JbzvxDbhd6I2AEsNs9ct7WMvZcveeDE8XqCrTBhl'
      });

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        debugPrint('Error occurred ${responseData['message']}');
        debugPrint(responseData.toString());
        return responseData;
      } else {
        debugPrint('Error occurred ${responseData['message']}');
        return responseData['message'];
      }
    } on SocketException {
      throw 'Please Check your internet connection';
    } catch (e) {
      debugPrint('an error occurred $e');
    }
  }
}
