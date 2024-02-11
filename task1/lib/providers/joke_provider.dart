import 'package:flutter/material.dart';
import 'package:plypicker/model/joke_model.dart';
import 'package:plypicker/services/joke_service.dart';

List<Joke> _initialData = List.generate(5, (index) => Joke(joke: 'JOker'));

class JokeProvider extends ChangeNotifier {

  final JokeService _jokeService = JokeService();

  Future<void> fetchJokes() async {
    try {
      _initialData = await _jokeService.fetchJokes();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch jokes: $e');
    }
  }

  final List<Joke> _initialJokes = _initialData;
  List<Joke> get initialJokes => _initialJokes;

  List<Joke> _favoriteJokes = [];
  List<Joke> get favoriteJokes => _favoriteJokes;

  void addToFavorites(Joke joke) {
    _favoriteJokes.add(joke);
    notifyListeners();
  }

  void removeFromFavorites(Joke joke) {
    _favoriteJokes.remove(joke);
    notifyListeners();
  }
}
