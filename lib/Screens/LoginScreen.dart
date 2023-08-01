import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hinhIcon = true;
  bool _validationUsername = false;
  bool _validationPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Card(
              color: Colors.blue[200],
              child: Container(
                width: double.maxFinite,
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "UserName",
                          //
                          errorText: _validationUsername
                              ? "Username can not null"
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        onTap: () {
                          setState(() {
                            _hinhIcon = !_hinhIcon;
                          });
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: _hinhIcon
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          //
                          errorText: _validationPassword
                              ? "Password can not null"
                              : null,
                        ),
                        obscureText: _hinhIcon,
                      ),
                    ),
                    //Button Login
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _usernameController.text.isEmpty
                              ? _validationUsername = true
                              : _validationUsername = false;
                          _passwordController.text.isEmpty
                              ? _validationPassword = true
                              : _validationPassword = false;
                          if (_usernameController.text == "root" &&
                              _passwordController.text == "123") {
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return HomeScreen(
                            //     message: _usernameController.text,
                            //   );
                            // }), (route) => false);
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => false,
                                arguments: "${_usernameController.text}");
                          }
                        });
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
