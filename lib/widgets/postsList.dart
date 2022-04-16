// ignore_for_file: file_names, prefer_const_constructors
import 'package:cheers/widgets/postWidget.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  const PostsList({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Post _post = posts[index];
        return PostWidget(
          post: _post,
          index: index,
        );
      },
      itemCount: 4,
    );
  }
}
