import 'package:get_it/get_it.dart';
import 'package:hr_management/data/respository/user_repository.dart';
import 'package:hr_management/domain/repository/iuser_repository.dart';

abstract class InitRepository {
  static void init() {
    GetIt.I.registerSingleton<IUserRepository>(UserRepository());
  }
}
