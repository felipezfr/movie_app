import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  late ValueNotifier<Movies?> movies = ValueNotifier(null);

  fetch() async {
    final data = await _moviesRepository.getMovies();
    movies.value = data;
  }
}
