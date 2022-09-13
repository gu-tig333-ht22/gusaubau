import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'itemhandler.dart';

class RequestHandler {
  String _mainUrl = "https://todoapp-api.apps.k8s.gu.se";
  // https://todoapp-api.apps.k8s.gu.se/
  String _myKey = "14e7b2e6-97c1-47dc-9583-0fed83f884a0";
  String _path = "/todos";

  String url =
      "https://todoapp-api.apps.k8s.gu.se/todos/?key=14e7b2e6-97c1-47dc-9583-0fed83f884a0";

  Future fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      // Send authorization headers to the backend.
      // headers: {
      //   HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
      // },
    );
    final responseJson = jsonDecode(response.body);

    print(responseJson);
  }

  Future getTodos() async {
    http.Response respons = await http.get(
      Uri.parse(url),
    );

    debugPrint(respons.statusCode.toString());
    final responsJson = jsonDecode(respons.body);
    print(responsJson[0]["id"]);
  }

  Future AddTodo(String newName) async {
    //Map data = {"title": "Städa"};
    //var body = {"title": Item.name()};
    http.Response respons = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"title": newName}),
      // encoding: json,
    );
    debugPrint(respons.statusCode.toString());
    final responsJson = jsonDecode(respons.body);
    print(responsJson);
  }

  // Future DeleteTodo(Item) async {
  //   Map data = {"id": Item.getid()};

  // }
}


// Kan användas som construktor till class se exempel
// https://docs.flutter.dev/cookbook/networking/authenticated-requests

  // factory Album.fromJson(Map<String, dynamic> json) {
  //   return Album(
  //     userId: json['userId'],
  //     id: json['id'],
  //     title: json['title'],
  //   );
  // }

