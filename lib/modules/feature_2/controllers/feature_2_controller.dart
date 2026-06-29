import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/feature_2_item.dart';

final feature2ItemsProvider = Provider<List<Feature2Item>>((ref) {
  return const [
    Feature2Item(label: 'Premium-only route protection via GoRouter'),
    Feature2Item(label: 'Persistence-backed premium state'),
    Feature2Item(label: 'Shell route tab with guard-aware deep linking'),
  ];
});