import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';
import 'package:hookee/features/home/data/models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeInitialState()) {
    on<LoadUsersEvent>(_onLoadUsers);
  }

  Future<void> _onLoadUsers(
      LoadUsersEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final users = userRepository.getUsers();
      emit(HomeLoadedState(users));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
