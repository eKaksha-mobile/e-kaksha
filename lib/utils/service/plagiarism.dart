import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// 'X-RapidAPI-Key': '568ce5fb4amsh22f37fe760d2699p102d6ejsnbb531fab6a56',
// 'X-RapidAPI-Host': 'plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com'

class Plagiarism {
  Future getData(String text) async {
    var response = await http.post(
        Uri.parse(
            'https://plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com/plagiarism'),
        headers: {
          'content-type': 'application/json',
          'X-RapidAPI-Key':
              '568ce5fb4amsh22f37fe760d2699p102d6ejsnbb531fab6a56',
          'X-RapidAPI-Host':
              'plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com'
        },
        body: jsonEncode({
          "text": text,
          "language": "en",
          "includeCitations": false,
          "scrapeSources": false
        }));

    if (response.statusCode == 200) {
      String data = response.body;

      // print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
    // return response;
  }
}
