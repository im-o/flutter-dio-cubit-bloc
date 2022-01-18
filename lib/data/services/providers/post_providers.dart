import 'package:dio/dio.dart';

import '../api_client.dart';

class PostProviders {
  ApiClient _client;

  PostProviders(this._client);

  Future<List<dynamic>> fetchPosts() async {
    try {
      Response response = await _client.dio.get("/posts");
      print("SAMPLE_DATA : ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print("ERROR : $e");
      return [];
    }
  }
}
