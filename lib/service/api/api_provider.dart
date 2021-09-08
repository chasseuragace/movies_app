import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/features/homepage/ui/homepage.dart';
import 'package:movies_app/features/homepage/ui/trendingPage/modal/trending_response.dart';

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

  dynamic getRequest(
      {String url,
      Map<String, dynamic> headers,
      String additionalParameter}) async {
    http.StreamedResponse response;
    var responseJson;
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              url + "?api_key=$IMDB_TOKEN" + (additionalParameter ?? '')));
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
