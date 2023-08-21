import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/models/stories_data.dart';
import 'package:tec/widgets/main_app_bar.dart';
import 'package:tec/widgets/story_list.dart';

import 'package:tec/data/repo/story_repo.dart';
import 'package:tec/data/src/story_src.dart';
import 'package:tec/models/posts_model.dart';
import 'package:tec/widgets/posts_list_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final storyRepo = StoryRepo(
    src: StoryRemoteSrc(
      http: Dio(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MainAppBar(),
              StoryList(stories: StoriesDatabase.stories),
              PostsListView(postsData: PostsDatabase.posts),
              10.0.spaceY,
              const CircularProgressIndicator(),
              10.0.spaceY,
            ],
          ),
        ),
      ),
    );
  }
}
