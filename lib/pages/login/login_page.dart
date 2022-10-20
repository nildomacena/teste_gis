import 'package:flutter/material.dart';
import 'package:teste_gis/pages/login/widgets/custom_textfield.dart';
import 'package:teste_gis/styles/style_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool loading = false;

  String? validateEmail(String? value) {
    RegExp regexEmail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null) {
      return 'Digite o email';
    }
    if (!regexEmail.hasMatch(value)) {
      return 'Digite um email válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Digite uma senha com mais de 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    navigateToHome() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      setState(() {
        loading = true;
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/tabs', (route) => false, arguments: 0);
    }

    return Scaffold(
      backgroundColor: StyleColors.bgColor,
      appBar: AppBar(
        backgroundColor: StyleColors.bgColor,
        elevation: 0,
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: '',
                    child: Text('Opções'),
                  )
                ];
              }),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              shrinkWrap: true,
              children: [
                Image.asset(
                  'assets/images/target.png',
                  width: 100,
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'my',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: 'goals',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ])),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Password',
                  validator: validatePassword,
                  obscureText: true,
                  onFieldSubmitted: (value) {
                    navigateToHome();
                  },
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        surfaceTintColor: Colors.white),
                    child: const Text('Forgot password?',
                        style: TextStyle(color: Colors.white24))),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      navigateToHome();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5cefb0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120)),
                    ),
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: const Color(0xFF5cefb0),
                              backgroundColor: Colors.black.withOpacity(.6),
                            ),
                          )
                        : Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(.6),
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white24),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
