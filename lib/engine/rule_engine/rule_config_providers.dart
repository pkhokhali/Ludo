import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_repository.dart';
import 'package:ludo_arena/models/rule_config.dart';

final ruleConfigRepositoryProvider = Provider<RuleConfigRepository>((ref) {
  return RuleConfigRepository();
});

final ruleConfigProvider = FutureProvider<RuleConfig>((ref) async {
  return ref.watch(ruleConfigRepositoryProvider).load();
});
