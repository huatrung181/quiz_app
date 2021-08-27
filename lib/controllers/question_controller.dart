import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  late PageController _pageController;

  PageController get pageController => _pageController;

  Animation get animation => this._animation;
  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  late int _correctAns;
  late int _selectedAns;

  bool get isAnswered => _isAnswered;

  RxInt _questNumber = 1.obs;

  RxInt get questNumber => _questNumber;

  late int _numOfCorredAns = 0;

  int get numOfCorredAns => _numOfCorredAns;

  int get correctAns => _correctAns;

  int get selectedAns => _selectedAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();
    super.onInit();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorredAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    {
      if (_questNumber.value != _questions.length) {
        _isAnswered = false;
        _pageController.nextPage(
            duration: Duration(microseconds: 250), curve: Curves.ease);
        _animationController.reset();
        _animationController.forward().whenComplete(nextQuestion);
      }else{
        Get.to(ScoreScreen());
      }
    }

  }

  void updateQuestionNum(int index) {
    _questNumber.value = index + 1;
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }
}
