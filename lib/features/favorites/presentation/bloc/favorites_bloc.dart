import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final List<User> _favorites = [];

  FavoritesBloc() : super(FavoritesInitial()) {
    on<AddToFavorites>(_onAddToFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
  }

  void _onAddToFavorites(AddToFavorites event, Emitter<FavoritesState> emit) {
    emit(FavoritesLoading());
    try {
      if (!_favorites.any((user) => user.id == event.user.id)) {
        _favorites.add(event.user);
      }
      emit(FavoritesLoaded(_favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  void _onRemoveFromFavorites(
      RemoveFromFavorites event, Emitter<FavoritesState> emit) {
    emit(FavoritesLoading());
    try {
      _favorites.removeWhere((user) => user.id == event.user.id);
      emit(FavoritesLoaded(_favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }
}
