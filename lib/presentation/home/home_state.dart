import 'package:image_search/domain/model/photo.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required List<Photo> photos,
    required bool isLoading,
  }) = _HomeState;
}