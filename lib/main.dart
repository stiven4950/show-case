import 'dart:developer';

import 'package:example_show_case/pages/mail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ShowCase',
      theme: ThemeData(
        primaryColor: const Color(0xffEE5366),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShowCaseWidget(
          onStart: (index, key) {
            log('onStart: $index, $key');
          },
          onComplete: (index, key) {
            log('onComplete: $index, $key');
            if (index == 4) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle.light.copyWith(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
              );
            }
          },
          blurValue: 1,
          builder: Builder(builder: (context) => const MailPage()),
          autoPlayDelay: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
