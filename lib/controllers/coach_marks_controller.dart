import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CoachMarksController extends GetxController {
  final key1 = GlobalKey();
  final key2 = GlobalKey();

  final targetInfo = ["closet", "clothing"];

  final List<TargetFocus> targets = [];

  late final Rx<dynamic> navigationInfo = "".obs;

  final _textColor = Colors.white;

  void checkForCoachMarks(context) {
    Future.delayed(const Duration(seconds: 5), () {
      _initTargets(context);
    });
  }

  void _initTargets(context) {
    targets.add(
      TargetFocus(
        identify: targetInfo[0],
        keyTarget: key1,
        contents: [
          TargetContent(
              align: ContentAlign.custom,
              customPosition: CustomTargetContentPosition(bottom: 200.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Select Closet",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: _textColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "You can add your clothes here",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: targetInfo[1],
        keyTarget: key2,
        contents: [
          TargetContent(
              align: ContentAlign.custom,
              customPosition: CustomTargetContentPosition(top: 200.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Add Clothing",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: _textColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Add clothes from your photos",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.deepPurple,
      textSkip: "SKIP",
      textStyleSkip: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: onClickCoachTarget,
      onSkip: () {
        print("skip");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    ).show(context: context);
  }

  onClickCoachTarget(TargetFocus targetFocus) {
    navigationInfo.value = targetFocus.identify;
  }
}
