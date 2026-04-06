import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/locator.dart';
import '../../core/navigation/app_router.dart';
import '../cubit/login/login_cubit.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _groupController = TextEditingController();
  final _journalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              context.router.replace(const WaitingRoute());
            }
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!), backgroundColor: Colors.red),
              );
            }
          },
          child: Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("KSTU QUIZ LOGIN", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _groupController,
                    decoration: const InputDecoration(labelText: "Номер группы (цифрой)"),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _journalController,
                    decoration: const InputDecoration(labelText: "Номер в журнале"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return state.isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          final gId = int.tryParse(_groupController.text) ?? 0;
                          final jId = int.tryParse(_journalController.text) ?? 0;
                          context.read<LoginCubit>().signIn(gId, jId);
                        },
                        child: const Text("ВОЙТИ В ИГРУ"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}