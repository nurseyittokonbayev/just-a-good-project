// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModels {
  String? name;
  String? username;
  String? email;
  UserModels({
    this.name,
    this.username,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'email': email,
    };
  }

  UserModels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }
}
