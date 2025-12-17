import 'package:app/src/View/authorization_view.dart';
import 'package:app/src/View/edit_profile.dart';
import 'package:app/src/View/loading_screen.dart';
import 'package:app/src/View/main_view.dart';
import 'package:app/src/View/profile_view.dart';
import 'package:app/src/View/shopping_cart.dart';
import 'package:app/src/ViewModel/authorization_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthorizationVm(),
      child: MaterialApp(
        initialRoute: '/loading',
        routes: {
          '/main': (BuildContext context) => MainView(),
          '/shopping_cart': (BuildContext context) => ShoppingCart(),
          '/profile': (BuildContext context) => ProfileView(),
          '/edit_profile': (BuildContext context) => EditProfile(),
          '/loading': (BuildContext context) => LoadingScreen(),
          '/authorization': (BuildContext context) => AuthorizationView(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 34, 16, 16),
        ),
      ),
    ),
  );
}
