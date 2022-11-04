import 'package:nursing_home/config/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$registerDependencies')
Future<void> registerDependencies() async {
  await $registerDependencies(getIt);
}
