import 'package:flutter/material.dart';
import 'package:w_phonics/models/phonics_character.dart';
import 'package:w_phonics/pages/flashcard_page.dart';
import 'package:w_phonics/pages/formation_page.dart';

class LessonItemPage extends StatefulWidget {
  const LessonItemPage({
    super.key,
    required this.phonicsCharacter,
    required this.color,
  });
  final PhonicsCharacter phonicsCharacter;
  final Color color;

  @override
  State<LessonItemPage> createState() => _LessonItemPageState();
}

class _LessonItemPageState extends State<LessonItemPage> {
  @override
  Widget build(BuildContext context) {
    var phonicsCharacter = widget.phonicsCharacter;
    var phonicChar = phonicsCharacter.character;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: widget.color,
        foregroundColor: Colors.white,
        title: Text("Lesson /$phonicChar/"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          //
          // Story section
          _buildCardView(title: "Story", child: Text(phonicsCharacter.story)),
          //
          // Action Section
          _buildCardView(
            title: "Action",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(phonicsCharacter.actionImage),
                Text(phonicsCharacter.actionText),
              ],
            ),
          ),
          //
          // Flash Card
          _buildCardView(
            title: "Flash Card",
            actions: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlashcardPage(phonicChar: phonicChar),
                  ),
                );
              },
              icon: Icon(Icons.expand, color: Colors.grey.shade400),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(24),
                  ),

                  width: 150,
                  height: 150,
                  child: Center(
                    child: Text(
                      phonicChar,
                      style: TextStyle(
                        fontSize: 105,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          // Finger tracing
          _buildCardView(
            title: "Formation",
            bottomItem: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size.fromWidth(MediaQuery.sizeOf(context).width),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormationPage(color: widget.color),
                  ),
                );
              },
              child: Text("Finger tracing"),
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(24),
                ),
                width: 150,
                height: 150,
                child: Center(
                  child: Text(
                    phonicChar,
                    style: TextStyle(
                      fontSize: 105,
                      fontWeight: FontWeight.w900,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          // Writing
          _buildCardView(
            title: "Writing",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Call out the sounds below, and ask the children to write them down",
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    phonicsCharacter.listOfWriting.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            phonicsCharacter.listOfWriting[index].character,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //
          // Song
          _buildCardView(
            title: "Song",
            child: Column(children: [Text(phonicsCharacter.songText)]),
          ),
        ],
      ),
    );
  }

  Widget _buildCardView({
    required String title,
    required Widget child,
    Widget? actions,
    Widget? bottomItem,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                if (actions != null) actions,
              ],
            ),
          ),
          Container(child: child),

          if (bottomItem != null) bottomItem,
        ],
      ),
    );
  }
}
