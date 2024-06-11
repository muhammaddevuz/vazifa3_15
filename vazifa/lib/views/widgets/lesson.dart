import 'package:dars_3_9_uy_ishi/controllers/course_controller.dart';
import 'package:dars_3_9_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_9_uy_ishi/views/screens/lesson_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LessonWidget extends StatefulWidget {
  const LessonWidget({super.key});

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  final courseController = CourseController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        for (var i = 0; i < AppConstants.lessons.length; i++)
          Column(
            children: [
              InkWell(
                onTap: () {
                  !AppConstants.lessons[i].buyCheck
                      ? showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: const Text(
                                  "Kursni ko'rish uchun avval sotib oling"),
                            );
                          },
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonScreen(
                              lesson: AppConstants.lessons[i],
                            ),
                          ),
                        );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.lessons[i].title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppConstants.lessons[i].description,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (!AppConstants.lessons[i].buyCheck)
                        InkWell(
                          onTap: () {
                            AppConstants.lessons[i].basketCheck = true;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Text(
                              AppConstants.lessons[i].basketCheck
                                  ? "Savatad mavjud"
                                  : "Savatga qo'shish",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
      ],
    );
  }
}
