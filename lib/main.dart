import 'package:cadastro/models/user_manager.dart';
import 'package:cadastro/router/routes.dart';
import 'package:cadastro/screens/login.dart';
import 'package:cadastro/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'firebase_options.dart';
import 'models/client_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager(), lazy: false),
        ChangeNotifierProxyProvider<UserManager, ClientManager>(
            create: (_) => ClientManager(),
            lazy: true,
            update: (_, userManager, clientManager) =>
                clientManager!..updateUser(userManager)),
      ],
      child: MaterialApp.router(
        scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
        color: Color.fromARGB(255, 16, 16, 16),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 16, 16)),
          useMaterial3: false,
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ],
            background: Container(color: Color.fromARGB(255, 16, 16, 16))),
        // onGenerateRoute: (settings) {

        //   switch (settings.name) {
        //     // case '/':
        //     //   return MaterialPageRoute(builder: (_) => const BaseScreen(),settings: settings);
        //     case '/signup':
        //       return MaterialPageRoute(,builder: (_) => SignUpPage());
        //     case '/login':
        //       return MaterialPageRoute(builder: (_) => LoginPage());
        //     case '/':
        //     default:
        //       return MaterialPageRoute(
        //           builder: (_) => LoginPage(), settings: settings);
        //   }
        // },
        routerConfig: router,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
