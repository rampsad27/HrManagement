import 'package:flutter/material.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          Center(child: Text("Information Content")),
          Center(child: Text("Bio Content")),
          Center(child: Text("SOS Confftent")),
        ],
      ),
    );
  }
}
