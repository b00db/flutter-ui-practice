class User {
  final String backgroundImage;
  final String name;
  final String info;

  User({
    required this.backgroundImage,
    required this.name,
    required this.info,
  });
}

const String assetsPath = "assets/images";

User me = User(
  backgroundImage: "$assetsPath/chunsik.png",
  name: "춘식이",
  info: "안녕, 나는 춘식이야.",
);

List<User> friends = [
  User(
    backgroundImage: "$assetsPath/jordy.png",
    name: "죠르디",
    info: "죠르디는 청소 중...",
  ),
  User(
    backgroundImage: "$assetsPath/lion.png",
    name: "라이언",
    info: "어흥.",
  ),
  User(
    backgroundImage: "$assetsPath/apeach.png",
    name: "어피치",
    info: "어... 피치...",
  ),
  User(
    backgroundImage: "$assetsPath/rodo.png",
    name: "프로도",
    info: "멍멍!",
  ),
  User(
    backgroundImage: "$assetsPath/neo.png",
    name: "네오",
    info: "안녕하네오.",
  ),
  User(
    backgroundImage: "$assetsPath/muji.png",
    name: "무지",
    info: "무지무지 행복해!",
  ),
  User(
    backgroundImage: "$assetsPath/con.png",
    name: "콘",
    info: "구구콘... 월드콘... 콘...",
  ),
  User(
    backgroundImage: "$assetsPath/tube.png",
    name: "튜브",
    info: "난 화가 나면 얼굴이 초록색으로 변해.",
  ),
  User(
    backgroundImage: "$assetsPath/jz.png",
    name: "제이지",
    info: "힙합! 예!",
  ),
];
