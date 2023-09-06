const assetsPath = 'assets/images';

enum InputType {
  scissors,
  rock,
  paper;

  String get path => '$assetsPath/$name.png';
}

enum Result {
  win('승리'),
  draw('무승부'),
  lose('패배');

  const Result(this.displayString);

  final String displayString;
}
