part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<User> users;

  const HomeLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
