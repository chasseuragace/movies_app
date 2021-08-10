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

  getRequest({String url, Map<String, dynamic> headers}) async {
    http.StreamedResponse response;
    try {
      var request = http.Request('GET', Uri.parse(url + IMDB_TOKEN));
      response = await request.send();
    } on Exception catch (e) {
      print('exception');
      _showSnackBar(message: 'Error occured ${e.runtimeType}');
      return;
    }

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      _showSnackBar(message: 'Error occured ${response.statusCode}');
    }
  }
}
