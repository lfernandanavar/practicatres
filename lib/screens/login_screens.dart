import 'package:flutter/material.dart';
import 'package:practica3/services/local_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  void initState() {
    if (LocalStorage.prefs.getBool('isActiveSession') != null) {
      LocalStorage.prefs.getBool('isActiveSession') as bool == true 
          ? isChecked = true 
          : isChecked = false;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SizedBox(
          width: size.width * 0.76,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Usuario
              const Text('Registro',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), //parte de arriba de registro
                    fontSize: 30,
                  )),
              _buildInputText(
                  'email', TextInputType.emailAddress, emailController),
              // pasword
              _buildInputText(
                  'password', TextInputType.visiblePassword, passwordController,
                  isPassword: true),
              // Button
              const SizedBox(height: 50),
              Row(
                children: [
                  const Text('Keep sign'),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        LocalStorage.prefs.setBool('isActiveSession', value!);
                        isChecked = value;
                      });
                    },
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if ((emailController.text == "luisafernanda@gmail") && (passwordController.text == "0806")) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: const Text('Login'))),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  TextField _buildInputText(name, inputType, controller, {isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.done),
          labelText: name,
          labelStyle: const TextStyle(
              color: Color.fromRGBO(255, 254, 254, 0),
              fontWeight: FontWeight.w900),
          floatingLabelAlignment: FloatingLabelAlignment.start),
      onChanged: (value) {},
    );
  }
}