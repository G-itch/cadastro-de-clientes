import 'package:cadastro/screens/client/clientpage.dart';
import 'package:cadastro/screens/login.dart';
import 'package:cadastro/screens/signup.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/clientpage',
      builder: (context, state) => ClientsPage(),
    )
  ],
);
