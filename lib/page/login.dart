import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tramp_flutter/http.dart';
import 'package:tramp_flutter/page/register.dart';
import 'package:tramp_flutter/page/tramp.dart';
import 'package:tramp_flutter/storage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double? screenWidth = MediaQuery.of(context).size.width * .99;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/login-bg.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: SizedBox(
              width: screenWidth,
              height: 450,
              child: const Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      print(emailController.text);
      var response = await dio.post(
        '/api/login',
        data: {
          'email': emailController.text,
          'password': passwordController.text
        },
      );

      print("response -> ${response.data}");

      box.write('userName', response.data['user']['name']);
      box.write('userEmail', response.data['user']['email']);
      box.write('userId', response.data['user']['id']);
      box.write('userToken', response.data['token']);
      box.write('userType', response.data['userType']);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TrampPage(),
        ),
      );
    } on DioException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
              "Something went wrong, please check your email and password.",
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }

                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                prefixIcon: Icon(Icons.password),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  login();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomePage(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 2, 50, 90),
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont' have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text("Sign Up"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
