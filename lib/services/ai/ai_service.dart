import 'embeddings/embedding_service.dart';
import 'evaluators/response_evaluator.dart';
import 'experiments/ab_testing.dart';
import 'memory/conversation_memory.dart';
import 'pipelines/agent_pipeline.dart';
import 'pipelines/rag_pipeline.dart';
import 'prompt_builder.dart';

class AiResponse {
  const AiResponse({
    required this.text,
    required this.score,
    required this.experimentGroup,
  });

  final String text;
  final double score;
  final String experimentGroup;
}

class AiService {
  AiService({
    PromptBuilder? promptBuilder,
    RagPipeline? ragPipeline,
    AgentPipeline? agentPipeline,
    ConversationMemory? conversationMemory,
    EmbeddingService? embeddingService,
    ResponseEvaluator? responseEvaluator,
    AbTesting? abTesting,
  })  : _promptBuilder = promptBuilder ?? PromptBuilder(),
        _ragPipeline = ragPipeline ?? RagPipeline(),
        _agentPipeline = agentPipeline ?? AgentPipeline(),
        _conversationMemory = conversationMemory ?? ConversationMemory(),
        _embeddingService = embeddingService ?? EmbeddingService(),
        _responseEvaluator = responseEvaluator ?? ResponseEvaluator(),
        _abTesting = abTesting ?? AbTesting();

  final PromptBuilder _promptBuilder;
  final RagPipeline _ragPipeline;
  final AgentPipeline _agentPipeline;
  final ConversationMemory _conversationMemory;
  final EmbeddingService _embeddingService;
  final ResponseEvaluator _responseEvaluator;
  final AbTesting _abTesting;

  bool _enabled = false;

  bool get isEnabled => _enabled;

  Future<void> initialize({required bool enabled}) async {
    _enabled = enabled;
  }

  Future<AiResponse> generateWorkspaceBrief(String prompt) async {
    if (!_enabled) {
      return const AiResponse(
        text: 'AI service is disabled in config. Enable it when you connect a provider.',
        score: 0.0,
        experimentGroup: 'disabled',
      );
    }

    final experimentGroup = _abTesting.selectGroup('workspace_brief');
    final composedPrompt = _promptBuilder.build(prompt, variant: experimentGroup);
    final contextualPrompt = await _ragPipeline.enrich(composedPrompt);
    final embedding = await _embeddingService.embed(contextualPrompt);
    final response = await _agentPipeline.execute(
      prompt: contextualPrompt,
      embedding: embedding,
      memory: _conversationMemory.snapshot(),
    );

    _conversationMemory.append(response);
    final score = _responseEvaluator.evaluate(response);

    return AiResponse(
      text: response,
      score: score,
      experimentGroup: experimentGroup,
    );
  }
}