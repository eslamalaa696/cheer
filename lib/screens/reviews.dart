import 'package:cheers/models/review.dart';
import 'package:cheers/services/api.dart';
import 'package:cheers/widgets/reviewWidget.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  final String name;
  Reviews(this.name);
  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews about Dr. ${widget.name}"),
      ),
      body: FutureBuilder<List<Review>>(
        future: api.getReviews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Review> _reviews = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Review _review = _reviews[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReviewWidget(review: _review),
                );
              },
              itemCount: _reviews.length,
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
