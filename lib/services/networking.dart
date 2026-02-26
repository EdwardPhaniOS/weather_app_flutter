import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  String url;

  NetworkingHelper(this.url);

  Future getData() async {
    var url = Uri.parse(this.url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}