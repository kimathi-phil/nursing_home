import 'package:bloc_test/bloc_test.dart';
import 'package:nursing_home/app/app.dart';
import 'package:nursing_home/config/di/di.dart';
import 'package:nursing_home/features/authentication/authentication.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$App', () {
    late AuthenticationCubit authenticationCubit;

    setUpAll(() {
      registerFallbackValue(const AuthenticationInitial());
    });

    setUp(() {
      authenticationCubit = _MockAuthenticationCubit();
      getIt.registerFactory(() => authenticationCubit);
    });

    tearDown(getIt.reset);
    testWidgets('renders renders App and navigates to the SignInScreen',
        (tester) async {
      when(() => authenticationCubit.state)
          .thenReturn(const AuthenticationInitial());
      await tester.pumpWidget(const App());
      expect(find.byType(SignInScreen), findsOneWidget);
    });
  });
}

class _MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}
