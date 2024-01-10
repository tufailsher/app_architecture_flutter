import 'package:http/http.dart' as http;

class HttpWrapper {
  Future<http.Response> get(String url) async {
    try {
      return await http.get(Uri.parse(url));
    } catch (e) {
      throw HttpException(_handleError(e));
    }
  }

  Future<http.Response> post(String url, {dynamic body}) async {
    try {
      return await http.post(Uri.parse(url), body: body);
    } catch (e) {
      throw HttpException(_handleError(e));
    }
  }

  Future<http.Response> put(String url, {dynamic body}) async {
    try {
      return await http.put(Uri.parse(url), body: body);
    } catch (e) {
      throw HttpException(_handleError(e));
    }
  }

  Future<http.Response> delete(String url) async {
    try {
      return await http.delete(Uri.parse(url));
    } catch (e) {
      throw HttpException(_handleError(e));
    }
  }

  String _handleError(e) {
    if (e is http.ClientException) {
      return e.message;  
    }
    return 'Unexpected error';
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
  
  @override
  String toString() => message;
}