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
import 'package:jogak_jogak/feature/puzzle/data/data_source/mock/mock_puzzle_data_source_impl.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/puzzle_data_source.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository_impl/puzzle_repository_impl.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/mock/mock_ranking_data_source_impl.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/ranking_data_source.dart';
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
import 'package:jogak_jogak/presentation/system/system_provider.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

final mockLocator = GetIt.instance;

void mockdDISetup() {
  // puzzle controller
  mockLocator.registerSingleton(PuzzleController());

  // DataSource
  mockLocator.registerSingleton<PuzzleDataSource>(MockPuzzleDataSourceImpl());
  mockLocator.registerSingleton<RankingDataSource>(MockRankingDataSourceImpl());
  mockLocator.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(),
  );
  mockLocator.registerSingleton<UserDataSource>(
    UserRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  mockLocator.registerSingleton<LocalSystemDataSource>(
    LocalSystemDataSourceImpl(),
  );
  mockLocator.registerSingleton<RemoteSystemDataSource>(
    RemoteSystemDataSourceImpl(FirebaseFirestore.instance),
  );

  // Repository
  mockLocator.registerSingleton<PuzzleRepository>(
    PuzzleRepositoryImpl(mockLocator()),
  );
  mockLocator.registerSingleton<RankingRepository>(
    RankingRepositoryImpl(mockLocator()),
  );
  mockLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(mockLocator()),
  );
  mockLocator.registerSingleton<UserRepository>(
    UserRepositoryImpl(mockLocator()),
  );
  mockLocator.registerSingleton<SystemRepository>(
    SystemRepositoryImpl(
      localSystemDataSource: mockLocator(),
      remoteSystemDataSource: mockLocator(),
    ),
  );

  // UseCase
  mockLocator.registerSingleton(GetRandomImageUrlUseCase(mockLocator()));
  mockLocator.registerSingleton(GetRankingsUseCase(mockLocator()));
  mockLocator.registerSingleton(SignUpUseCase(mockLocator()));
  mockLocator.registerSingleton(SignInUseCase(mockLocator()));
  mockLocator.registerSingleton(SignOutUseCase(mockLocator()));
  mockLocator.registerSingleton(GetUserUseCase(mockLocator()));
  mockLocator.registerSingleton(CheckUsernameUseCase(mockLocator()));
  mockLocator.registerSingleton(UploadRankingUseCase(mockLocator()));
  mockLocator.registerSingleton(GetPuzzleHistoryUseCase(mockLocator()));
  mockLocator.registerSingleton(SavePuzzleHistoryUseCase(mockLocator()));
  mockLocator.registerSingleton(ChangePasswordUseCase(mockLocator()));
  mockLocator.registerSingleton(ChangeUsernameUseCase(mockLocator()));
  mockLocator.registerSingleton(WithdrawalUseCase(mockLocator()));
  mockLocator.registerSingleton(GetVersionUseCase(mockLocator()));
  mockLocator.registerSingleton(CheckVersionUseCase(mockLocator()));

  // 전역 provider
  mockLocator.registerSingleton(
    UserProvider(
      signInUseCase: mockLocator(),
      getUserUseCase: mockLocator(),
      signUpUseCase: mockLocator(),
      signOutUseCase: mockLocator(),
      changeUsernameUseCase: mockLocator(),
      withdrawalUseCase: mockLocator(),
    ),
  );
  mockLocator.registerSingleton(
    SystemProvider(
      checkVersionUseCase: mockLocator(),
      getVersionUseCase: mockLocator(),
    ),
  );

  // ViewModel
  mockLocator.registerFactory(
    () => SignUpViewModel(
      userProvider: mockLocator(),
      checkUsernameUseCase: mockLocator(),
    ),
  );
  mockLocator.registerFactory(
    () => SignInViewModel(
      userProvider: mockLocator(),
      systemProvider: mockLocator(),
    ),
  );
  mockLocator.registerFactory(
    () => HomeViewModel(
      getRandomImageUrlUseCase: mockLocator(),
      puzzleController: mockLocator(),
    ),
  );
  mockLocator.registerFactory(
    () => PuzzleViewModel(
      uploadRankingUseCase: mockLocator(),
      userProvider: mockLocator(),
      savePuzzleHistoryUseCase: mockLocator(),
      puzzleController: mockLocator(),
    ),
  );
  mockLocator.registerFactory(() => RankingViewModel(mockLocator()));
  mockLocator.registerFactory(
    () => MyPageViewModel(
      userProvider: mockLocator(),
      getVersionUseCase: mockLocator(),
    ),
  );
  mockLocator.registerFactory(() => PuzzleHistoryViewModel(mockLocator()));
  mockLocator.registerFactory(() => ChangePasswordViewModel(mockLocator()));
  mockLocator.registerFactory(
    () => ChangeUsernameViewModel(
      userProvider: mockLocator(),
      checkUsernameUseCase: mockLocator(),
    ),
  );
}
