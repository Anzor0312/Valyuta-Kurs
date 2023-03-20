part of 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getCryupto();
  }
  CryuptoService userService = CryuptoService();
  Future<void> getCryupto() async {
    emit(HomeLoadingState());
    await userService.getCryupto().then((dynamic response) => {
          if (response is List<CryuptoModel>)
            {
              emit(HomeCompleteState(response))
              }
          else{
            emit(HomeErrorState(response))
            }
        });
  }
}
