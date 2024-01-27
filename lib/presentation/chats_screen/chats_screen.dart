// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:photo/core/app_export.dart';
import 'package:photo/widgets/app_bar/appbar_subtitle.dart';
import 'package:photo/widgets/app_bar/custom_app_bar.dart';

import '../chats_screen/widgets/userprofile_item_widget.dart';
import 'bloc/chats_bloc.dart';
import 'models/user_comment_model.dart';

// ignore_for_file: must_be_immutable
class ChatsScreen extends StatelessWidget {
  ChatsScreen({
    Key? key,
  }) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return ChatsScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            height: 44.v,
            centerTitle: true,
            title: AppbarSubtitle(text: "lbl_chats".tr),
            styleType: Style.bgShadow),
        body: Center(
          child: BlocBuilder<ChatsBloc, ChatsState>(
            builder: (context, state) {
              if (state is ChatInitial) {
                return const Text('initial state');
              } else if (state is ChatLoading) {
                return Center(child: const CircularProgressIndicator());
              } else if (state is ChatSuccess) {
                return NewWidget(
                  comments: state.comments,
                );
              } else if (state is ChatError) {
                return Text(state.message ?? '');
              } else {
                return const Text(' default state');
              }
            },
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.comments,
  }) : super(key: key);

  final List<UserCommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.v),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: theme.colorScheme.primaryContainer,
            ),
          ),
        );
      },
      itemCount: comments.length,
      itemBuilder: (context, index) {
        UserCommentModel model = comments[index];
        return UserprofileItemWidget(
          model,
          onTapUserProfile: () {
            onTapUserProfile(context);
          },
        );
      },
    );
  }

  onTapUserProfile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.individualChatScreen,
    );
  }
}
