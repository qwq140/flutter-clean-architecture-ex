import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

// 화면에서 동작을 하는 비지니스 모델 : ViewModel
class HomeViewModel {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}