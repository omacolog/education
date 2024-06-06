import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutFAB extends StatelessWidget {
  const LayoutFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Yeni İlan Oluştur",
      onPressed: () {},
      child: const Icon(CupertinoIcons.add_circled),
    );
  }
}
