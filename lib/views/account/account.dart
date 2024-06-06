import 'package:education/views/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hesabım")),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: () {}, child: Text("Outline")),
              TextButton(onPressed: () {}, child: Text("text")),
              ElevatedButton(onPressed: () {}, child: Text("Elevated")),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              MaterialButton(onPressed: () {}, child: Text("Material")),
              CupertinoButton(child: Text("Cupertino"), onPressed: () {}),
              CupertinoButton.filled(
                child: Text("Giriş Yap"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: const Center(child: Text("Hesabım")),
    );
  }
}
