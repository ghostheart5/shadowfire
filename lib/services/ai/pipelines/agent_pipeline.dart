class AgentPipeline {
  Future<String> execute({
    required String prompt,
    required List<double> embedding,
    required List<String> memory,
  }) async {
    final memoryCount = memory.length;
    return 'Agent workflow ready. Prompt: $prompt | memory: $memoryCount | embedding: ${embedding.length}d';
  }
}