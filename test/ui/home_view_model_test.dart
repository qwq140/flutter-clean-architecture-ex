import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다.', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');
    await viewModel.fetch('iphone');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
      viewModel.photos,
      result
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }

}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL": "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL": "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL": "https://pixabay.com/get/geee5a9d5e09df20d6665be0e4a7df4fc4c8f627f6bd47ad5af931ce37d67205b7f09ae5089ded02f66f72f2c751c8ef5_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL": "https://pixabay.com/get/g22cb0c37c862706aaa0ba6123d711fa43615afa5b7ea29d9f9b1908bcbecac27db4b7a852bbabeaa7286782e7931db9104240e80ac4964a60e5e11513dc3df00_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 455137,
    "downloads": 262250,
    "collections": 1244,
    "likes": 2327,
    "comments": 188,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  }
];