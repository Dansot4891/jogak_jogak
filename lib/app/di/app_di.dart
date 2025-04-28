import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:jogak_jogak/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:jogak_jogak/feature/auth/data/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:jogak_jogak/feature/auth/domain/repository/auth_repository.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/change_password_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_in_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_out_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/remote/puzzle_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository_impl/puzzle_repository_impl.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/ranking_data_source.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/remote/ranking_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/repository_impl/ranking_repository_impl.dart';
import 'package:jogak_jogak/feature/ranking/domain/repository/ranking_repository.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/get_rankings_use_case.dart';
import 'package:jogak_jogak/feature/ranking/domain/use_case/upload_ranking_use_case.dart';
import 'package:jogak_jogak/feature/system/data/data_source/local/local_system_data_source.dart';
import 'package:jogak_jogak/feature/system/data/data_source/local/local_system_data_source_impl.dart';
import 'package:jogak_jogak/feature/system/data/data_source/remote/remote_system_data_source.dart';
import 'package:jogak_jogak/feature/system/data/data_source/remote/remote_system_data_source_impl.dart';
import 'package:jogak_jogak/feature/system/data/repository_impl/system_repository_impl.dart';
import 'package:jogak_jogak/feature/system/domain/repository/system_repository.dart';
import 'package:jogak_jogak/feature/system/domain/use_case/check_version_use_case.dart';
import 'package:jogak_jogak/feature/system/domain/use_case/get_version_use_case.dart';
import 'package:jogak_jogak/feature/user/data/data_source/remote/user_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/user/data/data_source/user_data_source.dart';
import 'package:jogak_jogak/feature/user/data/repository_impl/user_repository_impl.dart';
import 'package:jogak_jogak/feature/user/domain/repository/user_repository.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/change_username_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/check_username_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_puzzle_history_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/get_user_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/save_puzzle_history_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/withdrawal_use_case.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_view_model.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

final locator = GetIt.instance;

void diSetup() {
  // puzzle controller
  locator.registerSingleton(PuzzleController());

  // DataSource
  locator.registerSingleton<PuzzleDataSource>(
    PuzzleRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  locator.registerSingleton<RankingDataSource>(
    RankingRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  locator.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  locator.registerSingleton<UserDataSource>(
    UserRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  locator.registerSingleton<LocalSystemDataSource>(LocalSystemDataSourceImpl());
  locator.registerSingleton<RemoteSystemDataSource>(
    RemoteSystemDataSourceImpl(FirebaseFirestore.instance),
  );

  // Repository
  locator.registerSingleton<PuzzleRepository>(PuzzleRepositoryImpl(locator()));
  locator.registerSingleton<RankingRepository>(
    RankingRepositoryImpl(locator()),
  );
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator()));
  locator.registerSingleton<SystemRepository>(
    SystemRepositoryImpl(
      localSystemDataSource: locator(),
      remoteSystemDataSource: locator(),
    ),
  );

  // UseCase
  locator.registerSingleton(GetRandomImageUrlUseCase(locator()));
  locator.registerSingleton(GetRankingsUseCase(locator()));
  locator.registerSingleton(SignUpUseCase(locator()));
  locator.registerSingleton(SignInUseCase(locator()));
  locator.registerSingleton(SignOutUseCase(locator()));
  locator.registerSingleton(GetUserUseCase(locator()));
  locator.registerSingleton(CheckUsernameUseCase(locator()));
  locator.registerSingleton(UploadRankingUseCase(locator()));
  locator.registerSingleton(GetPuzzleHistoryUseCase(locator()));
  locator.registerSingleton(SavePuzzleHistoryUseCase(locator()));
  locator.registerSingleton(ChangePasswordUseCase(locator()));
  locator.registerSingleton(ChangeUsernameUseCase(locator()));
  locator.registerSingleton(WithdrawalUseCase(locator()));
  locator.registerSingleton(GetVersionUseCase(locator()));
  locator.registerSingleton(CheckVersionUseCase(locator()));

  // 전역 provider
  locator.registerSingleton(
    UserProvider(
      signInUseCase: locator(),
      getUserUseCase: locator(),
      signUpUseCase: locator(),
      signOutUseCase: locator(),
      changeUsernameUseCase: locator(),
      withdrawalUseCase: locator(),
    ),
  );

  // ViewModel
  locator.registerFactory(
    () => SignUpViewModel(
      userProvider: locator(),
      checkUsernameUseCase: locator(),
    ),
  );
  // ViewModel
  locator.registerFactory(() => SignInViewModel(locator()));
  locator.registerFactory(
    () => HomeViewModel(
      getRandomImageUrlUseCase: locator(),
      puzzleController: locator(),
    ),
  );
  locator.registerFactory(
    () => PuzzleViewModel(
      uploadRankingUseCase: locator(),
      userProvider: locator(),
      savePuzzleHistoryUseCase: locator(),
      puzzleController: locator(),
    ),
  );
  locator.registerFactory(() => RankingViewModel(locator()));
  locator.registerFactory(
    () =>
        MyPageViewModel(userProvider: locator(), getVersionUseCase: locator()),
  );
  locator.registerFactory(() => PuzzleHistoryViewModel(locator()));
  locator.registerFactory(() => ChangePasswordViewModel(locator()));
  locator.registerFactory(
    () => ChangeUsernameViewModel(
      userProvider: locator(),
      checkUsernameUseCase: locator(),
    ),
  );
}
