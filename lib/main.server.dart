import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';
import 'app.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(Document(
    title: 'Jhonatha Sodre – Software Engineer & Android Developer',
    meta: {
      'description':
          'Jhonatha Sodre — Software Engineer, Android Developer (Kotlin, Flutter, NDK) & QA Automation Specialist.',
      'viewport': 'width=device-width, initial-scale=1.0',
      'theme-color': '#0A0A0B',
      'twitter:card': 'summary_large_image',
      'twitter:url': 'https://jhonsodre.xyz/',
      'twitter:title':
          'Jhonatha Sodre – Software Engineer & Android Developer',
      'twitter:description':
          'Software Engineer, Android Developer (Kotlin, Flutter, NDK) & QA Automation Specialist.',
      'twitter:image': 'https://jhonsodre.xyz/og-image.png?v=3',
      'twitter:image:alt':
          'Jhonatha Cirilo Sodre — Software Engineer, Android Developer & QA Automation',
    },
    head: [
      link(rel: 'canonical', href: 'https://jhonsodre.xyz/'),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:type',
        'content': 'website',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:site_name',
        'content': 'Jhonatha Sodre',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:url',
        'content': 'https://jhonsodre.xyz/',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:title',
        'content': 'Jhonatha Sodre – Software Engineer & Android Developer',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:description',
        'content':
            'Software Engineer, Android Developer (Kotlin, Flutter, NDK) & QA Automation Specialist.',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image',
        'content': 'https://jhonsodre.xyz/og-image.png?v=3',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image:secure_url',
        'content': 'https://jhonsodre.xyz/og-image.png?v=3',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image:type',
        'content': 'image/png',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image:width',
        'content': '1200',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image:height',
        'content': '630',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:image:alt',
        'content':
            'Jhonatha Cirilo Sodre — Software Engineer, Android Developer & QA Automation',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:locale',
        'content': 'pt_BR',
      }),
      Component.element(tag: 'meta', attributes: {
        'property': 'og:locale:alternate',
        'content': 'en_US',
      }),
      Component.element(tag: 'script', attributes: {'src': 'theme-init.js'}),
      link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
      link(
        rel: 'preconnect',
        href: 'https://fonts.gstatic.com',
        attributes: {'crossorigin': ''},
      ),
      link(
        rel: 'stylesheet',
        href:
            'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap',
      ),
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
      link(rel: 'icon', type: 'image/png', href: 'favicon.png'),
      link(rel: 'apple-touch-icon', href: 'icons/Icon-192.png'),
    ],
    body: const App(),
  ));
}
