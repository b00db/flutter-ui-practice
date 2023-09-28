class Chat {
  final String image;
  final String title;
  final String content;
  final String timeline;
  final String date;
  final String time;
  final String count;

  Chat({
    required this.image,
    required this.title,
    required this.content,
    required this.timeline,
    required this.date,
    required this.time,
    required this.count,
  });
}

const String assetsPath = "assets/images";

List<Chat> chats = [
  Chat(
    image: "$assetsPath/apeach.png",
    title: "어피치",
    content: "안녕",
    timeline: "2023년 09월 15일 금요일",
    date: "09월 15일",
    time: "오전 10:10",
    count: "1",
  ),
  Chat(
    image: "$assetsPath/lion.png",
    title: "라이언",
    content: "안녕",
    timeline: "2023년 09월 14일 목요일",
    date: "09월 14일",
    time: "오후 22:15",
    count: "0",
  ),
];
