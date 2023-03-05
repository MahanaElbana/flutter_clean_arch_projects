
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch_setstate/components/app_scroll_behavior.dart';
import 'package:movies_app_clean_arch_setstate/core/utils/app_strings.dart';
import '../movies_module/presentation/screens/movies_screen.dart';


class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: MoviesAppStrings.title,
      home: const MoviesScreen(),
    );
  }
}