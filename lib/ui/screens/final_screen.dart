import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/locator.dart';
import '../cubit/leaderboard/leaderboard_cubit.dart';

@RoutePage()
class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LeaderboardCubit>()..fetchFinalWinners(),
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
              const SizedBox(height: 20),
              const Text(
                "ПОБЕДИТЕЛИ ТУРНИРА",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              BlocBuilder<LeaderboardCubit, LeaderboardState>(
                builder: (context, state) {
                  if (state.isLoading) return const CircularProgressIndicator();

                  return Container(
                    width: 500,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: List.generate(state.list.length, (index) {
                        final winner = state.list[index];
                        return ListTile(
                          leading: Icon(
                            Icons.emoji_events,
                            color: index == 0
                                ? Colors.amber
                                : (index == 1 ? Colors.grey : Colors.brown),
                          ),
                          title: Text(
                            winner.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Группа ${winner.groupId}"),
                          trailing: Text(
                            "${winner.totalScore} pts",
                            style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => context.router.popUntilRoot(),
                child: const Text("ВЕРНУТЬСЯ НА ГЛАВНУЮ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
