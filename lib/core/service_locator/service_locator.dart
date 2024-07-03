import 'package:get_it/get_it.dart';
import 'package:hr_management/core/configs/initializer/init_bloc.dart';
import 'package:hr_management/core/configs/initializer/init_repository.dart';

final getIt = GetIt.instance;

void setup() {
  InitRepository.init();
  InitBloc.init();
}
