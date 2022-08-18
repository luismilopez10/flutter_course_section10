import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:seccion10_fluttercourse/providers/scan_list_provider.dart';
import 'package:seccion10_fluttercourse/providers/ui_provider.dart';
import 'package:seccion10_fluttercourse/theme/app_theme.dart';
import 'package:seccion10_fluttercourse/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'mapa': (_) => MapaPage()},
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
