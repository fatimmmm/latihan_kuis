import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";

  bool isClicked = false;

  _navigateTohome() async {
    await Future.delayed(Duration(seconds: 1), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  username: _username,
                  nickname: _nickname,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: TextFormField(
                enabled: true,
                onChanged: (value) {
                  _nickname = value;
                },
                decoration: InputDecoration(
                    hintText: 'Masukkan Nickname',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(width: 50, color: Colors.blue))),
              ),
            ),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
              hintText: 'Masukkan Username',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 50, color: Colors.blue))),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
              //suffix: IconButton(onPressed: (){}, icon: Icons(Icon.remove_red_eye)),
              hintText: 'Masukkan Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(width: 50, color: Colors.blue))),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: isClicked == true
                ? WidgetStateProperty.all(Colors.blue)
                : WidgetStateProperty.all(Colors.lightBlue)),
        onPressed: () {
          if (_username == "fatim" && _password == "123") {
            _navigateTohome();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil'),
              ),
            );
            setState(() {
              isClicked = !isClicked;
            });
            print('login berhasil');
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
