import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: Routes.home,
      routes: Routes.getRoutes,
    );
  }
}

