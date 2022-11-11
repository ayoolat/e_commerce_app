import 'package:http/http.dart' as http;

class HttpConnection {
  getClient() {
    return http.Client();
  }
}
