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

void setBodyScrollLocked(bool locked) {}

void saveActiveFocus() {}

void focusElementBySelector(String selector) {}

void restoreSavedFocus() {}

Unsubscribe subscribeDialogFocusTrap(String dialogSelector) => () {};

bool prefersReducedMotion() => false;

Unsubscribe subscribeVisibilityChange(void Function(bool isHidden) onChanged) =>
    () {};
