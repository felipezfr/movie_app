import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/pages/details_page.dart';
import 'package:movie_app/utils/api_utils.dart';
import 'package:movie_app/utils/glassmorphism_utils.dart';
import 'package:movie_app/widgets/glassmorphism_card_widget.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(movie: movie),
                fullscreenDialog: true),
          )
        },
        child: GlassmorphismCardWidget(
          blur: GLASSMORPHISM.blur,
          opacity: GLASSMORPHISM.opacity,
          radius: GLASSMORPHISM.radius,
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: 134,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title!,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Votos: ' + movie.voteCount.toString(),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          'Lançamento: ' + movie.releaseDate!,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          'Idioma: ' + movie.originalLanguage!,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
