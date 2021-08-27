import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz_body.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text('Skip'))],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: quiz_body(),
    );
  }
}

