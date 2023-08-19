import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  final String popular = "popular";

  void getPopularMovides() async {
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
