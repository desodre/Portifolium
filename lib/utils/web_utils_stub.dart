typedef ScrollSpyCallback = void Function(String activeId, double progress);
typedef Unsubscribe = void Function();

void scrollToSection(String sectionId) {}

Future<bool> copyToClipboard(String text) async => false;

Unsubscribe subscribeScrollSpy(
  List<String> sectionIds,
  ScrollSpyCallback onUpdate,
) =>
    () {};

Unsubscribe subscribeEscapeKey(void Function() onEscape) => () {};

void triggerPrint() {}

Set<String> getRevealedSectionIds() => const {};

void refreshRevealOnScroll() {}

Unsubscribe initRevealOnScroll() => () {};
