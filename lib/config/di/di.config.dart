// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/authentication/application/authentication/authentication_cubit.dart'
    as _i3;
import '../../features/authentication/application/user/user_cubit.dart' as _i8;
import '../../features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i6;
import '../../features/authentication/domain/repositories/auth_repository.dart'
    as _i5;
import '../../features/authentication/domain/usecases/signin_usecase.dart'
    as _i7;
import '../../features/authentication/domain/usecases/usecases.dart' as _i4;
import '../../features/tasks/application/tasks/tasks_cubit.dart' as _i10;
import '../../features/tasks/data/repositories/tasks_repository_impl.dart'
    as _i12;
import '../../features/tasks/domain/repositories/tasks_repository.dart' as _i11;
import '../../features/tasks/domain/usecases/add_new_task_usecase.dart' as _i13;
import '../../features/tasks/domain/usecases/get_all_tasks_usecase.dart'
    as _i14;
import '../../features/tasks/domain/usecases/usecases.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $registerDependencies(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthenticationCubit>(
      () => _i3.AuthenticationCubit(get<_i4.SignInUseCase>()));
  gh.lazySingleton<_i5.AuthenticationRepository>(
      () => _i6.AuthenticationRepositoryImpl());
  gh.lazySingleton<_i7.SignInUseCase>(
      () => _i7.SignInUseCase(get<_i5.AuthenticationRepository>()));
  gh.factory<_i8.TasksCubit>(
      () => _i8.TasksCubit(get<_i9.AddNewTaskUseCase>()));
  gh.factory<_i10.TasksCubit>(() => _i10.TasksCubit(
        get<_i9.AddNewTaskUseCase>(),
        get<_i9.GetAllTasksUseCase>(),
      ));
  gh.lazySingleton<_i11.TasksRepository>(() => _i12.TasksRepositoryImpl());
  gh.lazySingleton<_i13.AddNewTaskUseCase>(
      () => _i13.AddNewTaskUseCase(get<_i11.TasksRepository>()));
  gh.lazySingleton<_i14.GetAllTasksUseCase>(
      () => _i14.GetAllTasksUseCase(get<_i11.TasksRepository>()));
  return get;
}
