// home_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final users = userRepository.getUsers(); // Fetch users
        emit(HomeLoaded(users));
      } catch (e) {
        emit(HomeError(e.toString())); // Handle errors
      }
    });
  }
}
