class Question {

  // On défini les propriété d'une question
  String question;
  bool response;
  String explication;
  String imagePath;

  // Constructeur
  Question({
    required this.question,
    required this.response,
    required this.explication,
    required this.imagePath
  });

  String getImage() => 'images/$imagePath';
}