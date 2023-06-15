import 'package:abp/utils/global.colors.dart';
import 'package:abp/view/widgets/button.global.dart';
import 'package:abp/view/widgets/button.regis.dart';
import 'package:abp/view/widgets/text.form.global.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '',
                      style: TextStyle(
                        color: GlobalColors.mainColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  //// email
                  TextFormGlobal(
                    validator: (value) {
                      if (value == "") {
                        return "Please fill email";
                      } else if (!regExp.hasMatch(value)) {
                        return "Email is invalid";
                      }
                      return "";
                    },
                    controller: emailController,
                    text: 'Email',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                    Function: (value) {},
                  ),
                  //// password
                  const SizedBox(height: 15),
                  TextFormGlobal(
                    validator: (value) {
                      if (value == "") {
                        return "Please fill password";
                      } else if (value.length < 8) {
                        return "Password is too short";
                      }
                      return "";
                    },
                    controller: passwordController,
                    text: 'Password',
                    obscure: true,
                    textInputType: TextInputType.emailAddress,
                    Function: (value) {},
                  ),
                  const SizedBox(height: 25),
                  const ButtonGlobal(),
                  const SizedBox(height: 25),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Don\'t have an account?  ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: GlobalColors.mainColor,
            ),
          ),
          Buttonregis(),
        ]),
      ),
    );
  }
}
