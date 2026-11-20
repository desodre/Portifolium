import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';
import 'app.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(Document(
    title: 'Jhonatha Sodre – Portfolio',
    meta: {
      'description':
          'Jhonatha Sodre – Software Engineer, Android Developer & QA Automation Specialist Portfolio.',
      'viewport': 'width=device-width, initial-scale=1.0',
      'theme-color': '#0D1117',
      'twitter:card': 'summary_large_image',
      'twitter:title':
          'Jhonatha Sodre – Software Engineer & Android Developer',
      'twitter:description':
          'Software Engineer, Android Developer (Kotlin/Flutter) & QA Automation Specialist Portfolio.',
      'twitter:image': 'https://avatars.githubusercontent.com/u/108944889?v=4',
    },
    head: [
      Component.element(tag: 'meta', attributes: {
        'property': 'og:type',
        'content': 'website',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:title',
        'content': 'Jhonatha Sodre – Software Engineer & Android Developer',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:description',
        'content':
            'Software Engineer, Android Developer (Kotlin/Flutter) & QA Automation Specialist Portfolio.',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image',
        'content': 'https://avatars.githubusercontent.com/u/108944889?v=4',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:locale',
        'content': 'pt_BR',
      }),
      Component.element(tag: 'script', attributes: {'src': 'theme-init.js'}),
      link(rel: 'stylesheet', href: 'styles.css'),
      link(rel: 'stylesheet', href: 'styles/nav_hero.css'),
      link(rel: 'stylesheet', href: 'styles/showcase.css'),
      link(rel: 'stylesheet', href: 'styles/skills_experience.css'),
      link(rel: 'stylesheet', href: 'styles/activity_contact.css'),
      link(rel: 'stylesheet', href: 'styles/reveal.css'),
      link(rel: 'stylesheet', href: 'styles/print.css'),
      link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0'),
      link(rel: 'icon', type: 'image/svg+xml', href: 'favicon.svg'),
    ],
    body: const App(),
  ));
}
