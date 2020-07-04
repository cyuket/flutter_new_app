import 'dart:convert';
import 'package:http/http.dart' as http;

var apiKey = "6a4572d50cdf49888d653e0988130fcc";

Future fetchArticle() async {
  var response = await http
      .get("https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey");
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
}
