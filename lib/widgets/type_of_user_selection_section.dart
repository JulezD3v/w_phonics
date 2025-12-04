import 'package:flutter/material.dart';

class TypeOfUserSelectionSection extends StatefulWidget {
  const TypeOfUserSelectionSection({
    super.key,
    required this.options,
    required this.onSelect,
    required this.heading
  });
  final List<String> options;
  final Function(List<String> selectedItems) onSelect;
  final String heading;

  @override
  State<TypeOfUserSelectionSection> createState() =>
      _TypeOfUserSelectionSectionState();
}

class _TypeOfUserSelectionSectionState
    extends State<TypeOfUserSelectionSection> {

  Set<String> setOfSelected = {};
  
  @override
  Widget build(BuildContext context) {
    var heightOfGrid = MediaQuery.of(context).size.height * 0.38;

    return Column(
      spacing: 16,
      
      children: [
        Text(
          widget.heading,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold,  color: Colors.white,),
        ),

        SizedBox(
          height: heightOfGrid,
          width: heightOfGrid,
          child: GridView.builder(
            itemCount: 4,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              String item = widget.options[index];

              return SelectionGridItem(
                label: item,
                onSelect: () {
                  if (setOfSelected.contains(item)) {
                    setOfSelected.remove(item);
                  } else {
                    setOfSelected.add(item);
                  }

                  widget.onSelect(setOfSelected.toList());
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class SelectionGridItem extends StatefulWidget {
  const SelectionGridItem({
    super.key,
    required this.label,
    required this.onSelect,
  });
  final String label;
  final Function() onSelect;

  @override
  State<SelectionGridItem> createState() => _SelectionGridItemState();
}

class _SelectionGridItemState extends State<SelectionGridItem> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect();

        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(selected ? 255 : 110),
          borderRadius: BorderRadius.circular(42),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: selected ? Theme.of(context).primaryColor : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
