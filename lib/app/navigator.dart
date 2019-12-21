import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/home/home.screen.dart';

class AppRoutes {
  static const root = '/';
  static const accountDetails = '/account-details';
  static const createAccount = '/create-account';
  static const editAccount = '/edit-account';
  static const createExpense = '/create-expense';
  static const editExpense = '/edit-expense';
}

class AppNavigator {
  static Map<String, WidgetBuilder> setupRoutes(BuildContext context) {
    return {
      AppRoutes.root: (_) => HomeScreen(),
    };
  }

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  bool pop([value]) {
    return rootNavigatorKey.currentState.pop(value);
  }
}
