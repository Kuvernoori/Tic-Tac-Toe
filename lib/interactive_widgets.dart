import 'package:flutter/material.dart';

class InteractiveWidgets extends StatefulWidget {
  const InteractiveWidgets({super.key});

  @override
  State<InteractiveWidgets> createState() => _InteractiveWidgetsState();
}

class _InteractiveWidgetsState extends State<InteractiveWidgets> {
  bool _showText = true;
  final List<String> _items = [];

  void _toggleText() {
    setState(() {
      _showText = !_showText;
    });
  }

  void _addItem() {
    setState(() {
      _items.add('Item ${_items.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleText,
          onLongPress: _addItem,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            color: Colors.orangeAccent,
            child: const Text('Нажми / Удержи'),
          ),
        ),
        if (_showText)
          const Text('Этот текст можно спрятать'),
        const SizedBox(height: 20),
        ..._items.map((e) => Text(e)),
      ],
    );
  }
}
