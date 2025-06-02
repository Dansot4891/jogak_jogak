import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsObserver extends NavigatorObserver {
  final analytics = FirebaseAnalytics.instance;

  @override
  void didPush(Route route, Route? previousRoute) {
    final name = route.settings.name;
    analytics.logScreenView(screenName: name ?? 'unknown');
  }
}
