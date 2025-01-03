import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnquran/dto/lesson.dart';
import 'package:learnquran/repository/lesson_repo.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LessonListScreen extends StatelessWidget {
  const LessonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lessonRepo = LessonRepo();
    return FutureBuilder(
        future: lessonRepo.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var lessons = snapshot.data as List<Lesson>;
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'Lessons',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    var lesson = lessons[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: ListTile(
                        title: Row(
                          children: [
                            lesson.wordsLearned == lesson.totalWords
                                ? const FaIcon(FontAwesomeIcons.check,
                                    color: Colors.green)
                                : const SizedBox(
                                    width: 20,
                                  ),
                            const SizedBox(
                              width: 16,
                            ),
                            CircularPercentIndicator(
                              radius: 10.0,
                              lineWidth: 10.0,
                              percent: lesson.wordsLearned / lesson.totalWords,
                              progressColor: Colors.blue[300],
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(lesson.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}
