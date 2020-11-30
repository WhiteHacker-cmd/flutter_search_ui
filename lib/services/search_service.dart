import 'package:http/http.dart' as http;

class SearchService {
  static Future<String> searchDjangoApi(String query) async {
    String url = 'http://"add your ip here":8000/api/foods/?search=$query';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
}
