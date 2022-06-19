import 'package:http/http.dart' as http;

class AuthService {
  late final String url;
  late final dynamic body;
  AuthService({required this.url, this.body});

  Future<http.Response> post() async {
    return await http.post(Uri.parse(url), body: body);
    
  }
}
