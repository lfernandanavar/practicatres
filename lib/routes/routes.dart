import 'package:flutter/material.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/login_screens.dart';


Map<String, WidgetBuilder> getRoutes(){
  return{
    '/home' : (BuildContext context) => const HomeScreen(),
    '/login' : (BuildContext context) => const LoginScreen()
};
}