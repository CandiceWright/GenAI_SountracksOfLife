import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServerService {
  static ServerService sharedInstance = ServerService();
  //final baseUrl = "api.coveo.app";
  String serverUrl = "http://localhost:7342";

  Future<String> generateSong(
      String genre,
      String emotion1,
      String emotion2,
      String gratitudeText,
      String bestQuality,
      String worstQuality,
      String dream,
      String bestThisMonth) async {
    // var url = Uri.parse('$serverUrl/plan/$prompt');
    var url = Uri.parse('$serverUrl/songlyrics');
    var body = {
      'genre': genre,
      'emotion1': emotion1,
      'emotion2': emotion2,
      'gratitudeText': gratitudeText,
      'bestQuality': bestQuality,
      'worstQuality': worstQuality,
      'dream': dream,
      'bestThisMonth': bestThisMonth,
    };
    String bodyF = jsonEncode(body);
    //print(bodyF);

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: bodyF);
    // var response =
    //     await http.get(url, headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      //var decodedBody = json.decode(response.body);

      return response.body;
    } else {
      debugPrint(response.body);
      throw Exception("failed to fetch published videos");
    }
  }
}
