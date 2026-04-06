import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/locator.dart';
import '../../../data/datasource/hive_service.dart';
import '../../core/navigation/app_router.dart';
import '../cubit/quizz/quizz_cubit.dart';

@RoutePage()
class QuizzScreen extends StatelessWidget {
  const QuizzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuizzCubit>()..loadQuestions(),
      child: Scaffold(
        appBar: AppBar(title: const Text("KSTU QUIZ - ТЕСТ")),
        body: BlocConsumer<QuizzCubit, QuizzState>(
          listener: (context, state) {
            if (state.isFinished) {
              context.router.replace(const LeaderboardRoute());
            }
          },
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator());
            if (state.questions.isEmpty) return const Center(child: Text("Вопросов пока нет"));

            final currentQuestion = state.questions[state.currentIndex];
            final studentId = sl<HiveService>().getPlayerId() ?? 0;

            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  LinearProgressIndicator(value: (state.currentIndex + 1) / state.questions.length),
                  const SizedBox(height: 40),
                  Text(
                    "Вопрос ${state.currentIndex + 1}:",
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentQuestion.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: currentQuestion.shuffledAnswers.map((answer) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade50),
                          onPressed: () {
                            context.read<QuizzCubit>().selectAnswer(studentId, answer);
                          },
                          child: Text(answer, style: const TextStyle(fontSize: 20, color: Colors.black87)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}