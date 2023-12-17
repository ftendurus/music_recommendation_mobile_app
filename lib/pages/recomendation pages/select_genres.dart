import 'package:flutter/material.dart';
import 'package:music_recommendation_with_emotional_analysiss/models/colors.dart'
    as custom_colors;
import 'package:music_recommendation_with_emotional_analysiss/pages/recomendation%20pages/select_singer.dart';
import 'package:music_recommendation_with_emotional_analysiss/snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SelectGenres extends StatefulWidget {
  final List<String> selectedLanguages;

  const SelectGenres({Key? key, required this.selectedLanguages})
      : super(key: key);

  @override
  State<SelectGenres> createState() => _SelectGenresState();
}

class _SelectGenresState extends State<SelectGenres> {
  List<String> availableGenres = [
    'Acoustic',
    'Afrobeat',
    'Alt-Rock',
    'Alternative',
    'Ambient',
    'Anime',
    'Black-Metal',
    'Bluegrass',
    'Blues',
    'Bossanova',
    'Brazil',
    'Breakbeat',
    'British',
    'Cantopop',
    'Chicago-House',
    'Children',
    'Chill',
    'Classical',
    'Club',
    'Comedy',
    'Country',
    'Dance',
    'Dancehall',
    'Death-Metal',
    'Deep-House',
    'Detroit-Techno',
    'Disco',
    'Disney',
    'Drum-and-Bass',
    'Dub',
    'Dubstep',
    'EDM',
    'Electro',
    'Electronic',
    'Emo',
    'Folk',
    'Forro',
    'French',
    'Funk',
    'Garage',
    'German',
    'Gospel',
    'Goth',
    'Grindcore',
    'Groove',
    'Grunge',
    'Guitar',
    'Happy',
    'Hard-Rock',
    'Hardcore',
    'Hardstyle',
    'Heavy-Metal',
    'Hip-Hop',
    'Holidays',
    'Honky-Tonk',
    'House',
    'IDM',
    'Indian',
    'Indie',
    'Indie-Pop',
    'Industrial',
    'Iranian',
    'J-Dance',
    'J-Idol',
    'J-Pop',
    'J-Rock',
    'Jazz',
    'K-Pop',
    'Kids',
    'Latin',
    'Latino',
    'Malay',
    'Mandopop',
    'Metal',
    'Metal-Misc',
    'Metalcore',
    'Minimal-Techno',
    'Movies',
    'MPB',
    'New-Age',
    'New-Release',
    'Opera',
    'Pagode',
    'Party',
    'Philippines-OPM',
    'Piano',
    'Pop',
    'Pop-Film',
    'Post-Dubstep',
    'Power-Pop',
    'Progressive-House',
    'Psych-Rock',
    'Punk',
    'Punk-Rock',
    'R-N-B',
    'Rainy-Day',
    'Reggae',
    'Reggaeton',
    'Road-Trip',
    'Rock',
    'Rock-N-Roll',
    'Rockabilly',
    'Romance',
    'Sad',
    'Salsa',
    'Samba',
    'Sertanejo',
    'Show-Tunes',
    'Singer-Songwriter',
    'Ska',
    'Sleep',
    'Songwriter',
    'Soul',
    'Soundtracks',
    'Spanish',
    'Study',
    'Summer',
    'Swedish',
    'Synth-Pop',
    'Tango',
    'Techno',
    'Trance',
    'Trip-Hop',
    'Turkish',
    'Work-Out',
    'World-Music',
  ];

  List<String> selectedGenres = ['Pop', 'Rock', 'Hip-Hop'];

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tür Seç'),
          content: Container(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: availableGenres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(availableGenres[index]),
                  onTap: () {
                    setState(() {
                      String genreCode = availableGenres[index];
                      if (selectedGenres.contains(genreCode)) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message: "Bu tür zaten seçilmiş",
                          ),
                        );
                        return;
                      } else if (selectedGenres.length >= 3) {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            message: "Higher than 3 genres can not be added",
                          ),
                        );
                        return;
                      } else {
                        selectedGenres.add(genreCode);
                      }
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_colors.pinkPrimary,
        title: const Text(
          "Recommend Song",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(7),
          child: Container(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              'Hangi türde şarkı dinlemek istersin? ',
              style: TextStyle(
                fontSize: 24,
                color: custom_colors.pinkPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              child: Expanded(
                child: ListView.builder(
                  itemCount: selectedGenres.length,
                  itemBuilder: (context, index) {
                    String language = selectedGenres.elementAt(index);
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language),
                          Hero(
                            tag: UniqueKey(),
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  selectedGenres.remove(language);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 100,
                  child: FloatingActionButton(
                    heroTag: 'aaa',
                    onPressed: _showLanguageDialog,
                    backgroundColor: custom_colors.pinkPrimary,
                    child: const Text(
                      'Tür Ekle',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 8, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: FloatingActionButton(
                  heroTag: 'aaaads',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: custom_colors.pinkPrimary,
                  foregroundColor: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 8),
                      Text('Geri'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 50,
                child: FloatingActionButton(
                  backgroundColor: custom_colors.pinkPrimary,
                  foregroundColor: Colors.white,
                  heroTag: 'aasdsaa',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectSinger(
                              selectedLanguages: widget.selectedLanguages,
                              selectedGenres: selectedGenres)),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('İleri'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
