import 'package:dio/dio.dart';

class AnimalCatRepository {
  final Dio _dioCat = Dio();

  Future<String> getCatImage () async {
    final Response responseCat = await _dioCat.get(
      'https://api.thecatapi.com/v1/images/search',
    );
    return responseCat.data.first["url"];
  }
}