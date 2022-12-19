import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_state.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

// 화면에서 동작을 하는 비지니스 모델 : ViewModel
class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  HomeState _state = HomeState(isLoading: false, photos: []);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading : true);
    notifyListeners();

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (data) {
        _state = state.copyWith(photos: data);
        notifyListeners();
      },
      error: (message) {
        print(message);
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
