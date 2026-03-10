import 'package:flutter/material.dart';
import '../models/user_model.dart';
//import 'package:latihan_kuis_a/screen/movie_list_page.dart';
import './moviel_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoggedin = false;
  bool isLoginFailed = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    bool isValid = userList.any(
      (user) => user.username == username && user.password == password,
    );

    if (isValid) {
      setState(() {
        isLoggedin = true;
        isLoginFailed = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MovieListPage(username: username,)),
      );
    } else {
      setState(() {
        isLoggedin = false;
        isLoginFailed = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
      buatlah tampilan login sederhana dengan menggunakan widget TextField untuk input username dan password, serta ElevatedButton untuk tombol login.
      - TextField untuk username dengan hint text "Username"
      - TextField untuk password dengan hint text "Password" dan obscureText true
      - ElevatedButton dengan text "Login" yang ketika ditekan akan menampilkan snackbar dengan pesan
        "Login berhasil" jika username dan password tidak kosong, atau "Login gagal" jika salah satu atau kedua field kosong.
      - jika login berhasil, navigasikan ke halaman MovieListPage (buat halaman MovieListPage 
    
     */

    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Welcome back to MiniLens!',
                style: TextStyle(color: Colors.black),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _usernameController,
                //style: TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isLoginFailed ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isLoginFailed ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
