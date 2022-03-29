class FirebaseConstants {
  static FirebaseConstants? _instance;
  static FirebaseConstants get instance => _instance ??= FirebaseConstants._init();
  FirebaseConstants._init();

  final String adminCollection = 'admin';
  final String questionCollection = 'question';
  final String questionerCollection = 'questioner';
  final String studentCollection = 'student';
  final String confirmedQuestionCollection = 'confirmed-questions';
  final String unconfirmedQuestionCollection = 'unconfirmed-questions';
  final String correctListCollection = 'correct-list';
  final String doneListCollection = 'done-list';
}
