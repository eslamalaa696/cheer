// ignore_for_file: prefer_const_declarations

import 'package:cheers/models/review.dart';
import 'package:cheers/models/test.dart';

import '../models/doctor.dart';
import '../models/post.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Doctor>> getDoctors() async {
    final String url = "https://dummyjson.com/users";
    final http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return decodeDoctorsFromJson(res.body);
    } else {
      throw Exception("Failed to load users, ${res.statusCode} - ${res.body}");
    }
  }

  Future<List<Post>> getPosts() async {
    final String url = "https://dummyjson.com/products";
    final http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return decodePostsFromJson(res.body);
    } else {
      throw Exception("Failed to load users, ${res.statusCode} - ${res.body}");
    }
  }

  Future<List<Post>> getPostsOfCat(String cat) async {
    final String url = "https://dummyjson.com/products/category/$cat";
    final http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return decodePostsFromJson(res.body);
    } else {
      throw Exception("Failed to load users, ${res.statusCode} - ${res.body}");
    }
  }

  Future<List<Test>> getTests() async {
    final String url = "https://dummyjson.com/posts";
    final http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return decodeTestsFromJson(res.body);
    } else {
      throw Exception("Failed to load users, ${res.statusCode} - ${res.body}");
    }
  }

  Future<List<Review>> getReviews() async {
    final String url = "https://dummyjson.com/comments";
    final http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return decodeReviewsFromJson(res.body);
    } else {
      throw Exception("Failed to load users, ${res.statusCode} - ${res.body}");
    }
  }
  
}
