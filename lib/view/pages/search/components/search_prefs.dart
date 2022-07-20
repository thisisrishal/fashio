import 'package:flutter/material.dart';

class SearchClear extends StatelessWidget {
  const SearchClear({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.clear_rounded);
  }
}

class SearchVoice extends StatelessWidget {
  const SearchVoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.mic_none_sharp);
  }
}
