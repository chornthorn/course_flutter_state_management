

class PostResModel {
  late final int id;
  late final String title;
  late final String body;
  late final int userId;

  PostResModel._(); // private constructor


  // fromJson is a named constructor
  PostResModel.fromJson( Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}