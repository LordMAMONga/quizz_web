import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/locator.dart';
import '../../core/navigation/app_router.dart';
import '../cubit/waiting/waiting_cubit.dart';

@RoutePage()
class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WaitingCubit>()..startPolling(),
      child: Scaffold(
        body: BlocListener<WaitingCubit, WaitingState>(
          listener: (context, state) {
            if (state.isStarted) {
              context.router.replace(const QuizzRoute());
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ОЖИДАНИЕ СТАРТА...", style: TextStyle(fontSize: 32)),
                const SizedBox(height: 40),
                BlocBuilder<WaitingCubit, WaitingState>(
                  builder: (context, state) {
                    return Text(
                      "${state.seconds}",
                      style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.blue),
                    );
                  },
                ),
                const Text("Дождитесь запуска теста преподавателем"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}