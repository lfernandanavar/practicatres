import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practica3/services/change_theme_provider.dart';
import 'package:practica3/services/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String typeOfTheme = 'Light';

  @override
  Widget build(BuildContext context) {
      final changeTheme = Provider.of<ThemeProvider>(context);
      
      return Scaffold(
        appBar: AppBar(title: const Text('Pagina Principal')),
        drawer: _buildDrawer(changeTheme, context),
        
      );
  }

  Drawer _buildDrawer(ThemeProvider changeTheme, BuildContext context) {
    return Drawer(
            child: ListView(children: [
              ListTile(
                title: Text('Selecciona el tema'),
                trailing: Switch(
                  value: changeTheme.isLightTheme,
                  onChanged: (value) {
                    setState(() {
                      LocalStorage.prefs.setBool('isThemeLight', value);
                      changeTheme.isLightTheme = value;
                    });
                  },
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Registro "),
                // textColor:Color.fromRGBO(0, 0, 0, 0),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ]),
          );
  }
}