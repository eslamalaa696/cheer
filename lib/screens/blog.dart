// ignore_for_file: prefer_const_constructors, avoid_print

// import 'dart:collection';

// import 'package:cheers/screens/categoryScreen.dart';

import '../models/post.dart';
import 'package:cheers/services/api.dart';
import 'package:cheers/widgets/postsList.dart';
import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final ApiService api = ApiService();
  final List<String> temp = [];
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return FutureBuilder<List<Post>>(
      future: api.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Post> _posts = snapshot.data!;

          for (int i = 0; i < _posts.length; i++) {
            Post _post = _posts[i];
            temp.add(_post.category);
          }

          // final List<String> _cats = LinkedHashSet<String>.from(temp).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: SizedBox(
                //     height: height * 0.05,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         String _cat = _cats[index];
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: ElevatedButton(
                //             onPressed: () {
                //               print(_cat + " ${index + 1}");
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (_) =>
                //                       CategoryScreen(category: _cat),
                //                 ),
                //               );
                //             },
                //             child: Text(_cat),
                //           ),
                //         );
                //       },
                //       itemCount: _cats.length,
                //       shrinkWrap: true,
                //     ),
                //   ),
                // ),
                PostsList(posts: _posts),
              ],
            ),
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
    );
  }
}
