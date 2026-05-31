import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';
import 'app.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(Document(
    title: 'Jhonatha Sodre – Portfolio',
    meta: {
      'description': 'Jhonatha Sodre – Software Engineer, Android Developer & QA Automation Specialist Portfolio.',
      'viewport': 'width=device-width, initial-scale=1.0',
    },
    head: [
      link(rel: 'stylesheet', href: 'styles.css'),
      link(rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0'),
      link(rel: 'icon', type: 'image/svg+xml', href: 'favicon.svg'),
      link(rel: 'apple-touch-icon', href: 'icons/Icon-192.png'),
      link(rel: 'manifest', href: 'manifest.json'),
    ],
    body: const App(),
  ));
}
