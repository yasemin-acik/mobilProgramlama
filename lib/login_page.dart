import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _errorMessage;

  // Kullanıcı kaydını kontrol etme
  Future<void> _registerUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRegistered = prefs.getBool('isRegistered') ?? false;

    // Eğer kullanıcı daha önce kaydolmamışsa, kullanıcıyı kaydetmeye çalışacağız.
    if (!isRegistered) {
      prefs.setString('email', email);
      prefs.setString('password', password);
      prefs.setBool('isRegistered', true);
    }
  }

  // Giriş işlemi
  Future<void> _loginUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    if (storedEmail == email && storedPassword == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } else {
      setState(() {
        _errorMessage = "E-posta veya şifre hatalı!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Cilt Bakım Uygulaması",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Hoşgeldiniz! Cildiniz en değerli hazinenizdir, ona iyi bakın.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink[300],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // E-posta Girişi
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'E-posta',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'E-posta boş olamaz';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Geçerli bir e-posta girin';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Şifre Girişi
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Şifre',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Şifre boş olamaz';
                          } else if (value.length < 8) {
                            return 'Şifre en az 8 karakter olmalıdır';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Hata mesajı
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),

                      // Giriş Yap butonu
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _loginUser(_emailController.text, _passwordController.text);
                          }
                        },
                        child: Text("Giriş Yap"),
                      ),
                      SizedBox(height: 20),

                      // Kayıt Ol butonu
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Kayıt Ol"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _emailController,
                                      decoration: InputDecoration(labelText: "E-posta"),
                                    ),
                                    TextField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(labelText: "Şifre"),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      String email = _emailController.text;
                                      String password = _passwordController.text;

                                      if (email.isEmpty || password.isEmpty) {
                                        setState(() {
                                          _errorMessage = "E-posta ve şifre boş olamaz!";
                                        });
                                        return;
                                      }

                                      if (password.length < 8) {
                                        setState(() {
                                          _errorMessage = "Şifre en az 8 karakter olmalıdır!";
                                        });
                                        return;
                                      }

                                      // Kullanıcıyı kaydet
                                      await _registerUser(email, password);
                                      Navigator.pop(context);  // Kayıt başarılı, popup'ı kapat
                                    },
                                    child: Text("Kaydet"),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Vazgeç"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Yeni Hesap Oluştur"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}