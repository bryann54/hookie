part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddToFavorites extends FavoritesEvent {
  final User user;

  const AddToFavorites(this.user);

  @override
  List<Object> get props => [user];
}

class RemoveFromFavorites extends FavoritesEvent {
  final User user;

  const RemoveFromFavorites(this.user);

  @override
  List<Object> get props => [user];
}
