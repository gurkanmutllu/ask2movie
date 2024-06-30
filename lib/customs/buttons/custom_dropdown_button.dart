import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/mixins/movie_view_mixin.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['By Name', 'By Rate'];

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton(
      {super.key, required this.onChangedMovies, required this.movies});
  final ValueChanged<List<Movie>?> onChangedMovies;
  final List<Movie?> movies;
  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton>
    with MovieViewMixin {
  String dropdownValue = list.first;
  late ValueChanged<List<Movie>?> _onChangedMovies;

  @override
  void initState() {
    super.initState();
    _onChangedMovies = widget.onChangedMovies;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.amber),
      underline: Container(
        height: 2,
        color: Colors.amber,
      ),
      onChanged: (String? value) async {
        // This is called when the user selects an item.

        if (value == list.first)
          _onChangedMovies(await filterMoviesByName());
        else if (value == list.last)
          _onChangedMovies(await filterMoviesByRate());

        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
