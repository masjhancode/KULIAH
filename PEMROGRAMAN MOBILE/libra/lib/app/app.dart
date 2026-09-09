import 'package:flutter/material.dart';
import 'package:libra/app/router/app_router.dart';
import 'package:libra/app/router/route_names.dart';

import 'package:libra/app/themes/app_themes.dart';

class LibraApp extends StatelessWidget {
  const LibraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'LIBRA',

      theme: AppTheme.lightTheme,

      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
