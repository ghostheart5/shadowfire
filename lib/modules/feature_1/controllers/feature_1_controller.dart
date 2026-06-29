import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/feature_1_item.dart';

final feature1ItemsProvider = Provider<List<Feature1Item>>((ref) {
  return const [
    Feature1Item(label: 'Reusable controller surface'),
    Feature1Item(label: 'Module-specific model folder'),
    Feature1Item(label: 'Screen and widget split for future scale'),
  ];
});