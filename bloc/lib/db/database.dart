//The class shall be responsible to store the GoT characters loaded from the API in a database

import 'character.dart';

class Database {
  //The method shall load all stored GoT characters and return them as array
  List<Character> get storedCharacters {
    //TODO: load the characters from a real database.

    //*** Must be replaced
    //Currently, the characters are not loaded from the database, but simply created and returned afterwards
    final List<Character> characters = [
      Character(
        name: "Jon Snow",
        gender: "Male",
        aliases: [
          "Lord Snow",
          "Ned Stark's Bastard",
          "The Snow of Winterfell",
          "The Crow-Come-Over",
          "The 998th Lord Commander of the Night's Watch",
          "The Bastard of Winterfell",
          "The Black Bastard of the Wall",
          "Lord Crow"
        ],
      ),
      Character(
        name: "Brandon Stark",
        gender: "Male",
        aliases: ["Bran", "Bran the Broken", "The Winged Wolf"],
      ),
    ];
    return characters;
    //*** Replace up to here
  }

  //The method is to store a list of GoT characters in a database
  void save({required List<Character> characters}) {
    if (characters.isNotEmpty) {
      //TODO: save `characters` into a real database.
    }
  }
}
