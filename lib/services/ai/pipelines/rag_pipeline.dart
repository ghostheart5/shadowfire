class RagPipeline {
  Future<String> enrich(String prompt) async {
    return 'RAG-ready context -> $prompt';
  }
}