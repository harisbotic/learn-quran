import 'package:flutter/material.dart';
import 'package:learnquran/screens/learning_exp/MCQWordExperience.dart';
import 'package:learnquran/screens/learning_exp/learn_word_experience_widget.dart';
import 'package:learnquran/service/learning_experience_wizard.dart';
import 'package:learnquran/widgets/quiz/mcq_widget.dart';
import 'package:learnquran/widgets/word/word_flipcard.dart';

class LearningExpScreen extends StatefulWidget {
  const LearningExpScreen({super.key});

  @override
  State<LearningExpScreen> createState() => _LearningExpScreenState();
}

class _LearningExpScreenState extends State<LearningExpScreen> {
  final PageController controller = PageController(initialPage: 0);
  int currentPageIndex = 0;
  int pageCount = 1;
  late LearnExperience currentExperience;
  late LearningExperienceWizard wizard = LearningExperienceWizard();

  addPageView() {
    setState(() {
      pageCount++;
    });
  }

  navigateToNextPage() {
    addPageView();
    controller.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  getCurrentPage(int page) {
    setState(() {
      currentPageIndex = page;
    });
  }

  createPage() {
    if (!wizard.moveNext()) return null;

    LearnExperience? exp = wizard.current;

    switch (exp.runtimeType) {
      case const (Null):
        return null;
      case const (LearnWordExperience):
        return LearnWordExperienceWidget(
          experience: (exp as LearnWordExperience),
          onComplete: () => navigateToNextPage(),
        );
      case const (MCQWordExperience):
        return MCQWordExperienceWidget(
          experience: (exp as MCQWordExperience),
          onComplete: () => navigateToNextPage(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LearningExperienceWizard>(
        future: wizard.initialize(const Locale("en")),
        builder: (context, AsyncSnapshot<LearningExperienceWizard> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Learning Session',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                elevation: 2,
              ),
              body: PageView.builder(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, position) {
                  return createPage();
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}