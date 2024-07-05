import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/core/app/app.dart';
import 'package:hr_management/core/service_locator/service_locator.dart';
import 'package:hr_management/presentation/login/bloc/login_bloc.dart';
import 'package:hr_management/presentation/user/bloc/user_details_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<UserDetailsBloc>()..add(GetUserEvent()),
        ),
        BlocProvider(create: (context) => LogInBloc()..add(CheckLoggedInUser()))
      ],
      child: const HrManagementApp(),
    );
  }
}
