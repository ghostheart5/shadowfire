class PromptBuilder {
  String build(String prompt, {required String variant}) {
    return '[variant=$variant] $prompt';
  }
}