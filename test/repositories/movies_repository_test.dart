import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';

void main() async {
  var repositoryImp = MoviesRepositoryImp(DioServiceImp());

  final list = await repositoryImp.getMovies();

  test('shold not be null', () {
    expect(list, isNotNull);
  });

  test('shold return Movies', () {
    expect(list, isA<Movies>());
  });

  test('shold return page 1', () {
    expect(list.page, 1);
  });

  test('shold return page 3', () async {
    var list = await repositoryImp.getMovies(page: 3);
    expect(list.page, 3);
  });

  test('shold return a list of Movie', () async {
    expect(list.listMovie, isA<List<Movie>>());
  });
}
