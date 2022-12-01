import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// import 'networking.dart';

const apiKey = '64d4144c-d85e-4c0e-962c-3d3ddc49bad7';
const copyLeaksURL = 'https://id.copyleaks.com/v3/account/login/api';

class Plagiarism {
  Future<dynamic> getScore(String cityName) async {
    var data = {
      "url": "https://example.com",
      "properties": {
        "sandbox": true,
        "webhooks": {"status": "https://yoursite.com/webhook/{STATUS}"}
      }
    };

    // NetworkHelper networkHelper =
    //     NetworkHelper('$copyLeaksURL?q=$cityName&appid=$apiKey&units=metric');

    // var weatherData = await networkHelper.getData();
    // return weatherData;

    var url = '{{baseURL}}/api/auth/login';
    // var body = json.encode({
    //   'nick': nick,
    //   'password': password,
    // });

    // print('Body: $body');

    var response = await http.post(
      Uri.parse(data['url'] as String),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json-patch+json',
      },
    );

    // todo - handle non-200 status code, etc

    // return json.decode(response.body);
  }

  Future<Response> loginAndGetAccessToken() async {
    var response = await http.post(
      Uri.parse('https://id.copyleaks.com/v3/account/login/api'),
      body: {
        "email": "ekaksha.official.app@gmail.com",
        "key": "64d4144c-d85e-4c0e-962c-3d3ddc49bad7"
      },
    );
    return response;
  }

  void submitUrlScan(String scanId) async {
    var response = await http.post(
      Uri.parse('https://api.copyleaks.com/v3/scans/submit/url/$scanId'),
      body: {
        "url": "https://example.com",
        "properties": {
          "sandbox": true,
          "webhooks": {"status": "https://yoursite.com/webhook/{STATUS}"}
        }
      },
    );
    // return response;
  }
}
