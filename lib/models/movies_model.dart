import 'package:flutter/foundation.dart';

class Movies {
  double? averageRating;
  String? backdropPath;
  // Comments? comments;
  // CreatedBy? createdBy;
  String? description;
  String? id;
  String? iso31661;
  String? iso6391;
  String? name;
  // ObjectIds? objectIds;
  int? page;
  String? posterPath;
  bool? public;
  List<Movie>? listMovie;
  int? revenue;
  int? runtime;
  String? sortBy;
  int? totalPages;
  int? totalResults;

  Movies(
      {averageRating,
      backdropPath,
      // comments,
      // createdBy,
      description,
      id,
      iso31661,
      iso6391,
      name,
      // objectIds,
      page,
      posterPath,
      public,
      listMovie,
      revenue,
      runtime,
      sortBy,
      totalPages,
      totalResults});

  Movies.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    backdropPath = json['backdrop_path'];
    // comments = json['comments'] != null
    //     ? new Comments.fromJson(json['comments'])
    //     : null;
    // createdBy = json['created_by'] != null
    //     ? new CreatedBy.fromJson(json['created_by'])
    //     : null;
    description = json['description'];
    id = json['id'];
    iso31661 = json['iso_3166_1'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
    // objectIds = json['object_ids'] != null
    //     ? new ObjectIds.fromJson(json['object_ids'])
    //     : null;
    page = json['page'];
    posterPath = json['poster_path'];
    public = json['public'];
    if (json['items'] != null) {
      listMovie = <Movie>[];
      json['items'].forEach((v) {
        listMovie!.add(Movie.fromJson(v));
      });
    }
    revenue = json['revenue'];
    runtime = json['runtime'];
    sortBy = json['sort_by'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average_rating'] = averageRating;
    data['backdrop_path'] = backdropPath;
    // if (comments != null) {
    //   data['comments'] = comments!.toJson();
    // }
    // if (createdBy != null) {
    //   data['created_by'] = createdBy!.toJson();
    // }
    data['description'] = description;
    data['id'] = id;
    data['iso_3166_1'] = iso31661;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    // if (objectIds != null) {
    //   data['object_ids'] = objectIds!.toJson();
    // }
    data['page'] = page;
    data['poster_path'] = posterPath;
    data['public'] = public;
    if (listMovie != null) {
      data['results'] = listMovie!.map((v) => v.toJson()).toList();
    }
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['sort_by'] = sortBy;
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  Movies copyWith({
    double? averageRating,
    String? backdropPath,
    String? description,
    String? id,
    String? iso31661,
    String? iso6391,
    String? name,
    int? page,
    String? posterPath,
    bool? public,
    List<Movie>? listMovie,
    int? revenue,
    int? runtime,
    String? sortBy,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      averageRating: averageRating ?? this.averageRating,
      backdropPath: backdropPath ?? this.backdropPath,
      description: description ?? this.description,
      id: id ?? this.id,
      iso31661: iso31661 ?? this.iso31661,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
      page: page ?? this.page,
      posterPath: posterPath ?? this.posterPath,
      public: public ?? this.public,
      listMovie: listMovie ?? this.listMovie,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      sortBy: sortBy ?? this.sortBy,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  String toString() {
    return 'Movies(averageRating: $averageRating, backdropPath: $backdropPath, description: $description, id: $id, iso31661: $iso31661, iso6391: $iso6391, name: $name, page: $page, posterPath: $posterPath, public: $public, listMovie: $listMovie, revenue: $revenue, runtime: $runtime, sortBy: $sortBy, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movies &&
        other.averageRating == averageRating &&
        other.backdropPath == backdropPath &&
        other.description == description &&
        other.id == id &&
        other.iso31661 == iso31661 &&
        other.iso6391 == iso6391 &&
        other.name == name &&
        other.page == page &&
        other.posterPath == posterPath &&
        other.public == public &&
        listEquals(other.listMovie, listMovie) &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        other.sortBy == sortBy &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return averageRating.hashCode ^
        backdropPath.hashCode ^
        description.hashCode ^
        id.hashCode ^
        iso31661.hashCode ^
        iso6391.hashCode ^
        name.hashCode ^
        page.hashCode ^
        posterPath.hashCode ^
        public.hashCode ^
        listMovie.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        sortBy.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}

class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie(
      {adult,
      backdropPath,
      genreIds,
      id,
      mediaType,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    // popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return 'Movie(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        listEquals(other.genreIds, genreIds) &&
        other.id == id &&
        other.mediaType == mediaType &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        genreIds.hashCode ^
        id.hashCode ^
        mediaType.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
