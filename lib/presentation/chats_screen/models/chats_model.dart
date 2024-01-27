// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:photo/presentation/chats_screen/models/user_comment_model.dart';

class ChatsModel extends Equatable {
  ChatsModel({this.userCommentList = const []}) {}

  List<UserCommentModel> userCommentList;

  ChatsModel copyWith({List<UserCommentModel>? userprofileItemList}) {
    return ChatsModel(
      userCommentList: userprofileItemList ?? this.userCommentList,
    );
  }

  @override
  List<Object?> get props => [userCommentList];
}
