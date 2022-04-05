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
  List<Results>? results;
  int? revenue;
  int? runtime;
  String? sortBy;
  int? totalPages;
  int? totalResults;

  Movies(
      {this.averageRating,
      this.backdropPath,
      // this.comments,
      // this.createdBy,
      this.description,
      this.id,
      this.iso31661,
      this.iso6391,
      this.name,
      // this.objectIds,
      this.page,
      this.posterPath,
      this.public,
      this.results,
      this.revenue,
      this.runtime,
      this.sortBy,
      this.totalPages,
      this.totalResults});

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
      results = <Results>[];
      json['items'].forEach((v) {
        results!.add(new Results.fromJson(v));
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
    data['average_rating'] = this.averageRating;
    data['backdrop_path'] = this.backdropPath;
    // if (this.comments != null) {
    //   data['comments'] = this.comments!.toJson();
    // }
    // if (this.createdBy != null) {
    //   data['created_by'] = this.createdBy!.toJson();
    // }
    data['description'] = this.description;
    data['id'] = this.id;
    data['iso_3166_1'] = this.iso31661;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    // if (this.objectIds != null) {
    //   data['object_ids'] = this.objectIds!.toJson();
    // }
    data['page'] = this.page;
    data['poster_path'] = this.posterPath;
    data['public'] = this.public;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['sort_by'] = this.sortBy;
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
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

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      // this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
