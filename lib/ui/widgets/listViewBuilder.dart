import 'package:flutter/material.dart';

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
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 240,
            height: 240,
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
                      Text(
                        'hi',
                        // widget.plantModelList[index].name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'hi2',
                        // widget.plantModelList[index].type,
                        style: TextStyle(
                          fontSize: 15,
                          // color: appColor.info,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'hi3',
                            // "\$${widget.plantModelList[index].price.toString()}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Icon(
                            Icons.energy_savings_leaf_sharp,
                            color: Colors.green,
                          )
                        ],
                      ),
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
