import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/locator.dart';
import '../../core/navigation/app_router.dart';
import '../cubit/leaderboard/leaderboard_cubit.dart';

@RoutePage()
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LeaderboardCubit>()..fetchQuizResults(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ТОП-15 ПРОШЕДШИХ В ФИНАЛ"),
          centerTitle: true,
        ),
        body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
          builder: (context, state) {
            if (state.isLoading)
              return const Center(child: CircularProgressIndicator());
            if (state.error != null)
              return Center(child: Text("Ошибка: ${state.error}"));

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      final player = state.list[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: Text(player.name),
                        subtitle: Text("Группа: ${player.groupId}"),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${player.totalScore}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                            const Text(
                              "баллов",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        context.router.push(const CrosswordRoute()),
                    child: const Text("ПЕРЕЙТИ К КРОССВОРДУ"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
