class TrendingResponse {
  int page;
  List<Results> results;
  int totalPages;
  int totalResults;

  TrendingResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  TrendingResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  String overview;
  String releaseDate;
  String title;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  int voteCount;
  int id;
  double voteAverage;
  bool video;
  double popularity;
  String mediaType;
  String name;
  String firstAirDate;
  List<String> originCountry;
  String originalName;

  Results(
      {this.overview,
      this.releaseDate,
      this.title,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.voteCount,
      this.id,
      this.voteAverage,
      this.video,
      this.popularity,
      this.mediaType,
      this.name,
      this.firstAirDate,
      this.originCountry,
      this.originalName});

  Results.fromJson(Map<String, dynamic> json) {
    overview = json['overview'];
    releaseDate = json['release_date'];
    title = json['title'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] == null ? null : json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteCount = json['vote_count'];
    id = json['id'];
    voteAverage = json['vote_average'];
    video = json['video'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
    originCountry = json['origin_country'] == null
        ? null
        : json['origin_country'].cast<String>();
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    return data;
  }
}
