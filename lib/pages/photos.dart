import 'package:flutter/material.dart';
import 'custom_elements.dart';

class PhotoPage extends StatefulWidget {
  PhotoPage({Key? key}) : super(key: key);
  final List<int> selected = [];

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  selector(int index) {
    return () {
      setState(
        () {
          widget.selected.contains(index)
              ? widget.selected.remove(index)
              : widget.selected.add(index);
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Search',
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Counter(
                  number: widget.selected.length.toString(),
                  isVisible: widget.selected.isNotEmpty,
                )
              ],
            ),
          ),
          Wrap(
            children: List<Widget>.generate(
              50,
              (index) => SizedBox(
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: SelectivePhoto(
                    index: index,
                    isSelected: widget.selected.contains(index),
                    onSelection: selector(index)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
