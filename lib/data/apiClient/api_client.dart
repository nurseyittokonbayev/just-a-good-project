import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:photo/data/models/photo_models.dart';
import 'package:photo/presentation/chats_screen/models/user_comment_model.dart';
import 'package:photo/presentation/discover_overflow_behavior_page/models/photos_models.dart';

class ApiClient {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
}

class ApiService {
  const ApiService(this.client);

  final http.Client client;

  Future<List<UserModels>?> getUsers() async {
    try {
      final uri = Uri.parse('${ApiClient.baseUrl}/users');
      final res = await client.get(uri);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<dynamic> data = jsonDecode(res.body);

        final List<UserModels> users =
            data.map((dynamic item) => UserModels.fromJson(item)).toList();

        return users;
      }
    } catch (e) {
      log('error: $e');
    }
    return null;
  }

  Future<List<UserCommentModel>?> getComments() async {
    try {
      final uri = Uri.parse('${ApiClient.baseUrl}/posts/1/comments');
      final res = await client.get(uri);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<dynamic> data = jsonDecode(res.body);

        final List<UserCommentModel> comments =
            data.map((dynamic item) => UserCommentModel.fromMap(item)).toList();

        return comments;
      }
    } catch (e) {
      log('error: $e');
    }
    return null;
  }

  Future<List<PhotosModels>?> getPhotos() async {
    try {
      final uri = Uri.parse('${ApiClient.baseUrl}/photos');
      final res = await client.get(uri);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<dynamic> data = jsonDecode(res.body);

        final List<PhotosModels> photos =
            data.map((dynamic item) => PhotosModels.fromJson(item)).toList();

        return photos;
      }
    } catch (e) {
      log('error: $e');
    }
    return null;
  }
}

final apiService = ApiService(http.Client());
