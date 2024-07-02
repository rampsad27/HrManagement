import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewVertical extends StatefulWidget {
  const ListViewVertical({
    super.key,
    //  required this.plantModelList
  });
  // final List<PlantModel> plantModelList;
  @override
  State<ListViewVertical> createState() => _ListViewVerticalState();
}

class _ListViewVerticalState extends State<ListViewVertical> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    // final appColor = context.appColor;
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.go('/userlist/userdetail');
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            // width: 240,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
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
                          Icon(Icons.email)
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text("Applied Data: 2024-01-01")
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
