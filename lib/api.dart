// lib/api.dart
import 'dart:convert'
    if (dart.library.html) 'dart:html' as html;
import 'package:flutter/foundation.dart';

/// Checks if the current URL path requests the RAM API and outputs pure JSON text.
bool handleApiRequests() {
  if (!kIsWeb) return false;

  final String pathname = html.window.location.pathname ?? '';

  // Match /api/get-ram (ignoring base href prefixes or trailing slashes)
  if (pathname.endsWith('/api/get-ram') || pathname == '/api/get-ram') {
    final Map<String, dynamic> responseData = {
      "ram_mb": 1024,
    };

    final String jsonString = jsonEncode(responseData);

    // Replace the document root text directly with pure JSON (no HTML tags)
    try {
      html.document.documentElement?.text = jsonString;
    } catch (_) {
      html.document.body?.text = jsonString;
    }

    return true;
  }
  
  return false;
}
