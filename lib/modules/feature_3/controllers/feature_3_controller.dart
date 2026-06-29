import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/feature_3_item.dart';

final feature3ItemsProvider = Provider<List<Feature3Item>>((ref) {
  return const [
    Feature3Item(label: 'Standalone route outside shell navigation'),
    Feature3Item(label: 'Premium guard applied to direct URLs'),
    Feature3Item(label: 'Expandable placeholder for future AI-heavy workflows'),
  ];
});