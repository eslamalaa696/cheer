// ignore_for_file: file_names
import 'package:cheers/models/post.dart';
import 'package:cheers/services/api.dart';
import 'package:cheers/widgets/postsList.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService api = ApiService();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: api.getPostsOfCat(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Post> _posts = snapshot.data!;
            return SingleChildScrollView(
              child: PostsList(posts: _posts),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
