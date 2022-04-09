class API {
  static String REQUEST_IMG(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';
  // static const REQUEST_MOVIE_LIST = 'list/1?page=1';
  static const REQUEST_MOVIE_LIST = 'discover/movie?sort_by=popularity.desc';
}
