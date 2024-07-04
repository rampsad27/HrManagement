import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/presentation/login/bloc/login_bloc.dart';
import 'package:hr_management/presentation/user/bloc/user_details_bloc.dart';
import 'package:hr_management/presentation/user/user_detail/widgets/tab_bar_view.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;
  const UserDetailScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    context.read<UserDetailsBloc>().add(GetUserByIdEvent(widget.userId));
    context.read<LogInBloc>().add(CheckAdminStatus());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LogInBloc, LogInState>(
          listener: (context, state) {
            if (state is AdminStatusChecked) {
              setState(() {
                isEditing = state.isAdmin;
              });
            }
          },
        ),
      ],
      child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
        builder: (context, state) {
          if (state.userDetailsStateEnum == UserDetailsStateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.userModel != null) {
            final user = state.userModel!;
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 219, 233, 246),
              appBar: AppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                actions: [
                  if (isEditing)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  user.picture,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              const Icon(Icons.email),
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Applied Date: ${user.appliedDate}'),
                          ),
                        ],
                      ),
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
                          child: Column(
                            children: [
                              const TabBar(
                                tabs: [
                                  Tab(text: 'Information'),
                                  Tab(text: 'Bio'),
                                  Tab(text: 'SOS'),
                                ],
                              ),
                              AppTabBarView(isEditing: isEditing),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
