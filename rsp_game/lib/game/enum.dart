const assetsPath = 'assets/images';

enum InputType {
  scissors,
  rock,
  paper;

  String get path => '$assetsPath/$name.png';
}
