import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image_search_pixabay/api/constants.dart';

import '../../config/key_collection.dart';
import '../constants.dart';

class SearchApis {
  static onImageSearch(String query,
      {int pageIndex = 1, int totalItemsPerPage = 15}) async {
    final url = 'baseUrl+keyUrl+searchUrl+endUrl';

    debugPrint(url);

    final _response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${dotenv.env[KeyCollection.pixabayApiKey]}"
    });

    return json.decode(_response.body);
  }
}
