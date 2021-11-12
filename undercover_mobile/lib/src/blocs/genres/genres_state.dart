part of 'genres_bloc.dart';

@immutable
abstract class GenresState {}

class GenresInitial extends GenresState {}

class LoadingGenres extends GenresState {}

class GenresLoaded extends GenresState {
  GenresLoaded(this.genres);

  final List<Genre> genres;
}

class GenresError extends GenresState {
  GenresError(this.message);

  final String message;
}
