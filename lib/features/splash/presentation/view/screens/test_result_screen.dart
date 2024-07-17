import 'package:get/get.dart';

import 'package:get/get.dart';

import 'package:get/get.dart';

import '../../../../../core/const.dart';
import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import '../../../../../core/widgets/default%20button.dart';
import 'package:flutter/material.dart';

class TestResultScreen extends StatefulWidget {
  @override
  _TestResultScreen createState() => _TestResultScreen();
}

class _TestResultScreen extends State<TestResultScreen> {
  final List<String> _images = [
    'images/TEST122.png',
    'images/test16.png',
    'images/test3.png',
    'images/test57.png',
    'images/test45png.png',
    'images/test12.png',
    'images/test5.png',
    'images/TEST1222png.png',
  ];

  final List<String> _correctAnswers = [
    '12',
    '16',
    '3',
    '57',
    '45',
    '12',
    '5',
    '12',
  ];

  final List<TextEditingController> _controllers =
      List.generate(8, (index) => TextEditingController());
  int _score = 0;

  void _calculateScore() {
    int tempScore = 0;
    for (int i = 0; i < _controllers.length; i++) {
      if (_controllers[i].text == _correctAnswers[i]) {
        tempScore++;
      }
    }
    setState(() {
      _score = tempScore;
    });
    _showResult();
  }

  void _showResult() {
    String result = _score >= 7
        ? "You Got $_score Correct Answers, So You are Not Color Blind"
        : "You Got $_score Correct Answers So You could be Color Blind";
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorManager.white,
        title: Text(
          "Test Result",
          textAlign: TextAlign.center,
          style:
              getBoldStyle(fontSize: AppSize.s24, color: context.theme.primaryColor),
        ),
        content: Text(
          result,
          textAlign: TextAlign.center,
          style:
              getBoldStyle(fontSize: AppSize.s14, color: context.theme.primaryColor),
        ),
        actions: [
          Row(
            children: [
              DefaultButton(
                height: 35,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Try Again'.tr,
              ),
              Spacer(),
              DefaultButton(
                height: 35,
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(homeServices);
                },
                text: 'Let\'s get started'.tr,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 2.3 / 3,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        _images[index],
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        child: TextField(
                          cursorColor: context.theme.primaryColor,
                          controller: _controllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter The Number'.tr,
                            hintStyle: getBoldStyle(
                                fontSize: 14, color: ColorManager.darkBlue),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            DefaultButton(
              onPressed: _calculateScore,
              text: 'Show The Result'.tr,
              width: double.infinity,
              fontSize: AppSize.s18,
            ),
          ],
        ),
      ),
    );
  }
}
