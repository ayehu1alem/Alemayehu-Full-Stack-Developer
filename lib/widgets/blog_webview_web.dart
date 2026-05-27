import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

Widget getBlogWebView(String url) {
  final String viewType = 'blogger-iframe-${url.hashCode}';

  // Register the iframe for Web
  ui.platformViewRegistry.registerViewFactory(
    viewType,
    (int viewId) => html.IFrameElement()
      ..src = url
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%',
  );

  return HtmlElementView(viewType: viewType);
}
