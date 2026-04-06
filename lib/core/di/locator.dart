import 'package:get_it/get_it.dart';
import 'package:quizz_web/data/datasource/api_service.dart';
import 'package:quizz_web/data/repository/real_quizz_repository.dart';
import 'package:quizz_web/domain/repository/quizz_repository.dart';
import '../../data/datasource/hive_service.dart';
import '../../domain/usecases/get_crossword_questions_use_case.dart';
import '../../domain/usecases/get_crossword_timer_use_case.dart';
import '../../domain/usecases/get_quiz_questions_use_case.dart';
import '../../domain/usecases/get_quiz_timer_use_case.dart';
import '../../domain/usecases/get_top15_use_case.dart';
import '../../domain/usecases/get_top5_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/submit_crossword_answer_use_case.dart';
import '../../domain/usecases/submit_quiz_answer_use_case.dart';
import '../../ui/cubit/crossword/crossword_cubit.dart';
import '../../ui/cubit/leaderboard/leaderboard_cubit.dart';
import '../../ui/cubit/login/login_cubit.dart';
import '../../ui/cubit/quizz/quizz_cubit.dart';
import '../../ui/cubit/waiting/waiting_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<HiveService>(() => HiveService());
  sl.registerLazySingleton<ApiService>(() => ApiService());

  sl.registerLazySingleton<QuizzRepository>(
        () => RealQuizzRepository(
      dio: sl<ApiService>().dio,
      hiveService: sl<HiveService>(),
    ),
  );

  sl.registerFactory(() => LoginCubit(
    loginUseCase: sl(),
  ));

  sl.registerFactory(() => WaitingCubit(
    getTimerUseCase: sl(),
  ));

  sl.registerFactory(() => QuizzCubit(
    getQuestionsUseCase: sl(),
    submitAnswerUseCase: sl(),
  ));

  sl.registerFactory(() => LeaderboardCubit(
    getTop15UseCase: sl(),
    getTop5UseCase: sl(),
  ));

  sl.registerFactory(() => CrosswordCubit(
    getQuestionsUseCase: sl(),
    submitAnswerUseCase: sl(),
  ));

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetQuizQuestionsUseCase(sl()));
  sl.registerLazySingleton(() => GetCrosswordQuestionsUseCase(sl()));
  sl.registerLazySingleton(() => GetQuizTimerUseCase(sl()));
  sl.registerLazySingleton(() => GetCrosswordTimerUseCase(sl()));
  sl.registerLazySingleton(() => GetTop15UseCase(sl()));
  sl.registerLazySingleton(() => GetTop5UseCase(sl()));
  sl.registerLazySingleton(() => SubmitQuizAnswerUseCase(sl()));
  sl.registerLazySingleton(() => SubmitCrosswordAnswerUseCase(sl()));
}