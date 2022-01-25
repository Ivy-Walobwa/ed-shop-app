import 'package:flutter/material.dart';
import 'router/route_info_parser.dart';
import 'router/router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ShopListRouterDelegate routerDelegate = ShopListRouterDelegate();
  ShopListRouterInformationParser routerInformationParser = ShopListRouterInformationParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: routerInformationParser,
    );
  }
}
