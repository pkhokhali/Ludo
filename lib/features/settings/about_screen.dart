import 'package:flutter/material.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              const Text(
                AppConstants.tagline,
              ),
              const SizedBox(height: 16),
              Text(
                'Version 1.0.0 (Phase 1 — Offline)\n'
                'Package: ${AppConstants.packageName}\n\n'
                'Built with Flutter · Riverpod · Go Router · Hive',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
