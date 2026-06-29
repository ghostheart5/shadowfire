class EmbeddingService {
  Future<List<double>> embed(String input) async {
    return input.codeUnits.take(12).map((unit) => unit / 255).toList();
  }
}