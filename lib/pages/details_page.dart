import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/utils/api_utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 400,
              width: double.infinity,
              child: Hero(
                tag: movie.id!,
                child: Image.network(
                  API.REQUEST_IMG(movie.posterPath!),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("    " + movie.overview!,
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        ),
      ),
    );
  }
}
