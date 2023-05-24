import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:untitled2/global/constant.dart';

class ApiService {
  Map<String, String> header(String clientID, String time, String checkSum) {
    return {
      "clientId": clientID,
      "time": time,
      "checkSum": checkSum,
    };
  }

  getAPI(String url, String getURL) async {
    try {
      Uri uri = Uri.parse(url);
      DateTime now = DateTime.now();
      String time = (now.millisecondsSinceEpoch ~/ 1000).toString();
      String md5String = 'GET$getURL$clientId$secret$time';
      String checkSum = crypto.md5.convert(utf8.encode(md5String)).toString();
      print("$checkSum $time $uri");
      var response =
          await http.get(uri, headers: header(clientId, time, checkSum));
      // print(response.body);
      // print(response.statusCode);
      // print(url);
      int status = response.statusCode;
      if (status == 200) {
        String data = response.body;
        return data;
      } else {
        return null;
      }
    } catch (_) {
      print(_);
      return null;
    }
  }
}
