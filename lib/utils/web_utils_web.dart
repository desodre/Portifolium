// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:html';

typedef ScrollSpyCallback = void Function(String activeId, double progress);
typedef Unsubscribe = void Function();

void scrollToSection(String sectionId) {
  window.document.getElementById(sectionId)?.scrollIntoView();
}

Future<bool> copyToClipboard(String text) async {
  try {
    final clipboard = window.navigator.clipboard;
    if (clipboard != null) {
      await clipboard.writeText(text);
      return true;
    }
  } catch (_) {
    // Fallback to execCommand below when Clipboard API is unavailable or blocked.
  }

  try {
    final textarea = TextAreaElement()
      ..value = text
      ..style.position = 'fixed'
      ..style.opacity = '0';
    document.body?.append(textarea);
    textarea.select();
    final copied = document.execCommand('copy');
    textarea.remove();
    return copied;
  } catch (_) {
    return false;
  }
}

Unsubscribe subscribeScrollSpy(
  List<String> sectionIds,
  ScrollSpyCallback onUpdate,
) {
  void compute() {
    if (sectionIds.isEmpty) return;
    final doc = window.document.documentElement;
    final maxScroll = (doc?.scrollHeight ?? 0) - (window.innerHeight ?? 0);
    final progress = maxScroll > 0
        ? (window.scrollY / maxScroll).clamp(0.0, 1.0).toDouble()
        : 0.0;

    String activeId;
    if (progress >= 0.98) {
      activeId = sectionIds.last;
    } else {
      activeId = sectionIds.first;
      for (final id in sectionIds) {
        final el = window.document.getElementById(id);
        if (el != null && el.getBoundingClientRect().top <= 120) {
          activeId = id;
        }
      }
    }
    onUpdate(activeId, progress);
  }

  final sub = window.onScroll.listen((_) => compute());
  Future.microtask(compute);
  return () => sub.cancel();
}

Unsubscribe subscribeEscapeKey(void Function() onEscape) {
  final sub = window.onKeyDown.listen((e) {
    if (e.key == 'Escape') {
      onEscape();
    }
  });
  return () => sub.cancel();
}

void triggerPrint() {
  window.print();
}

Set<String> getRevealedSectionIds() {
  final ids = <String>{};
  final els = window.document.querySelectorAll('[data-reveal].is-revealed');
  for (final el in els) {
    if (el.id.isNotEmpty) {
      ids.add(el.id);
    }
  }
  return ids;
}

void _checkRevealSections() {
  final threshold = (window.innerHeight ?? 900) * 0.94;
  final pending =
      window.document.querySelectorAll('[data-reveal]:not(.is-revealed)');
  for (final el in pending) {
    if (el.getBoundingClientRect().top <= threshold) {
      el.classes.add('is-revealed');
    }
  }
}

void refreshRevealOnScroll() {
  _checkRevealSections();
}

Unsubscribe initRevealOnScroll() {
  void revealAll() {
    final els = window.document.querySelectorAll('[data-reveal]');
    for (final el in els) {
      el.classes.add('is-revealed');
    }
  }

  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    revealAll();
    return () {};
  }

  window.document.documentElement?.classes.add('reveal-enabled');

  Future.microtask(_checkRevealSections);
  final timer = Timer(const Duration(milliseconds: 80), _checkRevealSections);
  final scrollSub = window.onScroll.listen((_) => _checkRevealSections());
  final resizeSub = window.onResize.listen((_) => _checkRevealSections());

  return () {
    timer.cancel();
    scrollSub.cancel();
    resizeSub.cancel();
  };
}
