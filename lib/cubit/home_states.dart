import 'package:bloc/bloc.dart';

import '../model/model.dart';
import '../service/get_cryupto_service.dart';

part 'home_cubit.dart';
abstract class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}

class HomeCompleteState extends HomeState {
  List<CryuptoModel> users;
  HomeCompleteState(this.users);
}
