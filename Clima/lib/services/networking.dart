import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Response response = await http.get(Uri.parse(url));
    String mystring;
    if (response.statusCode == 200) {
      mystring = response.body;
    } else {
      print(response.statusCode);
    }
    print('Every thing is fine upto here');
    return jsonDecode(mystring);
  }
}

// int longi = jsonDecode(mystring)['coord']['lon'];
// double temp = jsonDecode(mystring)['main']['temp'];
