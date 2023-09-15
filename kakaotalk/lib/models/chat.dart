class Chat {
  final String image;
  final String title;
  final String content;
  final String date;
  final String count;

  Chat({
    required this.image,
    required this.title,
    required this.content,
    required this.date,
    required this.count,
  });
}

const String assetsPath = "assets/images";

List<Chat> chats = [
  Chat(
    image: "$assetsPath/apeach.png",
    title: "어피치",
    content: "안녕",
    date: "09월 15일",
    count: "1",
  ),
  Chat(
    image: "$assetsPath/lion.png",
    title: "라이언",
    content: "안녕",
    date: "09월 14일",
    count: "0",
  ),
];
