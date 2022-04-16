import 'package:cheers/models/test.dart';
import 'package:cheers/services/api.dart';
import 'package:cheers/widgets/testWidget.dart';
import 'package:flutter/material.dart';

class Tests extends StatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  final ApiService api = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Test>>(
      future: api.getTests(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Test> _Tests = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Test _Test = _Tests[index];
              return TestWidget(test: _Test);
            },
            itemCount: _Tests.length,
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
