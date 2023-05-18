import 'package:budgetlab/BudgetModule/Budgets/Budget/budget_controller.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/services/avatar_service.dart';
import 'package:flutter/material.dart';

import 'DB/ObjectBoxManager.dart';
import 'HomeModule/UI/homePage_screen.dart';

Future<void> main() async {
  // Open DB
  ObjectBoxManager.openObjectBoxStore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantsManager.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ConstantsManager.APP_NAME),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/**
 * WidgetsBindingObserver keeps track of lifecycle.
 */
class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
  // This method is required for lifecycle management
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  // Opens ObjectBox store when app is opened/resumed and closes store when app is inactive.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      ObjectBoxManager.closeObjectBoxStore();
    } else if (state == AppLifecycleState.resumed) {
      ObjectBoxManager.openObjectBoxStore();
    }
  }

  int _counter = 0;
  BudgetController budgetController = BudgetController();
  AvatarService avatarService = AvatarService();

  void _incrementCounter() async {
    budgetController.getAllBudgetsList();
    print(await avatarService.getGenderAvatarFromName("Gaurav"));
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomePageScreen();
  }

}
