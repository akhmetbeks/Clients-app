import 'package:clients_scroll_app/screens/clients_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFC4C4C4),
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.fitWidth)),
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Вход',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'SF Pro Display',
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: AuthCard(
                  key: const Key(''),
                ),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    Navigator.of(context).pushReplacementNamed(ClientsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Container(
        height: Platform.isAndroid
            ? deviceSize.height * 0.5
            : deviceSize.height * 0.4,
        width: deviceSize.width * 0.80,
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Color(0xFF9B51E0)),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color(0xFF999999),
                          fontFamily: 'SF Pro Text',
                          fontSize: 16),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF828282),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Неправильно введена почта';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['email'] = value!;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      floatingLabelStyle: TextStyle(color: Color(0xFF9B51E0)),
                      labelText: 'Пароль',
                      labelStyle: TextStyle(
                          color: Color(0xFF999999),
                          fontFamily: 'SF Pro Text',
                          fontSize: 16),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF828282),
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Пустое поле!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['password'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor:
                            const Color(0xFF9B51E0).withOpacity(0.5),
                      ),
                      onPressed: _submit,
                      child: const Text('Войти'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
