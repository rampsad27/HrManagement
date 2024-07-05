import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hr_management/presentation/common/bottom_navigation_bar.dart';
import 'package:hr_management/presentation/user/user_list/widgets/grid_view_builder.dart';
import 'package:hr_management/presentation/user/user_list/widgets/list_view_builder.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 233, 246),
      appBar: AppBar(
        title: const Center(child: Text("Candidates")),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          log("constraints.maxWidth: ${constraints.maxWidth}");
          if (constraints.maxWidth < 600) {
            return const ListViewVertical();
          } else {
            return const GridViewUsers();
          }
        },
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
