import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import 'package:flutter_svg/svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3F4768), width: 3),
            borderRadius: BorderRadius.circular(50)),
        child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(
                  builder: (context, contraints) => Container(
                        width: contraints.maxWidth * controller.animation.value,
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(50)),
                      )),
              Positioned.fill(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value * 60).round()}"),
                    SvgPicture.asset("assets/icons/clock.svg")
                  ],
                ),
              ))
            ],
          );
        }));
  }
}
