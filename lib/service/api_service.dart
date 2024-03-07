import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_practice/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getWebtoonInfo() async{
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); 


    if(response.statusCode == 200){
      final List<dynamic> list = jsonDecode(response.body);
      List<WebtoonModel> result = [];
      for(var map in list){
        WebtoonModel webtoonModel = WebtoonModel.fromJson(map);
        result.add(webtoonModel);
      }
      return result;
    }
    throw Error();
  }


}