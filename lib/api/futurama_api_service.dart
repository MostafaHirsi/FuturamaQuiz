import 'dart:io';

import 'package:dio/dio.dart';

import '../models/character/character.dart';
import '../models/info/info.dart';
import '../models/question/question.dart';

class FuturamaApiService {
  final Dio dio;

  FuturamaApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'https://api.sampleapis.com/futurama',
      validateStatus: (status) {
        return status == 200 || status == 404;
      },
    );
  }

  Future<Map<String, dynamic>> getInfo() async {
    Response response = await dio.get('/info');
    if (response.statusCode! < 200 || response.statusCode! > 299) {
      throw HttpException(response.statusMessage!);
    }
    return response.data;
  }

  Future<List<dynamic>> getCharacters() async {
    Response response = await dio.get('/characters');
    if (response.statusCode! < 200 || response.statusCode! > 299) {
      throw HttpException(response.statusMessage!);
    }
    return response.data;
  }

  Future<List<dynamic>> getQuestions() async {
    Response response = await dio.get('/questions');
    if (response.statusCode! < 200 || response.statusCode! > 299) {
      throw HttpException(response.statusMessage!);
    }
    return response.data;
  }
}
