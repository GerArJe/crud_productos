import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_signin_example/Product/providers/product_provider.dart';
import 'package:google_signin_example/router.dart.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<ProductProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'CRUD Productos',
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        onGenerateRoute: RouterApp.generateRoute,
      ),
    );
  }
}

/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD Productos',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: SignInScreen(),
    );
  }
} */
