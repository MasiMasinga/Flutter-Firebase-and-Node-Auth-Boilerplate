import 'package:flutter/material.dart';

// Screens
import 'package:flutter_frontend/screens/login/login_screen.dart';

// Provider
import 'package:provider/provider.dart';
import 'package:flutter_frontend/data/providers/firebase_provider.dart';
import 'package:flutter_frontend/data/providers/node_provider.dart';

// Routes
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseProvider>(
          create: (context) => FirebaseProvider(),
        ),
        ChangeNotifierProvider<NodeProvider>(
          create: (context) => NodeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase NodeJS Auth Boilerplate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        //initialRoute: '/login',
        home: const LoginScreen(),
      ),
    );
  }
}
