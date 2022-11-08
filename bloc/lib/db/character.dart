///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class Character {
/*
{
  "url": "https://www.anapioficeandfire.com/api/characters/11",
  "name": "",
  "gender": "Female",
  "culture": "Braavosi",
  "born": "In 263 AC or 264 AC",
  "died": "",
  "titles": [
    ""
  ],
  "aliases": [
    "The waif"
  ],
  "father": "",
  "mother": "",
  "spouse": "",
  "allegiances": [
    null
  ],
  "books": [
    "https://www.anapioficeandfire.com/api/books/5"
  ],
  "povBooks": [
    null
  ],
  "tvSeries": [
    "Season 5"
  ],
  "playedBy": [
    "Faye Marsay"
  ]
} 
*/

  String? url;
  String? name;
  String? gender;
  String? culture;
  String? born;
  String? died;
  List<String?>? titles;
  List<String?>? aliases;
  String? father;
  String? mother;
  String? spouse;
  List<String?>? allegiances;
  List<String?>? books;
  List<String?>? povBooks;
  List<String?>? tvSeries;
  List<String?>? playedBy;

  Character({
    this.url,
    this.name,
    this.gender,
    this.culture,
    this.born,
    this.died,
    this.titles,
    this.aliases,
    this.father,
    this.mother,
    this.spouse,
    this.allegiances,
    this.books,
    this.povBooks,
    this.tvSeries,
    this.playedBy,
  });
  Character.fromJson(dynamic json) {
    url = json['url']?.toString();
    name = json['name']?.toString();
    gender = json['gender']?.toString();
    culture = json['culture']?.toString();
    born = json['born']?.toString();
    died = json['died']?.toString();
    if (json['titles'] != null) {
      final v = json['titles'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      titles = arr0;
    }
    if (json['aliases'] != null) {
      final v = json['aliases'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      aliases = arr0;
    }
    father = json['father']?.toString();
    mother = json['mother']?.toString();
    spouse = json['spouse']?.toString();

    if (json['books'] != null) {
      final v = json['books'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      books = arr0;
    }

    if (json['tvSeries'] != null) {
      final v = json['tvSeries'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      tvSeries = arr0;
    }
    if (json['playedBy'] != null) {
      final v = json['playedBy'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      playedBy = arr0;
    }
  }
}