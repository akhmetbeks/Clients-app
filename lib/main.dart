import 'package:clients_scroll_app/providers/clients.dart';
import 'package:clients_scroll_app/providers/visibleText.dart';
import 'package:clients_scroll_app/screens/auth_screen.dart';
import 'package:clients_scroll_app/screens/clients_screen.dart';
import 'screens/no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Clients(),
        ),
        ChangeNotifierProvider(
          create: (context) => VisibleText(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clients App',
        home: AuthScreen(),
        routes: {
          ClientsScreen.routeName: (ctx) => ClientsScreen(),
          NoDataFound.routeName: (ctx) => NoDataFound()
        },
      ),
    );
  }
}
