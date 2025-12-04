import 'package:flutter/material.dart';
import 'package:w_phonics/models/phonics_character.dart';
import 'package:w_phonics/models/phonics_group.dart';
import 'package:w_phonics/pages/lesson_item_page.dart';

class GroupItem extends StatefulWidget {
  const GroupItem({super.key, required this.phonicsGroup});
  final PhonicsGroup phonicsGroup;

  @override
  State<GroupItem> createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(left: 16, right: 16, top: 0, child: _buildHeading()),
          Positioned(
            top: 110,
            left: 32,
            right: 32,
            child: _buildGrid(context, widget.phonicsGroup.characters),
          ),
          Positioned(
            bottom: 8,
            left: 32,
            right: 32,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.phonicsGroup.color,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Practice Group ${widget.phonicsGroup.id} with readers",
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildGrid(
    BuildContext context,
    List<PhonicsCharacter> listOfCharacters,
  ) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.80,
      height: 340,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfCharacters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),

        itemBuilder: (context, index) {
          var phonicCharacter = listOfCharacters[index];
          
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LessonItemPage(
                  color: widget.phonicsGroup.color,
                  phonicsCharacter: phonicCharacter ,
                )),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  phonicCharacter.character,
                  style: TextStyle(
                    fontSize: 32,
                    color: widget.phonicsGroup.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildHeading() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/group_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Center(
          child: Text(
            "Group ${widget.phonicsGroup.id}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
