import 'package:hr_management/core/service_locator/service_locator.dart';
import 'package:hr_management/presentation/user/bloc/user_details_bloc.dart';

abstract class InitBloc {
  static void init() {
    getIt.registerSingleton<UserDetailsBloc>(UserDetailsBloc());
  }
}
