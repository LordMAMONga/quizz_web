import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/locator.dart';
import '../../../data/datasource/hive_service.dart';
import '../../core/navigation/app_router.dart';
import '../cubit/crossword/crossword_cubit.dart';

@RoutePage()
class CrosswordScreen extends StatelessWidget {
  const CrosswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentId = sl<HiveService>().getPlayerId() ?? 0;

    return BlocProvider(
      create: (context) => sl<CrosswordCubit>()..initCrossword(),
      child: Scaffold(
        appBar: AppBar(title: const Text("ФИНАЛЬНЫЙ КРОССВОРД")),
        body: BlocBuilder<CrosswordCubit, CrosswordState>(
          builder: (context, state) {
            if (state.isLoading)
              return const Center(child: CircularProgressIndicator());

            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      final q = state.questions[index];
                      final isSolved = state.solvedIds.contains(q.id);

                      return ListTile(
                        title: Text(q.question),
                        subtitle: isSolved
                            ? Text(
                                "Отгадано: ${q.answer}",
                                style: const TextStyle(color: Colors.green),
                              )
                            : null,
                        trailing: isSolved
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : Text("${q.pointValue} pts"),
                        onTap: isSolved
                            ? null
                            : () => _showAnswerDialog(context, q.id, studentId),
                      );
                    },
                  ),
                ),
                const VerticalDivider(),
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: Text("Здесь может быть сетка или статус"),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.router.replace(const FinalRoute()),
          label: const Text("ЗАВЕРШИТЬ ИГРУ"),
          icon: const Icon(Icons.flag),
        ),
      ),
    );
  }

  void _showAnswerDialog(BuildContext context, int wordId, int studentId) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (diagContext) => AlertDialog(
        title: const Text("Ваш ответ"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Введите слово"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(diagContext),
            child: const Text("Отмена"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CrosswordCubit>().checkWord(
                studentId,
                wordId,
                controller.text,
              );
              Navigator.pop(diagContext);
            },
            child: const Text("Проверить"),
          ),
        ],
      ),
    );
  }
}
