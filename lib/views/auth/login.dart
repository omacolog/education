import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController mailInput = TextEditingController();

  TextEditingController passwordInput = TextEditingController();

  bool passwordHide = true, loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
        automaticallyImplyLeading: false,
        title: const Text("Giriş Yap"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: mailInput,
                  decoration: const InputDecoration(
                    labelText: "Mail Adresi",
                    hintText: "example@gmail.com",
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: (value) => value!.isEmpty
                      ? "Boş bırakılamaz"
                      : value.contains("@")
                          ? null
                          : "Geçersiz mail",
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordInput,
                  obscureText: passwordHide,
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    hintText: "Şifre giriniz",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        passwordHide = !passwordHide;
                        setState(() {});
                      },
                      child: passwordHide ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? "Boş bırakılamaz" : null,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Giriş yapılıyor')));
                      login();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Girilen bilgileri kontrol edin')));
                    }
                  },
                  child: loading ? const CircularProgressIndicator() : const Text("Giriş Yap"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!loading) {
      loading = true;
      setState(() {});
      await Future.delayed(const Duration(seconds: 2));
      loading = false;
      setState(() {});
      Navigator.pop(context);
    }
  }
}
