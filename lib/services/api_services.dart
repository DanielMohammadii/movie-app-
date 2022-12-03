import 'package:http/http.dart' as http;
import 'package:movieapp/model/popular_people/ppl_result.dart';
import 'package:movieapp/model/trending_model/result.dart';

class ApiServices {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  var client = http.Client();
  static String apiKey = '04f9d8f5d862599da3e1b652dddcd990';
  static String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNGY5ZDhmNWQ4NjI1OTlkYTNlMWI2NTJkZGRjZDk5MCIsInN1YiI6IjVmZGEyYTM1OTQwOGVjMDAzY2RlNDIxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jH_KtPhFBzeu4cthYdpMXSkQ5O1relPWze9ay71AMLE';
  Future<List<Result>?> getData() async {
    var url = Uri.parse('${baseUrl}trending/movie/week?api_key=$apiKey');

    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      var result = Result.fromJson(json);

      return result;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }

  Future<List<PPlResult>?> getPopularPeople() async {
    var url2 = Uri.parse('${baseUrl}trending/person/week?api_key=$apiKey');
    var res = await client.get(url2);

    if (res.statusCode == 200) {
      var json = res.body;
      var result2 = PPlResult.fromJson(json);
      return (result2);
    } else {
      print('Request failed with status: ${res.statusCode}');
    }
    return null;
  }
}
