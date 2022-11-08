import 'package:bloc/db/database.dart';
import 'package:bloc/networking/api.dart';
import 'package:bloc/screens/character_detail_screen.dart';
import 'package:bloc/theme/colors.dart';
import 'package:flutter/material.dart';

import '../db/character.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  _CharactersListScreenState createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  List<Character?> characters = [];
  bool? isLoading;

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    characters = Database().storedCharacters;
    getData();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getData() async {
    characters = await API().fetchRemoteGoTCharacters();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oxford,
        title: const Text('Game of Thrones Characters'),
      ),
      body: isLoading == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : isLoading == true
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          controller: controller,
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: characters.length + 1,
                          itemBuilder: (context, index) {
                            if (index < characters.length) {
                              return _buildCharacterListTile(index, context);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ],
                )
              : const Center(
                  child: Text("Bir sorun oluştu.."),
                ),
    );
  }

  ListTile _buildCharacterListTile(int index, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: oxford,
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 17, color: white),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' ${characters[index]!.name.toString()}',
            style: const TextStyle(
                fontSize: 17, color: oxford, fontWeight: FontWeight.bold),
          ),
          Text(
            characters[index]!.gender.toString(),
            style: const TextStyle(
                fontSize: 15, color: oxford, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          characters[index]!.aliases.toString(),
          style: const TextStyle(
              fontSize: 15, color: web, fontWeight: FontWeight.bold),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterDetailScreen(
                      character: characters[index]!,
                    )));
      },
    );
  }
}
