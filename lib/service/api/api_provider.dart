import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/features/homepage/ui/homepage.dart';

import '../../api_tokens.dart';

// http request calls
class ApiProvider {
  _showSnackBar({String message}) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(globalContext).showSnackBar(snackBar);
  }

  dynamic getRequest({String url, Map<String, dynamic> headers}) async {
    http.StreamedResponse response;
    try {
      var request =
          http.Request('GET', Uri.parse(url + "?api_key=$IMDB_TOKEN"));
      response = await request.send();
    } on Exception catch (e) {
      _handelErrors(e);
    }

    if (response.statusCode == 200) {
      //convert response string to actual data type most probably a Map<String,dynmaic> or List<dynamic>
      var recievedData = await response.stream.bytesToString();
      var decodedData = jsonDecode(recievedData);
      return decodedData;
    } else {
      _handelErrors(response.statusCode);
    }
  }

  _handelErrors(dynamic exception) {
    if (exception is Exception) {
      print(exception);
      print('exception');
      _showSnackBar(message: 'Error occured ${exception.runtimeType}');
      return;
    }
    if (exception is int) {}
  }
}

enum DataFetchState { LOADING, LOADED, ERROR }
// manager class - api call initiate garxa
// response lai object banauxa
// ui lai data dinxa - automatic

class TMDBManager {
  TMDBManager() {
    getTrending();
  }

  static const String trending =
      "https://api.themoviedb.org/3/trending/all/day";
//todo populars ko url change garne
  static const String popular = "https://api.themoviedb.org/3/trending/all/day";
  ApiProvider api = ApiProvider();
  TrendingResponse trendingData;

  String error;
  ValueNotifier<DataFetchState> trendingFetchState =
      ValueNotifier(DataFetchState.LOADING);
  getTrending() async {
    try {
      trendingFetchState.value = DataFetchState.LOADING;
      var trndingResponse = await api.getRequest(url: trending);
      trendingData = TrendingResponse.fromJson(trndingResponse);
      trendingFetchState.value = DataFetchState.LOADED;
    } on Exception catch (e) {
      error = e.runtimeType.toString();
      trendingFetchState.value = DataFetchState.ERROR;
    }
  }

// json to dart garera popular response class banaune
  var popularData;
  ValueNotifier<DataFetchState> popularFetchState =
      ValueNotifier(DataFetchState.LOADING);
  getPopular() async {
    try {
      popularFetchState.value = DataFetchState.LOADING;
      var popularResponse = await api.getRequest(url: popular);
      popularData = TrendingResponse.fromJson(popularResponse);
      popularFetchState.value = DataFetchState.LOADED;
    } on Exception catch (e) {
      error = e.runtimeType.toString();
      popularFetchState.value = DataFetchState.ERROR;
    }
  }
}

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
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  double popularity;
  String firstAirDate;
  String name;
  List<String> originCountry;
  String originalName;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.popularity,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] == null ? null : json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    popularity = json['popularity'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    originCountry = json['origin_country'] == null
        ? null
        : json['origin_country'].cast<String>();
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['popularity'] = this.popularity;
    data['first_air_date'] = this.firstAirDate;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    return data;
  }
}
