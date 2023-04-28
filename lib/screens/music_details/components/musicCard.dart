import 'package:flutter/material.dart';

class MusicDetail extends StatelessWidget {
  const MusicDetail({
    super.key,
    required this.value,
    required this.label,
    required this.isBool,
  });

  final String value;
  final String label;
  final bool isBool;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        isBool
            ? (value == '1')
            ? const Text(
          'True',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
        )
            : const Text(
          'False',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
        )
            : (value.isEmpty) ? const Text(
          'No Lyrics',
          style:
          TextStyle(fontWeight: FontWeight.w400, fontSize: 20, fontStyle: FontStyle.italic),
        ) : Text(
          value,
          style:
          const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
        )
      ]
          .map((e) => Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        child: e,
      ))
          .toList(),
    );
  }
}
