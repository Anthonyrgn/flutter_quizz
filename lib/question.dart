class Question {

  String question;
  bool response;
  String explication;
  String imagePath;

  Question({
    required this.question,
    required this.response,
    required this.explication,
    required this.imagePath
  });

  String getImage() => 'images/$imagePath';
}