import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final dio = Dio();

void request(category) async {
  Response response;
  response = await dio.get(
      'https://newsapi.org/v2/top-headlines?sources=cnn&apiKey=1bd9ed90ffb4460ca9cb10df1f19fac2');
  print(response);
}

search(searchKeyword) async {
  Response response = await dio.get(
      'https://newsapi.org/v2/everything?q=$searchKeyword&sortBy=popularity&apiKey=1bd9ed90ffb4460ca9cb10df1f19fac2');
  return response;
}

void main() {
  request("business");
}
