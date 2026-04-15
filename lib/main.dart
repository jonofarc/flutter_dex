import 'package:flutter/material.dart';
import 'package:flutter_dex/dex_selection/presentation/pages/dex_selection_screen.dart';
import 'package:flutter_dex/shared/injectable_init.dart';
import 'package:flutter_dex/shared/utils/constants.dart';
import 'package:flutter_dex/shared/widget/widget_utils.dart';
import 'package:flutter_dex/type/data/models/type_chart.dart';

Future<void> bootstrapApp() async {
  //fill out cache types and weaknesses here

  final types = serviceLocator<TypeChart>();

  await Future.delayed(Duration(seconds: 1));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();

  runApp(const MyApp());

  // run in background
  bootstrapApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Dex home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().getDefaultAppbar(context),
      body: const Center(
        child: DexSelectionScreen(),
      ),
    );
  }
}
