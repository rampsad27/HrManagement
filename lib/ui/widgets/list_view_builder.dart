import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/presentation/user_details/bloc/user_details_bloc.dart';

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
  @override
  Widget build(BuildContext context) {
    // final appColor = context.appColor;
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state.userDetailsStateEnum == UserDetailsStateEnum.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.userModelList != null &&
            state.userModelList!.isNotEmpty) {
          return ListView.builder(
            itemCount: state.userModelList!.length,
            itemBuilder: (context, index) {
              final user = state.userModelList![index];
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(user.picture),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        user.name,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        user.position,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.call),
                                const Icon(Icons.message),
                                const Icon(Icons.email)
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Text(user.appliedDate)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state.error != null) {
          return Center(
            child: Text(state.error!),
          );
        } else {
          return const Center(
            child: Text("No Data Found"),
          );
        }
      },
    );
  }
}
