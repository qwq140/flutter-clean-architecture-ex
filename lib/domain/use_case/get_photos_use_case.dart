import 'dart:math';

import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> execute(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);

    return result.when(success: (data) {
      return Result.success(data.sublist(0, min(3, data.length)));
    }, error: (message) {
      return Result.error(message);
    },);

  }
}