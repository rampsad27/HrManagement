import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/presentation/user/bloc/user_details_bloc.dart';

class GridViewUsers extends StatefulWidget {
  const GridViewUsers({super.key});

  @override
  State<GridViewUsers> createState() => _GridViewUsersState();
}

class _GridViewUsersState extends State<GridViewUsers> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state.userDetailsStateEnum == UserDetailsStateEnum.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.userModelList != null &&
            state.userModelList!.isNotEmpty) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              // crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10, maxCrossAxisExtent: 700,
            ),
            itemCount: state.userModelList!.length,
            itemBuilder: (context, index) {
              final user = state.userModelList![index];
              return InkWell(
                onTap: () {
                  context.go('/userlist/userdetail', extra: user.email);
                },
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(user.picture),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(user.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(user.position,
                                        style: const TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Text('Applied Date: ${user.appliedDate}'),
                          Text('Address: ${user.address}'),
                          Text('Email: ${user.email}'),
                          Row(
                            children: [
                              const Icon(Icons.call),
                              Text(user.cell.toString()),
                              const SizedBox(width: 10),
                              const Icon(Icons.message),
                              Text(user.viber.toString()),
                              const SizedBox(width: 10),
                              const FaIcon(FontAwesomeIcons.whatsapp),
                              Text(user.whatsapp.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.web),
                              Text('GitHub: ${user.github}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.work),
                              Text('LinkedIn: ${user.linkedIn}'),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          Text('Bio: ${user.bio}'),
                          const Divider(color: Colors.grey),
                          const Text('Emergency Contact'),
                          Text('Name: ${user.eName}'),
                          Text('Number: ${user.eNumber}'),
                          Text('Relation: ${user.eRelation}'),
                        ],
                      ),
                    ),
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
