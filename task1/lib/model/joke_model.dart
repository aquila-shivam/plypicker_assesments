class Joke {
  final String joke;

  Joke({required this.joke});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      joke: json['joke'],
    );
  }

  @override
  String toString() {
    return joke; // Return the joke text
  }
}
