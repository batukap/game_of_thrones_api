// The class is responsible to load the GoT characters from the GoTAPI (on https://anapioficeandfire.com/)
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/db/character.dart';
import 'package:http/http.dart' as http;

int page = 4;

List<Character> characters = [];

class API {
  // Note: the documentation for the API can be found here: https://anapioficeandfire.com/Documentation
  // final String _charactersRoute =  "https://reqres.in/api/users?page=2";

  // Loads the list of GoT characters
  Future<List<Character?>> fetchRemoteGoTCharacters() async {
    var url = Uri.parse(
        'https://www.anapioficeandfire.com/api/characters?page=$page&pageSize=30>');

    var res = await http.get(url);
    var jsonBody = jsonDecode(res.body.toString());
    page++;
    if (res.statusCode == 200) {
      for (Map i in jsonBody) {
        characters.add(Character.fromJson(i));
      }

      var filterdata = characters
          .where((element) =>
              element.name != "" &&
              element.aliases![0] != "" &&
              element.gender != "")
          .toList();

      return filterdata;
    } else {
      return characters;
    }
  }
}
