import 'package:flutter/material.dart';
import 'package:hr_management/ui/widgets/tab_bar_view.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 233, 246),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saina Maskey",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Software Engineer",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.call),
                    Icon(Icons.message),
                    Icon(Icons.email),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Applied Date: 2024-01-01"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: DefaultTabController(
                length: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Information'),
                          Tab(text: 'Bio'),
                          Tab(text: 'SOS'),
                        ],
                      ),
                      AppTabBarView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
