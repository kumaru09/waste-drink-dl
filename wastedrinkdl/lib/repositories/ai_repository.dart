import 'dart:io';

import 'package:dio/dio.dart';

class AiRepository {
  Future<void> prediction(File file) async {
    try {
      final dio = Dio();
      final fromData =
          FormData.fromMap({'image': await MultipartFile.fromFile(file.path)});
      final response = await dio.post(
          'https://api-gcp-ai.herokuapp.com/api/predict/',
          data: fromData);
      print(response);
    } catch (e) {
      print('$e');
    }
  }
}
