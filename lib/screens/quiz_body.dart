import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/progressbar.dart';
import 'package:quiz_app/screens/question_card.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';

class quiz_body extends StatelessWidget {
  const quiz_body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/bg.jpg"), fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: ProgressBar()),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(
                      () => Text.rich(TextSpan(
                          text:
                              "Question ${_questionController.questNumber.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.lightGreenAccent),
                          children: [
                            TextSpan(
                                text:
                                    "/${_questionController.questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(color: Colors.lightGreenAccent))
                          ])),
                    ),
                  ),
                  Divider(
                    thickness: 1.6,
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Expanded(
                    child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        itemCount: _questionController.questions.length,
                        itemBuilder: (context, index) => QuestionCard(
                              question: _questionController.questions[index],),
                        onPageChanged: _questionController.updateQuestionNum),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
