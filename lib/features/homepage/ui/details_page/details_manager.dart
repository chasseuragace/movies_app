import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/details_page/modal/details_response.dart';
import 'package:movies_app/service/api/api_provider.dart';

class DetailsManager {
  DetailsManager() {
    getDetails();
  }

  ValueNotifier<DataFetchState> detailsFetchState =
      ValueNotifier(DataFetchState.LOADING);

  ApiProvider api = ApiProvider();
  String error;
  String detail = 'https://api.themoviedb.org/3/movie/337404';
  String additionalParameter = '&append_to_response=credits,reviews';
  DetailsResponse detailsData;

//  setails manager manage data and ui of a page
//  methods are the tasks than a manager performs
//  response to class mapping / model creation
//  state update

  getDetails({id}) async {
    try {
      detailsFetchState.value = DataFetchState.LOADING;
      var detailsResponse = await api.getRequest(
          url: detail, additionalParameter: additionalParameter);
      print(detailsResponse);
      detailsData = DetailsResponse.fromJson(detailsResponse);
      detailsFetchState.value = DataFetchState.LOADED;
    } on Exception catch (e) {
      error = e.runtimeType.toString();
      detailsFetchState.value = DataFetchState.ERROR;
    }
  }
}
