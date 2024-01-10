abstract class BaseApiService{
  
  final String baseUrl = '';
  final String apiKey = '';

   Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url,Map<String, String> jsonBody);
}