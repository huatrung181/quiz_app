import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/bg.jpg"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            //  WebsafeSvg.asset("assets/icons/bg.svg"),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Let\' Play Quiz,",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                    Text("Enter your information below"),
                    Spacer(),
                    TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xFF1C2341),
                            filled: true,
                            hintText: "full name",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))))),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(QuizScreen());
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75),
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Text(
                          'Let\' Start Quiz',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
