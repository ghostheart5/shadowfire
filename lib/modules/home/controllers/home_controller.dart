import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/app_routes.dart';
import '../models/home_item.dart';

final homeItemsProvider = Provider<List<HomeItem>>((ref) {
  return const [
    HomeItem(
      title: 'Feature 1',
      description: 'Open a generic module that is available to every signed-in user.',
      route: AppRoutes.feature1,
    ),
    HomeItem(
      title: 'Feature 2',
      description: 'Premium locked route guarded by GoRouter and the paywall state.',
      route: AppRoutes.feature2,
      isPremium: true,
    ),
    HomeItem(
      title: 'Feature 3',
      description: 'Standalone premium screen outside the bottom navigation shell.',
      route: AppRoutes.feature3,
      isPremium: true,
    ),
    HomeItem(
      title: 'Support',
      description: 'Reach legal and support pages via deep-link-ready routes.',
      route: AppRoutes.support,
    ),
  ];
});