// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCommentModel {
  int? postId;
  int? id;
  String name;
  String? email;
  String body;

  UserCommentModel(
      {this.postId,
      this.id,
      required this.name,
      this.email,
      required this.body});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory UserCommentModel.fromMap(Map<String, dynamic> map) {
    return UserCommentModel(
      postId: map['postId'] != null ? map['postId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCommentModel.fromJson(String source) =>
      UserCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
