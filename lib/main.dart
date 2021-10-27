import 'package:flutter/material.dart';
import 'package:wla/di.dart';
import 'package:wla/screens/loan_app_list_screen/loan_app_list_screen.dart';

void main() async {
  await DI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: LoanAppsScreen.routeName,
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic> _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (ctx) {
          switch (routeSettings.name) {
            case LoanAppsScreen.routeName:
              return const LoanAppsScreen();
            default:
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Ошибка навигации'),
                  ),
                  body: Center(child: Text('маршрут не найден: ' + routeSettings.name.toString())));
          }
        });
  }
}
