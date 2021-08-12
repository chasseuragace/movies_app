import 'dart:convert';
import 'dart:io';

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
    var responseJson;
    try {
      var request =
          http.Request('GET', Uri.parse(url + "?api_key=$IMDB_TOKEN"));
      response = await request.send();
      responseJson = await _response(response);
    } on SocketException {
      _showSnackBar(message: "No internet Connection");
    } on FormatException {
      _showSnackBar(message: "Got stupid response from API");
    }
    return responseJson;
  }

  dynamic _response(http.StreamedResponse response) async {
    var recievedData = await response.stream.bytesToString();
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(recievedData);
        return responseJson;
      case 400:
        throw BadRequestException(recievedData);
      case 401:
      case 403:
        throw UnauthorisedException(recievedData);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
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
      "https://api.themoviedb.org/3/trending/all/week";
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
