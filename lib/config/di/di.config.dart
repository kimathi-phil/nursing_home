// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/authentication/application/authentication/authentication_cubit.dart'
    as _i3;
import '../../features/authentication/application/user/user_cubit.dart' as _i20;
import '../../features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i6;
import '../../features/authentication/domain/repositories/auth_repository.dart'
    as _i5;
import '../../features/authentication/domain/usecases/signin_usecase.dart'
    as _i15;
import '../../features/authentication/domain/usecases/usecases.dart' as _i4;
import '../../features/residents/application/residents/residents_cubit.dart'
    as _i7;
import '../../features/residents/data/repositories/residents_repository_impl.dart'
    as _i10;
import '../../features/residents/domain/repositories/residents_repository.dart'
    as _i9;
import '../../features/residents/domain/usecases/get_all_residents_usecase.dart'
    as _i26;
import '../../features/residents/domain/usecases/usecases.dart' as _i8;
import '../../features/shifts/application/shifts/shifts_cubit.dart' as _i11;
import '../../features/shifts/data/repositories/shifts_repository_impl.dart'
    as _i14;
import '../../features/shifts/domain/repositories/shifts_repository.dart'
    as _i13;
import '../../features/shifts/domain/usecases/get_all_shifts_usecase.dart'
    as _i27;
import '../../features/shifts/domain/usecases/usecases.dart' as _i12;
import '../../features/status/application/status/status_cubit.dart' as _i16;
import '../../features/status/data/repositories/status_repository_impl.dart'
    as _i19;
import '../../features/status/domain/repositories/status_repository.dart'
    as _i18;
import '../../features/status/domain/usecases/get_all_status_usecase.dart'
    as _i28;
import '../../features/status/domain/usecases/usecases.dart' as _i17;
import '../../features/tasks/application/tasks/tasks_cubit.dart' as _i22;
import '../../features/tasks/data/repositories/tasks_repository_impl.dart'
    as _i24;
import '../../features/tasks/domain/repositories/tasks_repository.dart' as _i23;
import '../../features/tasks/domain/usecases/add_new_task_usecase.dart' as _i25;
import '../../features/tasks/domain/usecases/get_all_tasks_usecase.dart'
    as _i29;
import '../../features/tasks/domain/usecases/usecases.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.ResidentsCubit>(
      () => _i7.ResidentsCubit(get<_i8.GetAllResidentsUseCase>()));
  gh.lazySingleton<_i9.ResidentsRepository>(
      () => _i10.ResidentsRepositoryImpl());
  gh.factory<_i11.ShiftsCubit>(
      () => _i11.ShiftsCubit(get<_i12.GetAllShiftsUseCase>()));
  gh.lazySingleton<_i13.ShiftsRepository>(() => _i14.ShiftsRepositoryImpl());
  gh.lazySingleton<_i15.SignInUseCase>(
      () => _i15.SignInUseCase(get<_i5.AuthenticationRepository>()));
  gh.factory<_i16.StatusCubit>(
      () => _i16.StatusCubit(get<_i17.GetAllStatusUseCase>()));
  gh.lazySingleton<_i18.StatusRepository>(() => _i19.StatusRepositoryImpl());
  gh.factory<_i20.TasksCubit>(
      () => _i20.TasksCubit(get<_i21.AddNewTaskUseCase>()));
  gh.factory<_i22.TasksCubit>(() => _i22.TasksCubit(
        get<_i21.AddNewTaskUseCase>(),
        get<_i21.GetAllTasksUseCase>(),
      ));
  gh.lazySingleton<_i23.TasksRepository>(() => _i24.TasksRepositoryImpl());
  gh.lazySingleton<_i25.AddNewTaskUseCase>(
      () => _i25.AddNewTaskUseCase(get<_i23.TasksRepository>()));
  gh.lazySingleton<_i26.GetAllResidentsUseCase>(
      () => _i26.GetAllResidentsUseCase(get<_i9.ResidentsRepository>()));
  gh.lazySingleton<_i27.GetAllShiftsUseCase>(
      () => _i27.GetAllShiftsUseCase(get<_i13.ShiftsRepository>()));
  gh.lazySingleton<_i28.GetAllStatusUseCase>(
      () => _i28.GetAllStatusUseCase(get<_i18.StatusRepository>()));
  gh.lazySingleton<_i29.GetAllTasksUseCase>(
      () => _i29.GetAllTasksUseCase(get<_i23.TasksRepository>()));
  return get;
}
