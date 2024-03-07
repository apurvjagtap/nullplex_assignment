import 'package:nullplex_test/const/consts.dart';
import 'package:nullplex_test/controllers/auth_controller.dart';
import 'package:nullplex_test/views/auth_screens.dart/sign_in_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthController())],
      child: MaterialApp(
        home: SignInScreen(),
      ),
    );
  }
}
