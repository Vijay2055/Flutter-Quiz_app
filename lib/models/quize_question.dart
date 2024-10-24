class QuizQuestion {
  const QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> getShuffleList() {
    final List<String> shuffleList = List.of(answer);
    shuffleList.shuffle();
    return shuffleList;
  }
}
