import 'package:dio/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQxNzAyMTgwYmIxYmQ5Y2FmYmJjOWYyZTcwNzE4MyIsInN1YiI6IjYyNDlmYzk4MTVhNGExMDA2MzdlMjc2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lHOGLrHC7Mtgd9n325BALWt4PsDE6l2CTS47pQ1jFj8',
        },
      ),
    );
  }
}
