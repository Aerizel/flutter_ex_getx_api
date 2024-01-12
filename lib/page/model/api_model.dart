class ApiModel {
  late int userID;
  late int id;
  late String title;
  late String body;

  ApiModel({
    required this.userID,
    required this.id,
    required this.title,
    required this.body,
  });

  ApiModel.fromJson(Map<String, dynamic>json) {
    userID = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}