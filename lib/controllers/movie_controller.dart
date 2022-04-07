import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovie!
        .where(
          (element) => element.title!.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    // movies.value = movies.value!.copyWith(listMovie: list);
  }

  fetch() async {
    await Future.delayed(const Duration(seconds: 2));
    final data = await _moviesRepository.getMovies();
    movies.value = data;
    _cachedMovies = movies.value;
  }
}
