class Photo {
  Photo({
      required this.id,
      required this.pageURL,
      required this.type,
      required this.tags,
      required this.previewURL,
      required this.previewWidth,
      required this.previewHeight,
      required this.webformatURL,
      required this.webformatWidth,
      required this.webformatHeight,
      required this.largeImageURL,
      required this.imageWidth,
      required this.imageHeight,
      required this.imageSize,
      required this.views,
      required this.downloads,
      required this.collections,
      required this.likes,
      required this.comments,
      required this.userId,
      required this.user,
      required this.userImageURL,});

  Photo.fromJson(dynamic json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  late final int id;
  late final String pageURL;
  late final String type;
  late final String tags;
  late final String previewURL;
  late final int previewWidth;
  late final int previewHeight;
  late final String webformatURL;
  late final int webformatWidth;
  late final int webformatHeight;
  late final String largeImageURL;
  late final int imageWidth;
  late final int imageHeight;
  late final int imageSize;
  late final int views;
  late final int downloads;
  late final int collections;
  late final int likes;
  late final int comments;
  late final int userId;
  late final String user;
  late final String userImageURL;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['pageURL'] = pageURL;
    map['type'] = type;
    map['tags'] = tags;
    map['previewURL'] = previewURL;
    map['previewWidth'] = previewWidth;
    map['previewHeight'] = previewHeight;
    map['webformatURL'] = webformatURL;
    map['webformatWidth'] = webformatWidth;
    map['webformatHeight'] = webformatHeight;
    map['largeImageURL'] = largeImageURL;
    map['imageWidth'] = imageWidth;
    map['imageHeight'] = imageHeight;
    map['imageSize'] = imageSize;
    map['views'] = views;
    map['downloads'] = downloads;
    map['collections'] = collections;
    map['likes'] = likes;
    map['comments'] = comments;
    map['user_id'] = userId;
    map['user'] = user;
    map['userImageURL'] = userImageURL;
    return map;
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Photo{id: $id}';
  }
}