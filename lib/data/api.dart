import 'dart:convert';

import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {

  final baseUrl = 'https://pixabay.com/api/';
  final key = '30914170-98b4302a53171d718843b34f1';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

}