import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:movie_app/widgets/custom_list_card_widget.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      visible: movies != null,
                      child: Text(
                        'Movies',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movies.results?.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.results![idx],
                            ),
                            // Text(movies.results![idx].title!),
                            separatorBuilder: (_, __) => const Divider(),
                          )
                        : Center(
                            child: Lottie.asset('assets/lottie_movie.json'),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
