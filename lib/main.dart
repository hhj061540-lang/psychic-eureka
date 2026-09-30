// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Use path URL strategy so the route matches /api/get-ram without a '#' hash
  usePathUrlStrategy();

  // Check if the URL path requests the API endpoint; if so, output JSON and stop
  if (handleApiRequests()) {
    return;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web API App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web RAM API Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Flutter Web App is running!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Example of how you can query your custom API endpoint
                // or instruct users where to navigate:
                // Visit /api/get-ram in your browser or via HTTP.
              },
              child: const Text('To view JSON, navigate to /api/get-ram'),
            ),
          ],
        ),
      ),
    );
  }
}
