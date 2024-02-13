import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Future<String?> fetchMuscleGroupImageUrl({
  required String muscleGroups,
  required String color,
  required String transparentBackground,
}) async {
  var queryParameters = {
    'muscleGroups': muscleGroups,
    'color': color,
    'transparentBackground': transparentBackground
  };

  var headers = {
    'X-RapidAPI-Key': '035ac4210bmsh6efc40bf898e4bep15e827jsn611083833e12',
    'X-RapidAPI-Host': 'muscle-group-image-generator.p.rapidapi.com'
  };

  var uri = Uri.https(
      'muscle-group-image-generator.p.rapidapi.com', '/getImage', queryParameters);

  var response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    // If the request is successful, return the URL of the image
    return response.body;
  } else {
    // If the request failed, return null
    print('Request failed with status: ${response.statusCode}');
    return null;
  }
}