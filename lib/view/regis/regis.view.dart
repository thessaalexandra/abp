import 'package:abp/utils/global.colors.dart';
import 'package:abp/view/regis/widgets/buttonloginreg.global.dart';
import 'package:abp/view/regis/widgets/buttonsignreg.regis.dart';
import 'package:abp/view/widgets/text.form.global.dart';
import 'package:flutter/material.dart';

class RegisView extends StatefulWidget {
  @override
  RegisView({super.key});

  @override
  State<RegisView> createState() => _RegisViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp regExp = new RegExp(p);

class _RegisViewState extends State<RegisView> {
  final TextEditingController namaController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordconfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                    'Sign Up',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  //// Full Name
                  TextFormGlobal(
                    validator: (value) {
                      if (value.length < 6) {
                        return "Name is too short";
                      } else if (value == "") {
                        return "Please fill full name";
                      }
                      return "";
                    },
                    controller: namaController,
                    text: 'Full Name',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                    Function: (value) {},
                  ),
                  const SizedBox(height: 15),
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
                  //// Confirm password
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
                    controller: passwordconfirmController,
                    text: 'Confirm Password',
                    obscure: true,
                    textInputType: TextInputType.emailAddress,
                    Function: (value) {},
                  ),
                  const SizedBox(height: 25),
                  const buttonsignreg(),
                  const SizedBox(height: 25),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 250,
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have an account? ',
              style: TextStyle(
                fontSize: 18,
                color: GlobalColors.mainColor,
              ),
            ),
            const buttonloginreg(),
          ],
        ),
      ),
    );
  }
}
