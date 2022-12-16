import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';

// InheritedWidget : 어떤 위젯트리에도 원하는 데이터를 제공할 수 있는 특별한 위젯
class PhotoProvider extends InheritedWidget {

  final PixabayApi api;

  const PhotoProvider({super.key, required this.api, required super.child});

  // BuildContext : 위젯 트리의 정보를 가지고 있다.
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  // covariant 이름을 바꿔도 된다는 키워드
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }

}