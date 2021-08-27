import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qtController) {
          Color getTheRighColor() {
            if (qtController.isAnswered) {
              if (index == qtController.correctAns) {
                return kGreenColor;
              } else if (index == qtController.selectedAns &&
                  qtController.selectedAns != qtController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRighColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRighColor()),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1} $text",
                    style: TextStyle(color: getTheRighColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRighColor()),
                      color: getTheRighColor() == kGrayColor
                          ? Colors.transparent
                          : getTheRighColor(),
                    ),
                    child: getTheRighColor() == kGrayColor
                        ? null
                        : Icon(getTheRightIcon(), size: 16,),
                  )
                ],
              ),
            ),
          );
        });
  }
}
