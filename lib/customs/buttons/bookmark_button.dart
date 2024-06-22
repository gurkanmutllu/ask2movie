import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/services/movie_service.dart';
import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    required this.movie,
    super.key,
  });
  final Movie movie;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late bool _isFavorite;
  @override
  void initState() {
    super.initState();
    _isFavorite = MovieService.instance.isFavorite(widget.movie);
  }

  void _onPressed() {
    if (_isFavorite) {
      MovieService.instance.unFavorite(widget.movie);
      _isFavorite = false;
    } else {
      MovieService.instance.favorite(widget.movie);
      _isFavorite = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.amber,
      onPressed: _onPressed,
      icon: Icon(
        _isFavorite ? Icons.bookmark : Icons.bookmark_border_outlined,
        size: 30,
      ),
    );
  }
}
