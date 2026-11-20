class ExperienceEntry {
  final String role;
  final String company;
  final String period;
  final bool isCurrent;
  final List<String> bullets;
  final List<String> techs;

  const ExperienceEntry({
    required this.role,
    required this.company,
    required this.period,
    this.isCurrent = false,
    required this.bullets,
    required this.techs,
  });
}

class ProjectCaseStudy {
  final String role;
  final String problem;
  final String architecture;
  final List<String> highlights;

  const ProjectCaseStudy({
    required this.role,
    required this.problem,
    required this.architecture,
    required this.highlights,
  });
}

class ProjectEntry {
  final String name;
  final String url;
  final String description;
  final List<String> techs;
  final String icon;
  final bool isFeatured;
  final ProjectCaseStudy? caseStudy;

  const ProjectEntry({
    required this.name,
    required this.url,
    required this.description,
    required this.techs,
    this.icon = 'code',
    this.isFeatured = false,
    this.caseStudy,
  });
}

enum AppCategory { mobile, desktop, web }

class PublishedApp {
  final String name;
  final String description;
  final List<String> techStack;
  final List<String> screenshotAssets;
  final String? storeUrl;
  final String? repoUrl;
  final AppCategory category;
  final String? badgeNote;

  const PublishedApp({
    required this.name,
    required this.description,
    required this.techStack,
    required this.screenshotAssets,
    this.storeUrl,
    this.repoUrl,
    this.category = AppCategory.mobile,
    this.badgeNote,
  });
}

class HeroHighlight {
  final String value;
  final String label;

  const HeroHighlight({required this.value, required this.label});
}

class OpenSourceLibrary {
  final String name;
  final String description;
  final String registry; // 'pub.dev', 'PyPI', 'GitHub'
  final String url;
  final List<String> techStack;
  final String? badgeText;

  const OpenSourceLibrary({
    required this.name,
    required this.description,
    required this.registry,
    required this.url,
    required this.techStack,
    this.badgeText,
  });
}

class SkillCategory {
  final String label;
  final String domain;
  final List<String> skills;

  const SkillCategory({
    required this.label,
    required this.domain,
    required this.skills,
  });
}

class EducationEntry {
  final String degree;
  final String institution;
  final String period;
  final String? note;

  const EducationEntry({
    required this.degree,
    required this.institution,
    required this.period,
    this.note,
  });
}

class CourseEntry {
  final String title;
  final String provider;
  final String year;

  const CourseEntry({
    required this.title,
    required this.provider,
    required this.year,
  });
}

// ── Translatable content container ───────────────────────────────────────────

class PortfolioContent {
  final String title;
  final String bio;
  final List<ExperienceEntry> experiences;
  final List<ProjectEntry> projects;
  final List<PublishedApp> publishedApps;
  final List<OpenSourceLibrary> openSourceLibraries;
  final List<SkillCategory> skills;
  final List<EducationEntry> education;
  final List<CourseEntry> courses;
  final List<Map<String, String>> languages;
  // UI strings
  final String skipToContent;
  final String navAriaLabel;
  final String navMenuOpenLabel;
  final String navMenuCloseLabel;
  final String themeToLightLabel;
  final String themeToDarkLabel;
  final String langSwitchLabel;
  final String heroGreeting;
  final String heroViewWork;
  final String heroPrimaryCta;
  final String heroPrintCv;
  final List<HeroHighlight> heroHighlights;
  final String sectionExperience;
  final String sectionExperienceSubtitle;
  final String expShowMore;
  final String expShowLess;
  final String sectionProjects;
  final String sectionProjectsSubtitle;
  final String projectsFilterAll;
  final String projectsFeaturedBadge;
  final String projViewCaseStudy;
  final String projOpenRepo;
  final String caseStudyRoleLabel;
  final String caseStudyProblemLabel;
  final String caseStudyArchitectureLabel;
  final String caseStudyHighlightsLabel;
  final String caseStudyStackLabel;
  final String caseStudyCloseLabel;
  final String sectionPublishedApps;
  final String sectionPublishedAppsSubtitle;
  final String categoryMobile;
  final String categoryDesktop;
  final String categoryWeb;
  final String appPrevLabel;
  final String appNextLabel;
  final String appSlideDotPrefix;
  final String appScreenshotPrefix;
  final String appZoomHint;
  final String appCloseLightbox;
  final String sectionOpenSourceTitle;
  final String sectionOpenSourceSubtitle;
  final String sectionSkills;
  final String sectionSkillsSubtitle;
  final String skillsCoreTitle;
  final String skillsCoreSubtitle;
  final String skillsFilterAll;
  final String skillsFilterMobile;
  final String skillsFilterBackend;
  final String skillsFilterQuality;
  final String skillsFilterWeb;
  final String sectionEducation;
  final String sectionEducationSubtitle;
  final String coursesHeading;
  final String spokenLanguagesHeading;
  final String sectionContact;
  final String sectionContactSubtitle;
  final String contactAvailableLabel;
  final String contactBuiltWith;
  final String contactCopyEmail;
  final String contactCopied;
  final String contactSendEmail;
  final String sectionContributions;
  final String sectionContributionsSubtitle;
  final String contributionsInLastYear;
  final String contributionsLess;
  final String contributionsMore;
  final String contribRetryLabel;
  final String contribInspectHint;
  final String contribNoneOn;
  final String contribSingleOn;
  final String contribPluralOn;
  final List<String> contribDayLabels;
  final List<String> contribMonthAbbrs;

  const PortfolioContent({
    required this.title,
    required this.bio,
    required this.experiences,
    required this.projects,
    required this.publishedApps,
    required this.openSourceLibraries,
    required this.skills,
    required this.education,
    required this.courses,
    required this.languages,
    required this.skipToContent,
    required this.navAriaLabel,
    required this.navMenuOpenLabel,
    required this.navMenuCloseLabel,
    required this.themeToLightLabel,
    required this.themeToDarkLabel,
    required this.langSwitchLabel,
    required this.heroGreeting,
    required this.heroViewWork,
    required this.heroPrimaryCta,
    required this.heroPrintCv,
    required this.heroHighlights,
    required this.sectionExperience,
    required this.sectionExperienceSubtitle,
    required this.expShowMore,
    required this.expShowLess,
    required this.sectionProjects,
    required this.sectionProjectsSubtitle,
    required this.projectsFilterAll,
    required this.projectsFeaturedBadge,
    required this.projViewCaseStudy,
    required this.projOpenRepo,
    required this.caseStudyRoleLabel,
    required this.caseStudyProblemLabel,
    required this.caseStudyArchitectureLabel,
    required this.caseStudyHighlightsLabel,
    required this.caseStudyStackLabel,
    required this.caseStudyCloseLabel,
    required this.sectionPublishedApps,
    required this.sectionPublishedAppsSubtitle,
    required this.categoryMobile,
    required this.categoryDesktop,
    required this.categoryWeb,
    required this.appPrevLabel,
    required this.appNextLabel,
    required this.appSlideDotPrefix,
    required this.appScreenshotPrefix,
    required this.appZoomHint,
    required this.appCloseLightbox,
    required this.sectionOpenSourceTitle,
    required this.sectionOpenSourceSubtitle,
    required this.sectionSkills,
    required this.sectionSkillsSubtitle,
    required this.skillsCoreTitle,
    required this.skillsCoreSubtitle,
    required this.skillsFilterAll,
    required this.skillsFilterMobile,
    required this.skillsFilterBackend,
    required this.skillsFilterQuality,
    required this.skillsFilterWeb,
    required this.sectionEducation,
    required this.sectionEducationSubtitle,
    required this.coursesHeading,
    required this.spokenLanguagesHeading,
    required this.sectionContact,
    required this.sectionContactSubtitle,
    required this.contactAvailableLabel,
    required this.contactBuiltWith,
    required this.contactCopyEmail,
    required this.contactCopied,
    required this.contactSendEmail,
    required this.sectionContributions,
    required this.sectionContributionsSubtitle,
    required this.contributionsInLastYear,
    required this.contributionsLess,
    required this.contributionsMore,
    required this.contribRetryLabel,
    required this.contribInspectHint,
    required this.contribNoneOn,
    required this.contribSingleOn,
    required this.contribPluralOn,
    required this.contribDayLabels,
    required this.contribMonthAbbrs,
  });
}

// ── Non-translatable constants ────────────────────────────────────────────────

const String kName = 'Jhonatha Cirilo Sodre';
const String kLocation = 'Manaus, AM, Brazil';
const String kEmail = 'jhon.desodre@gmail.com';
const String kPhone = '+55 (92) 993165406';
const String kGitHub = 'https://github.com/desodre';
const String kLinkedIn = 'https://www.linkedin.com/in/jhonsodre/';
const String kAvatarUrl =
    'https://avatars.githubusercontent.com/u/108944889?v=4';
const String apiBaseContributions =
    'https://github-contributions-api.jogruber.de/v4/desodre';

const List<String> kCoreSkills = [
  'Kotlin Multiplatform',
  'Jetpack Compose',
  'Flutter',
  'Python',
  'Django',
  'FastAPI',
  'Rust',
  'Android NDK',
  'PostgreSQL',
  'Docker',
  'UIAutomator2',
  'GitHub Actions',
];

// Technology names are shared so both languages expose the same skills.
const kLanguageSkills = [
  'Python',
  'Dart',
  'Kotlin',
  'Rust',
  'Java',
  'Swift',
  'JavaScript',
  'SQL',
  'R',
  'Shell',
];

const kMobileSkills = [
  'Flutter',
  'Kotlin Multiplatform',
  'Compose Multiplatform',
  'Jetpack Compose',
  'Material 3',
  'SwiftUI',
  'Koin',
  'Coroutines',
  'StateFlow',
  'ViewModel',
  'Navigation Compose',
  'kotlinx.serialization',
  'kotlinx-datetime',
  'Firebase Analytics',
  'MapLibre',
];

const kBackendSkills = [
  'Django',
  'Django REST Framework',
  'Django Ninja',
  'FastAPI',
  'Django Channels',
  'Celery',
  'Celery Beat',
  'RabbitMQ',
  'Scrapy',
  'Gunicorn',
  'Daphne',
  'Uvicorn',
  'WhiteNoise',
  'Flower',
];

const kWebSkills = [
  'HTML5',
  'CSS3',
  'Django Templates',
  'HTMX',
  'Tailwind CSS',
  'Alpine.js',
  'jQuery',
  'Chart.js',
  'DataTables',
  'Tom Select',
  'Choices.js',
  'Tribute.js',
  'Signature Pad',
  'PWA',
  'Web Push',
  'PostCSS',
  'Autoprefixer',
];

const kDatabaseSkills = [
  'PostgreSQL',
  'SQL Server',
  'MySQL',
  'SQLite',
  'MongoDB',
  'Redis',
  'Memcached',
];

const kArchitectureSkills = [
  'MVVM',
  'Unidirectional Data Flow',
  'Dependency Injection',
  'REST APIs',
  'OpenAPI',
  'OpenAPI Generator',
  'Retrofit',
  'OkHttp',
  'WebSockets',
  'JWT',
  'HTTPX',
  'Requests',
];

const kNativeSkills = [
  'Android NDK',
  'Binder',
  'Rust FFI',
  'Serde',
  'serde_json',
  'Android Keystore',
  'iOS Keychain',
  'AES-GCM',
  'OpenGL',
  'CTS/GTS/VTS',
  'Linux Kernel',
  'Firmware',
  'Sensors',
];

const kTestingSkills = [
  'pytest',
  'pytest-django',
  'unittest',
  'Robot Framework',
  'UIAutomator',
  'UIAutomator2',
  'JUnit',
  'kotlin.test',
  'kotlinx-coroutines-test',
  'Marathon',
  'Playwright',
  'Clippy',
  'rustfmt',
  'Ruff',
  'Black',
  'pre-commit',
];

const kDataSkills = [
  'Pandas',
  'NumPy',
  'OpenPyXL',
  'Beautiful Soup',
  'lxml',
  'Google GenAI',
  'Whisper.cpp',
  'FFmpeg',
  'OpenCV',
  'InsightFace',
  'ONNX Runtime',
  'ReportLab',
  'WeasyPrint',
  'python-docx',
];

const kToolSkills = [
  'Git',
  'GitHub',
  'GitLab',
  'GitHub Actions',
  'Jenkins CI/CD',
  'Jira',
  'Bitbucket',
  'Docker',
  'Docker Compose',
  'Cargo',
  'rustup',
  'Gradle',
  'Amper',
  'Android SDK',
  'ADB',
  'Fastboot',
  'Xcode',
  'Node.js',
  'npm',
  'uv',
];

// ── Bilingual content ─────────────────────────────────────────────────────────

const Map<String, PortfolioContent> kContent = {
  'en': PortfolioContent(
    title: 'Software Engineer · Android Developer · QA Automation',
    bio: 'Undergraduate Electrical Engineering student (10th period) with over '
        'three years of experience in Android development and testing. '
        'Specialist in test automation, firmware validation, and cross-platform '
        'development using Flutter, Python, and Kotlin.',
    skipToContent: 'Skip to main content',
    navAriaLabel: 'Main navigation',
    navMenuOpenLabel: 'Open navigation menu',
    navMenuCloseLabel: 'Close navigation menu',
    themeToLightLabel: 'Switch to light theme',
    themeToDarkLabel: 'Switch to dark theme',
    langSwitchLabel: 'Switch language to Portuguese',
    heroGreeting: '👋  Hello, World!',
    heroViewWork: 'View my work',
    heroPrimaryCta: 'Explore projects',
    heroPrintCv: 'Print / Save CV',
    heroHighlights: [
      HeroHighlight(value: '4+', label: 'Years in Android & QA'),
      HeroHighlight(value: '4', label: 'Open-source packages'),
      HeroHighlight(value: 'Fullstack', label: 'Mobile · Backend · NDK'),
    ],
    sectionExperience: 'Experience',
    sectionExperienceSubtitle: 'Professional history & achievements',
    expShowMore: 'Show more',
    expShowLess: 'Show less',
    sectionProjects: 'Projects',
    sectionProjectsSubtitle: 'Open-source work & personal builds',
    projectsFilterAll: 'All',
    projectsFeaturedBadge: 'Featured',
    projViewCaseStudy: 'Architecture',
    projOpenRepo: 'Repository',
    caseStudyRoleLabel: 'Role',
    caseStudyProblemLabel: 'Technical Challenge',
    caseStudyArchitectureLabel: 'Architecture & Solution',
    caseStudyHighlightsLabel: 'Key Engineering Decisions',
    caseStudyStackLabel: 'Tech Stack',
    caseStudyCloseLabel: 'Close project details',
    sectionPublishedApps: 'Apps & Software',
    sectionPublishedAppsSubtitle: 'Mobile applications, desktop software, and web projects',
    categoryMobile: 'Mobile Apps',
    categoryDesktop: 'Desktop Apps',
    categoryWeb: 'Web & Sites',
    appPrevLabel: 'Previous app',
    appNextLabel: 'Next app',
    appSlideDotPrefix: 'Show app',
    appScreenshotPrefix: 'Show screen',
    appZoomHint: 'Click to enlarge',
    appCloseLightbox: 'Close preview',
    sectionOpenSourceTitle: 'Devs4Devs',
    sectionOpenSourceSubtitle: 'Free & open-source packages created for developers',
    sectionSkills: 'Skills',
    sectionSkillsSubtitle: 'Technologies and tools I work with',
    skillsCoreTitle: 'Core Stack',
    skillsCoreSubtitle: 'Technologies I use daily in production',
    skillsFilterAll: 'All',
    skillsFilterMobile: 'Mobile & Native',
    skillsFilterBackend: 'Backend & Data',
    skillsFilterQuality: 'QA & DevOps',
    skillsFilterWeb: 'Web',
    sectionEducation: 'Education',
    sectionEducationSubtitle: 'Academic background & certifications',
    coursesHeading: 'Courses & Certifications',
    spokenLanguagesHeading: 'Languages',
    sectionContact: 'Contact',
    sectionContactSubtitle: "Let's talk",
    contactAvailableLabel: 'Open to opportunities',
    contactBuiltWith: 'built using Jaspr',
    contactCopyEmail: 'Copy email',
    contactCopied: 'Email copied!',
    contactSendEmail: 'Send email',
    sectionContributions: 'GitHub Activity',
    sectionContributionsSubtitle: 'Open source contributions',
    contributionsInLastYear: 'contributions in the last year',
    contributionsLess: 'Less',
    contributionsMore: 'More',
    contribRetryLabel: 'Try again',
    contribInspectHint: 'Hover or focus a day to inspect contributions',
    contribNoneOn: 'No contributions on',
    contribSingleOn: 'contribution on',
    contribPluralOn: 'contributions on',
    contribDayLabels: ['Mon', 'Wed', 'Fri'],
    contribMonthAbbrs: [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ],
    experiences: [
      ExperienceEntry(
        role: 'Fullstack Developer',
        company: 'Grupo Forte',
        period: 'Oct 2026 – Present',
        isCurrent: true,
        bullets: [
          'Android-focused mobile development with Kotlin Multiplatform and Compose Multiplatform for logistics, delivery tracking, fuel orders, fleet tracking, task management, and business indicators',
          'MVVM architecture and unidirectional data flow with ViewModels, Coroutines, StateFlow, and Koin',
          'API integration using Retrofit, OkHttp, and OpenAPI, with token-based authentication, session renewal, and secure storage through Android Keystore',
          'Native kitchen dashboard for Android tablets with WebSockets, automatic reconnection, fallback polling, preparation timers, sound and voice alerts, immersive mode, and an expanded order view',
          'Internal business system development with Python and Django: APIs, financial integrations, payment reconciliation, and process automation',
          'Data persistence and asynchronous processing with PostgreSQL, SQL Server, Celery, and RabbitMQ, with services running in Docker',
          'Unit testing, UI testing with UIAutomator, validation on physical devices, ADB debugging, and GitHub Actions pipelines for building and distributing signed APKs',
        ],
        techs: [
          'Kotlin Multiplatform',
          'Compose Multiplatform',
          'Coroutines',
          'Koin',
          'Retrofit',
          'WebSockets',
          'Python',
          'Django',
          'PostgreSQL',
          'SQL Server',
          'Celery',
          'RabbitMQ',
          'Docker',
          'UIAutomator',
          'GitHub Actions',
        ],
      ),
      ExperienceEntry(
        role: 'Kotlin Developer (Freelance)',
        company: 'Israeli Military Research Institute',
        period: 'Sep 2026 – Present',
        isCurrent: true,
        bullets: [
          'Research and development for Iron Dome, contributing to a high-efficiency emulator for missile attack simulations',
          'Frontend development with Kotlin Multiplatform and backend services with Ktor',
          'Emulation infrastructure using the Linux kernel and QEMU',
        ],
        techs: ['Kotlin Multiplatform', 'Ktor', 'Linux Kernel', 'QEMU'],
      ),
      ExperienceEntry(
        role: 'Android Developer',
        company: 'Eldorado',
        period: 'May 2024 – Aug 2026',
        bullets: [
          'Compliance testing for Android devices',
          'Test automation using Python, Flutter Tests, and Unittest',
          'Execution of CTS, GTS, and VTS test suites',
          'Cross-platform apps with Flutter and Kotlin Native',
          'Backend services with FastAPI',
        ],
        techs: ['Python', 'Flutter', 'Kotlin', 'FastAPI', 'CTS/GTS/VTS', 'Jetpack Compose'],
      ),
      ExperienceEntry(
        role: 'Software QA (Manual)',
        company: 'SIDIA',
        period: 'Jan 2023 – Feb 2024',
        bullets: [
          'Black-box, functional, and regression testing for Android',
          'LTE/GSM network testing using CMW500',
          'Task automation with Scrapy',
          'FastAPI backend development',
          'Android test automation with ADB, Fastboot, UIAutomator2',
        ],
        techs: ['Python', 'Scrapy', 'FastAPI', 'ADB', 'UIAutomator2', 'Network Testing' ],
      ),
      ExperienceEntry(
        role: 'Software Analyst (Kernel)',
        company: 'Voltz Institute',
        period: 'Aug 2022 – Nov 2022',
        bullets: [
          'Android Kernel development',
          'OTA build deployment for embedded devices',
          'Sensor debugging and firmware validation',
        ],
        techs: ['Android Kernel', 'OTA', 'Firmware'],
      ),
      ExperienceEntry(
        role: 'Android Developer intern',
        company: 'SEDUC',
        period: 'Oct 2021 – Aug 2022',
        bullets: [
          'Maintenance of native apps with Flutter and Kotlin',
          'Deploying updates to production',
        ],
        techs: ['Flutter', 'Kotlin', 'Android'],
      ),
    ],
    projects: [
      ProjectEntry(
        name: 'Nexus CTS',
        url: 'https://github.com/desodre/nexus_cts',
        description:
            'Portal aggregating Google Android test suites (CTS, GTS, VTS) for streamlined compliance management.',
        techs: ['Dart', 'Flutter'],
        icon: 'verified_user',
      ),
      ProjectEntry(
        name: 'Adb Utils',
        url: 'https://pub.dev/packages/adb_utils',
        description:
            'Open-source Dart library wrapping ADB commands for seamless Android device interaction from Dart code.',
        techs: ['Dart', 'ADB', 'Pub.dev'],
        icon: 'terminal',
      ),
      ProjectEntry(
        name: 'Fast Bridge',
        url: 'https://github.com/desodre/fast_bridge',
        description:
            'Cross-platform Android device debugger, ADB controls, and a FastAPI + UIAutomator2.',
        techs: ['Flutter', 'Android', 'Python', 'FastAPI', 'UIAutomator2'],
        icon: 'hub',
        isFeatured: true,
        caseStudy: ProjectCaseStudy(
          role: 'Author & Fullstack Developer',
          problem:
              'Debugging Android UI trees and running repetitive ADB/UIAutomator2 commands across multiple platforms typically relies on fragmented CLI scripts and manual device setup.',
          architecture:
              'Split client-server architecture: a cross-platform Flutter client communicates over REST with a Python FastAPI bridge server that translates actions into ADB and UIAutomator2 calls on connected devices.',
          highlights: [
            'Decoupled Flutter UI and FastAPI REST control plane for cross-platform debugging across desktop and mobile.',
            'Remote ADB and UIAutomator2 orchestration exposed through structured HTTP endpoints.',
            'Unified device-debugging workflow combining ADB controls with automated UI actions.',
          ],
        ),
      ),
      ProjectEntry(
        name: 'Meu Ar Manaus',
        url: 'https://github.com/desodre/Meu_Ar_Manaus',
        description:
            'Civic Flutter app providing real-time air quality data and alerts for residents of Manaus, AM.',
        techs: ['Flutter', 'Android'],
        icon: 'air',
      ),
      ProjectEntry(
        name: 'NFC-Tools',
        url: 'https://github.com/desodre/NFC-Tools',
        description:
            'Android application for reading, writing, and managing NFC tags with an intuitive Flutter UI.',
        techs: ['Flutter', 'Android', 'NFC'],
        icon: 'nfc',
      ),
      ProjectEntry(
        name: 'Geppetto',
        url: 'https://github.com/desodre/Geppetto',
        description:
            'Geppetto is an Android UI automation framework that orchestrates and executes your test suite with precision and care. It provides a high-level Python API for controlling Android devices via ADB, Fastboot, and UIAutomator2.',
        techs: ['Python', 'Android', 'UIAutomator2', 'ADB', 'Fastboot'],
        icon: 'smart_toy',
        isFeatured: true,
        caseStudy: ProjectCaseStudy(
          role: 'Creator & Maintainer (PyPI)',
          problem:
              'Android UI automation suites often suffer from verbose boilerplate and brittle timing when combining device provisioning, Fastboot/ADB control, and UI assertions.',
          architecture:
              'High-level Python automation framework (published on PyPI as geppetto-android) that unifies ADB, Fastboot, and UIAutomator2 behind a clean orchestration API for deterministic test execution.',
          highlights: [
            'Ergonomic Python orchestration API packaged and distributed on PyPI as geppetto-android.',
            'Unified device lifecycle across Fastboot provisioning, ADB transport, and UIAutomator2 actions.',
            'Modular architecture engineered to pair with native Rust instrumentation agents such as Carlo.',
          ],
        ),
      ),
      ProjectEntry(
        name: 'Carlo',
        url: 'https://github.com/desodre/Carlo-puppet-of-geppetto',
        description:
            'Native Android agent in Rust for Geppetto, launched via ADB and using Binder/NDK for accessibility sessions and UI node reading. Full hierarchy extraction and video streaming are under development.',
        techs: ['Rust', 'Android NDK', 'Binder', 'ADB', 'Serde', 'Python'],
        icon: 'memory',
        isFeatured: true,
        caseStudy: ProjectCaseStudy(
          role: 'Creator & Native Systems Engineer (Rust/NDK)',
          problem:
              'Standard JVM-based instrumentation layers introduce startup latency and runtime overhead when inspecting live Android accessibility nodes and UI hierarchies at low level.',
          architecture:
              'Native Android binary compiled in Rust via the Android NDK, deployed and launched over ADB, interacting directly through Binder for accessibility sessions and serializing UI node structures with Serde for Geppetto.',
          highlights: [
            'Native Rust and Android NDK agent binary with zero JVM runtime dependency on the target device.',
            'Direct Binder integration for establishing low-level accessibility sessions and reading UI nodes.',
            'Structured Serde payload protocol feeding Geppetto, with full hierarchy extraction and video streaming under development.',
          ],
        ),
      ),
    ],
    publishedApps: [
      // Mobile
      PublishedApp(
        name: 'Termofication',
        description:
            'A Wordle-inspired puzzle game where players guess words within limited attempts. Features real-time multiplayer, custom word lists, and smooth animations.',
        techStack: ['Flutter', 'Android', 'REST API', 'Real-time', 'Play Services'],
        screenshotAssets: ['images/apps/home_termo.png'],
        repoUrl: 'https://github.com/desodre/Termofication',
        category: AppCategory.mobile,
      ),
      PublishedApp(
        name: 'NFC Manager',
        description:
            'A modern Flutter application for reading, writing, and managing NFC tags on Android devices with custom payload templates.',
        techStack: ['Flutter', 'Android', 'NFC Core', 'Local Storage'],
        screenshotAssets: ['images/apps/nfc_manager_home.png'],
        repoUrl: 'https://github.com/desodre/NFC-Manager',
        category: AppCategory.mobile,
      ),
      // Desktop
      PublishedApp(
        name: 'Android Inspect',
        description:
            'Powerful desktop GUI application for inspecting Android UI hierarchies, real-time Logcat logging, system properties, and hardware specifications via ADB & UIAutomator2. Coming soon to Flathub.',
        techStack: ['Flutter Desktop', 'ADB', 'UIAutomator2', 'Linux', 'Flathub'],
        screenshotAssets: [
          'images/apps/Android_Inspecs_hierarquia.png',
          'images/apps/Android_Inspecs_logcat.png',
          'images/apps/Android_Inspecs_props.png',
          'images/apps/Android_Inspecs_specs.png',
        ],
        repoUrl: 'https://github.com/desodre/Android-Inspec',
        category: AppCategory.desktop,
        badgeNote: 'Coming soon to Flathub',
      ),
      // Web
      PublishedApp(
        name: 'BestGas',
        description:
            'Web application built with React, Vite, and React Leaflet, integrated with a Python API using FastAPI. Persistence with SQLite and SQLAlchemy, migrations with Alembic, and infrastructure with Docker, Caddy, and GitHub Actions.',
        techStack: [
          'React',
          'Vite',
          'Leaflet',
          'Python',
          'FastAPI',
          'SQLAlchemy',
          'SQLite',
          'Docker',
        ],
        screenshotAssets: ['images/apps/bestgas.webp'],
        storeUrl: 'https://bestgas.com.br/',
        repoUrl: null,
        category: AppCategory.web,
      ),
    ],
    openSourceLibraries: [
      OpenSourceLibrary(
        name: 'adb_utils',
        description:
            'Open-source Dart package wrapping Android Debug Bridge (ADB) commands for seamless device automation directly from Dart & Flutter code.',
        registry: 'pub.dev',
        url: 'https://pub.dev/packages/adb_utils',
        techStack: ['Dart', 'ADB', 'Pub.dev'],
        badgeText: 'pub.dev package',
      ),
      OpenSourceLibrary(
        name: 'geppetto-android',
        description:
            'Python UI automation framework for Android devices. Provides high-level Python APIs orchestrating ADB, Fastboot, and UIAutomator2.',
        registry: 'PyPI',
        url: 'https://pypi.org/project/geppetto-android/',
        techStack: ['Python', 'PyPI', 'UIAutomator2', 'ADB'],
        badgeText: 'PyPI package',
      ),
      OpenSourceLibrary(
        name: 'fast_bridge',
        description:
            'Cross-platform bridge server & client providing FastAPI REST endpoints to execute ADB & UIAutomator2 actions remotely.',
        registry: 'GitHub',
        url: 'https://github.com/desodre/fast_bridge',
        techStack: ['Python', 'FastAPI', 'Flutter', 'ADB'],
        badgeText: 'Open Source Repo',
      ),
      OpenSourceLibrary(
        name: 'adb-utils-gradle-package',
        description:
            'Open-source Kotlin library for Android Debug Bridge (ADB) automation, published on Maven Central for Java & Kotlin developers.',
        registry: 'Maven Central',
        url: 'https://github.com/desodre/adb-utils-gradle-package',
        techStack: ['Kotlin', 'Java', 'ADB', 'Maven Central'],
        badgeText: 'Maven Central',
      ),
    ],
    skills: [
      SkillCategory(
        label: 'Languages',
        domain: 'languages',
        skills: kLanguageSkills,
      ),
      SkillCategory(
        label: 'Mobile & Multiplatform',
        domain: 'mobile',
        skills: kMobileSkills,
      ),
      SkillCategory(
        label: 'Backend & Messaging',
        domain: 'backend',
        skills: kBackendSkills,
      ),
      SkillCategory(
        label: 'Web',
        domain: 'web',
        skills: kWebSkills,
      ),
      SkillCategory(
        label: 'Databases & Cache',
        domain: 'backend',
        skills: kDatabaseSkills,
      ),
      SkillCategory(
        label: 'APIs & Architecture',
        domain: 'backend',
        skills: kArchitectureSkills,
      ),
      SkillCategory(
        label: 'Android & Native',
        domain: 'mobile',
        skills: kNativeSkills,
      ),
      SkillCategory(
        label: 'Testing & Quality',
        domain: 'quality',
        skills: kTestingSkills,
      ),
      SkillCategory(
        label: 'Data, AI & Documents',
        domain: 'backend',
        skills: kDataSkills,
      ),
      SkillCategory(
        label: 'Tools & DevOps',
        domain: 'quality',
        skills: kToolSkills,
      ),
    ],
    education: [
      EducationEntry(
        degree: 'B.S. Electrical Engineering',
        institution: 'UFAM – Federal University of Amazonas',
        period: '2020 – Present',
        note: 'Currently in the 10th period',
      ),
      EducationEntry(
        degree: 'DevTitans – Advanced Android Development',
        institution: 'Motorola / UFAM',
        period: '2024 – 2025',
        note: 'Sponsored advanced Android development program',
      ),
    ],
    courses: [
      CourseEntry(
          title: 'Android Developer Tests', provider: 'Udemy', year: '2023'),
      CourseEntry(
          title: 'Backend Development',
          provider: 'Samsung Ocean',
          year: '2023'),
      CourseEntry(
        title: 'Android Development with Flutter',
        provider: 'Alura',
        year: '2024',
      ),
    ],
    languages: [
      {'name': 'Portuguese', 'level': 'Native'},
      {'name': 'English', 'level': 'Advanced'},
      {'name': 'Spanish', 'level': 'Advanced'},
      {'name': 'German', 'level': 'Basic'},
    ],
  ),
  'pt': PortfolioContent(
    title: 'Engenheiro de Software · Desenvolvedor Android · Automação QA',
    bio: 'Estudante de Engenharia Elétrica (10º período) com mais de três anos '
        'de experiência em desenvolvimento e testes Android. Especialista em '
        'automação de testes, validação de firmware e desenvolvimento '
        'multiplataforma com Flutter, Python e Kotlin.',
    skipToContent: 'Pular para o conteúdo principal',
    navAriaLabel: 'Navegação principal',
    navMenuOpenLabel: 'Abrir menu de navegação',
    navMenuCloseLabel: 'Fechar menu de navegação',
    themeToLightLabel: 'Alternar para tema claro',
    themeToDarkLabel: 'Alternar para tema escuro',
    langSwitchLabel: 'Alterar idioma para inglês',
    heroGreeting: '👋  Olá, Mundo!',
    heroViewWork: 'Ver meu trabalho',
    heroPrimaryCta: 'Explorar projetos',
    heroPrintCv: 'Imprimir / Salvar CV',
    heroHighlights: [
      HeroHighlight(value: '4+', label: 'Anos em Android & QA'),
      HeroHighlight(value: '4', label: 'Pacotes open-source'),
      HeroHighlight(value: 'Fullstack', label: 'Mobile · Backend · NDK'),
    ],
    sectionExperience: 'Experiência',
    sectionExperienceSubtitle: 'Histórico profissional e conquistas',
    expShowMore: 'Ver mais',
    expShowLess: 'Ver menos',
    sectionProjects: 'Projetos',
    sectionProjectsSubtitle: 'Trabalho open-source e criações pessoais',
    projectsFilterAll: 'Todos',
    projectsFeaturedBadge: 'Destaque',
    projViewCaseStudy: 'Ver arquitetura',
    projOpenRepo: 'Repositório',
    caseStudyRoleLabel: 'Atuação',
    caseStudyProblemLabel: 'Desafio Técnico',
    caseStudyArchitectureLabel: 'Arquitetura & Solução',
    caseStudyHighlightsLabel: 'Decisões de Engenharia',
    caseStudyStackLabel: 'Stack Tecnológica',
    caseStudyCloseLabel: 'Fechar detalhes do projeto',
    sectionPublishedApps: 'Apps & Softwares',
    sectionPublishedAppsSubtitle: 'Aplicativos móveis, programas desktop e projetos web',
    categoryMobile: 'Apps Mobile',
    categoryDesktop: 'Softwares Desktop',
    categoryWeb: 'Sites & Web',
    appPrevLabel: 'Aplicativo anterior',
    appNextLabel: 'Próximo aplicativo',
    appSlideDotPrefix: 'Mostrar aplicativo',
    appScreenshotPrefix: 'Mostrar tela',
    appZoomHint: 'Clique para ampliar',
    appCloseLightbox: 'Fechar visualização',
    sectionOpenSourceTitle: 'Devs4Devs',
    sectionOpenSourceSubtitle: 'Bibliotecas e pacotes gratuitos desenvolvidos para a comunidade',
    sectionSkills: 'Habilidades',
    sectionSkillsSubtitle: 'Tecnologias e ferramentas com que trabalho',
    skillsCoreTitle: 'Stack Principal',
    skillsCoreSubtitle: 'Tecnologias que utilizo diariamente em produção',
    skillsFilterAll: 'Todas',
    skillsFilterMobile: 'Mobile & Nativo',
    skillsFilterBackend: 'Backend & Dados',
    skillsFilterQuality: 'QA & DevOps',
    skillsFilterWeb: 'Web',
    sectionEducation: 'Formação',
    sectionEducationSubtitle: 'Formação acadêmica e certificações',
    coursesHeading: 'Cursos e Certificações',
    spokenLanguagesHeading: 'Idiomas',
    sectionContact: 'Contato',
    sectionContactSubtitle: 'Vamos conversar',
    contactAvailableLabel: 'Aberto a oportunidades',
    contactBuiltWith: 'feito com Jaspr',
    contactCopyEmail: 'Copiar e-mail',
    contactCopied: 'E-mail copiado!',
    contactSendEmail: 'Enviar e-mail',
    sectionContributions: 'Atividade no GitHub',
    sectionContributionsSubtitle: 'Contribuições open source',
    contributionsInLastYear: 'contribuições no último ano',
    contributionsLess: 'Menos',
    contributionsMore: 'Mais',
    contribRetryLabel: 'Tentar novamente',
    contribInspectHint: 'Passe o mouse ou foque em um dia para ver detalhes',
    contribNoneOn: 'Nenhuma contribuição em',
    contribSingleOn: 'contribuição em',
    contribPluralOn: 'contribuições em',
    contribDayLabels: ['Seg', 'Qua', 'Sex'],
    contribMonthAbbrs: [
      'Jan',
      'Fev',
      'Mar',
      'Abr',
      'Mai',
      'Jun',
      'Jul',
      'Ago',
      'Set',
      'Out',
      'Nov',
      'Dez',
    ],
    experiences: [
      ExperienceEntry(
        role: 'Desenvolvedor Fullstack',
        company: 'Grupo Forte',
        period: 'Out 2026 – Atual',
        isCurrent: true,
        bullets: [
          'Desenvolvimento mobile com Kotlin Multiplatform e Compose Multiplatform, com foco em Android, para logística, acompanhamento de entregas, pedidos de combustível, rastreamento de frota, gestão de tarefas e indicadores de negócio',
          'Arquitetura MVVM e fluxo unidirecional de dados com ViewModels, Coroutines, StateFlow e Koin',
          'Integração de APIs com Retrofit, OkHttp e OpenAPI, com autenticação por tokens, renovação de sessão e armazenamento seguro via Android Keystore',
          'Painel de cozinha nativo para tablets Android com WebSockets, reconexão automática, polling de contingência, temporizadores de preparo, alertas sonoros e por voz, modo imersivo e visualização ampliada dos pedidos',
          'Evolução do sistema interno com Python e Django: APIs, integrações financeiras, conciliação de pagamentos e automação de processos',
          'Persistência de dados e processamento assíncrono com PostgreSQL, SQL Server, Celery e RabbitMQ, com serviços executados em Docker',
          'Testes unitários, testes de interface com UIAutomator, validação em dispositivos físicos, depuração com ADB e pipelines no GitHub Actions para gerar e distribuir APKs assinados',
        ],
        techs: [
          'Kotlin Multiplatform',
          'Compose Multiplatform',
          'Coroutines',
          'Koin',
          'Retrofit',
          'WebSockets',
          'Python',
          'Django',
          'PostgreSQL',
          'SQL Server',
          'Celery',
          'RabbitMQ',
          'Docker',
          'UIAutomator',
          'GitHub Actions',
        ],
      ),
      ExperienceEntry(
        role: 'Desenvolvedor Kotlin (Freelancer)',
        company: 'Instituto de Pesquisa Militar Israelita',
        period: 'Set 2026 – Atual',
        isCurrent: true,
        bullets: [
          'Pesquisa e desenvolvimento do Domo de Ferro, contribuindo para um emulador de alta eficiência para simulações de ataques de mísseis',
          'Desenvolvimento de frontend com Kotlin Multiplatform e serviços de backend com Ktor',
          'Infraestrutura de emulação com kernel Linux e QEMU',
        ],
        techs: ['Kotlin Multiplatform', 'Ktor', 'Linux Kernel', 'QEMU'],
      ),
      ExperienceEntry(
        role: 'Android Developer',
        company: 'Eldorado',
        period: 'Mai 2024 – Ago 2026',
        bullets: [
          'Testes de conformidade para dispositivos Android',
          'Automação de testes com Python, Flutter Tests e Unittest',
          'Execução das suítes CTS, GTS e VTS',
          'Apps multiplataforma com Flutter e Kotlin Native',
          'Serviços de backend com FastAPI',
        ],
        techs: ['Python', 'Flutter', 'Kotlin', 'FastAPI', 'CTS/GTS/VTS', 'Jetpack Compose'],
      ),
      ExperienceEntry(
        role: 'Software QA (Manual)',
        company: 'SIDIA',
        period: 'Jan 2023 – Fev 2024',
        bullets: [
          'Testes black-box, funcional e de regressão para Android',
          'Testes de rede LTE/GSM com CMW500',
          'Automação de tarefas com Scrapy',
          'Desenvolvimento de backend com FastAPI',
          'Automação de testes Android com ADB, Fastboot, UIAutomator2',
        ],
        techs: ['Python', 'Scrapy', 'FastAPI', 'ADB', 'UIAutomator2', 'Network Testing'],
      ),
      ExperienceEntry(
        role: 'Analista de Software Embarcado (Kernel)',
        company: 'Voltz Institute',
        period: 'Ago 2022 – Nov 2022',
        bullets: [
          'Desenvolvimento do Kernel Android',
          'Deploy de builds OTA em dispositivos embarcados',
          'Debug de sensores e validação de firmware',
        ],
        techs: ['Android Kernel', 'OTA', 'Firmware'],
      ),
      ExperienceEntry(
        role: 'Estagiário de Desenvolvimento Android',
        company: 'SEDUC',
        period: 'Out 2021 – Ago 2022',
        bullets: [
          'Manutenção de apps nativa com Flutter e Kotlin',
          'Deploy de atualizações em produção',
        ],
        techs: ['Flutter', 'Kotlin', 'Android'],
      ),
    ],
    projects: [
      ProjectEntry(
        name: 'Nexus CTS',
        url: 'https://github.com/desodre/nexus_cts',
        description:
            'Portal que agrega as suítes de testes Android do Google (CTS, GTS, VTS) para gerenciamento de conformidade simplificado.',
        techs: ['Dart', 'Flutter'],
        icon: 'verified_user',
      ),
      ProjectEntry(
        name: 'Adb Utils',
        url: 'https://pub.dev/packages/adb_utils',
        description:
            'Biblioteca Dart open-source que encapsula comandos ADB para interação com dispositivos Android a partir do Dart.',
        techs: ['Dart', 'ADB', 'Pub.dev'],
        icon: 'terminal',
      ),
      ProjectEntry(
        name: 'Fast Bridge',
        url: 'https://github.com/desodre/fast_bridge',
        description:
            'Debugger multiplataforma para Android com controles ADB e integração FastAPI + UIAutomator2.',
        techs: ['Flutter', 'Android', 'Python', 'FastAPI', 'UIAutomator2'],
        icon: 'hub',
        isFeatured: true,
        caseStudy: ProjectCaseStudy(
          role: 'Autor & Desenvolvedor Fullstack',
          problem:
              'Depurar árvores de interface Android e executar comandos repetitivos de ADB/UIAutomator2 em múltiplas plataformas geralmente depende de scripts CLI fragmentados e setup manual.',
          architecture:
              'Arquitetura cliente-servidor desacoplada: um cliente Flutter multiplataforma comunica via REST com um servidor FastAPI em Python que traduz ações em comandos ADB e chamadas UIAutomator2 para dispositivos conectados.',
          highlights: [
            'Plano de controle desacoplado entre interface Flutter e API REST FastAPI para depuração multiplataforma em desktop e mobile.',
            'Orquestração remota de ADB e UIAutomator2 exposta por meio de endpoints HTTP estruturados.',
            'Fluxo unificado de depuração combinando controles ADB com ações automatizadas de interface.',
          ],
        ),
      ),
      ProjectEntry(
        name: 'Meu Ar Manaus',
        url: 'https://github.com/desodre/Meu_Ar_Manaus',
        description:
            'App cívico em Flutter com dados de qualidade do ar em tempo real e alertas para moradores de Manaus, AM.',
        techs: ['Flutter', 'Android'],
        icon: 'air',
      ),
      ProjectEntry(
        name: 'NFC-Tools',
        url: 'https://github.com/desodre/NFC-Tools',
        description:
            'Aplicativo Android para leitura, escrita e gerenciamento de tags NFC com interface intuitiva em Flutter.',
        techs: ['Flutter', 'Android', 'NFC'],
        icon: 'nfc',
      ),
      ProjectEntry(
        name: 'Geppetto',
        url: 'https://github.com/desodre/Geppetto',
        description:
            'Framework de automação de UI para Android que orquestra e executa sua suíte de testes com precisão. Fornece uma API Python de alto nível para controlar dispositivos Android via ADB, Fastboot e UIAutomator2.',
        techs: ['Python', 'Android', 'UIAutomator2', 'ADB', 'Fastboot'],
        icon: 'smart_toy',
        isFeatured: true,
        caseStudy: ProjectCaseStudy(
          role: 'Criador & Maintainer (PyPI)',
          problem:
              'Suítes de automação de UI Android costumam acumular boilerplate verboso e fragilidade de sincronização ao combinar controle via ADB/Fastboot com asserções de interface.',
          architecture:
              'Framework Python de alto nível (publicado no PyPI como geppetto-android) que unifica ADB, Fastboot e UIAutomator2 sob uma API coesa de orquestração e execução de testes.',
          highlights: [
            'API Python ergonômica empacotada e distribuída no PyPI como geppetto-android.',
            'Orquestração unificada cobrindo provisionamento Fastboot, transporte ADB e ações UIAutomator2.',
            'Arquitetura modular projetada para atuar em conjunto com agentes nativos em Rust como o Carlo.',
          ],
        ),
      ),
      ProjectEntry(
        name: 'Carlo',
        url: 'https://github.com/desodre/Carlo-puppet-of-geppetto',
        description:
            'Agente Android nativo em Rust para o Geppetto, iniciado via ADB e usando Binder/NDK para sessões de acessibilidade e leitura de nós da interface. Hierarquia completa e streaming de vídeo em desenvolvimento.',
        techs: ['Rust', 'Android NDK', 'Binder', 'ADB', 'Serde', 'Python'],
        icon: 'memory',
        isFeatured: true,
        caseStudy: ProjectCaseStudy(
          role: 'Criador & Engenheiro Nativo (Rust/NDK)',
          problem:
              'Camadas de instrumentação baseadas em JVM introduzem latência de inicialização e overhead de runtime ao inspecionar nós de acessibilidade e hierarquias de UI Android em baixo nível.',
          architecture:
              'Binário Android nativo compilado em Rust com Android NDK, implantado e iniciado via ADB, interagindo diretamente via Binder para sessões de acessibilidade e serializando estruturas com Serde para consumo pelo Geppetto.',
          highlights: [
            'Agente nativo em Rust e Android NDK sem dependência de runtime JVM no dispositivo alvo.',
            'Integração direta via Binder para sessões de acessibilidade em baixo nível e leitura de nós de UI.',
            'Protocolo estruturado com Serde alimentando o Geppetto, com extração completa de hierarquia e streaming de vídeo em desenvolvimento.',
          ],
        ),
      ),
    ],
    publishedApps: [
      // Mobile
      PublishedApp(
        name: 'Termofication',
        description:
            'Um jogo de adivinhação de palavras estilo Wordle. Conta com modo multijogador em tempo real, lista de palavras personalizadas e animações fluidas.',
        techStack: ['Flutter', 'Android', 'REST API', 'Real-time', 'Play Services'],
        screenshotAssets: ['images/apps/home_termo.png'],
        repoUrl: 'https://github.com/desodre/Termofication',
        category: AppCategory.mobile,
      ),
      PublishedApp(
        name: 'NFC Manager',
        description:
            'Um aplicativo Android moderno em Flutter para leitura, escrita e gerenciamento de tags NFC com modelos de dados customizados.',
        techStack: ['Flutter', 'Android', 'NFC Core', 'Local Storage'],
        screenshotAssets: ['images/apps/nfc_manager_home.png'],
        repoUrl: 'https://github.com/desodre/NFC-Manager',
        category: AppCategory.mobile,
      ),
      // Desktop
      PublishedApp(
        name: 'Android Inspect',
        description:
            'Ferramenta desktop para inspeção da hierarquia de UI do Android, visualização de Logcat em tempo real, propriedades do sistema e especificações de hardware via ADB e UIAutomator2. Em breve no Flathub.',
        techStack: ['Flutter Desktop', 'ADB', 'UIAutomator2', 'Linux', 'Flathub'],
        screenshotAssets: [
          'images/apps/Android_Inspecs_hierarquia.png',
          'images/apps/Android_Inspecs_logcat.png',
          'images/apps/Android_Inspecs_props.png',
          'images/apps/Android_Inspecs_specs.png',
        ],
        repoUrl: 'https://github.com/desodre/Android-Inspec',
        category: AppCategory.desktop,
        badgeNote: 'Em breve no Flathub',
      ),
      // Web
      PublishedApp(
        name: 'BestGas',
        description:
            'Aplicação web desenvolvida com React, Vite e React Leaflet, integrada a uma API Python com FastAPI. Persistência com SQLite e SQLAlchemy, migrações com Alembic e infraestrutura com Docker, Caddy e GitHub Actions.',
        techStack: [
          'React',
          'Vite',
          'Leaflet',
          'Python',
          'FastAPI',
          'SQLAlchemy',
          'SQLite',
          'Docker',
        ],
        screenshotAssets: ['images/apps/bestgas.webp'],
        storeUrl: 'https://bestgas.com.br/',
        repoUrl: null,
        category: AppCategory.web,
      ),
    ],
    openSourceLibraries: [
      OpenSourceLibrary(
        name: 'adb_utils',
        description:
            'Pacote Dart open-source que encapsula comandos do Android Debug Bridge (ADB) para automação de dispositivos diretamente a partir de código Dart/Flutter.',
        registry: 'pub.dev',
        url: 'https://pub.dev/packages/adb_utils',
        techStack: ['Dart', 'ADB', 'Pub.dev'],
        badgeText: 'Pacote pub.dev',
      ),
      OpenSourceLibrary(
        name: 'geppetto-android',
        description:
            'Framework Python de automação de UI para dispositivos Android. Fornece APIs de alto nível orquestrando ADB, Fastboot e UIAutomator2.',
        registry: 'PyPI',
        url: 'https://pypi.org/project/geppetto-android/',
        techStack: ['Python', 'PyPI', 'UIAutomator2', 'ADB'],
        badgeText: 'Pacote PyPI',
      ),
      OpenSourceLibrary(
        name: 'fast_bridge',
        description:
            'Servidor e cliente de ponte multiplataforma fornecendo endpoints REST FastAPI para executar ações ADB e UIAutomator2 remotamente.',
        registry: 'GitHub',
        url: 'https://github.com/desodre/fast_bridge',
        techStack: ['Python', 'FastAPI', 'Flutter', 'ADB'],
        badgeText: 'Repositório Open Source',
      ),
      OpenSourceLibrary(
        name: 'adb-utils-gradle-package',
        description:
            'Biblioteca Kotlin open-source para automação do Android Debug Bridge (ADB), disponibilizada no Maven Central para Java e Kotlin.',
        registry: 'Maven Central',
        url: 'https://github.com/desodre/adb-utils-gradle-package',
        techStack: ['Kotlin', 'Java', 'ADB', 'Maven Central'],
        badgeText: 'Maven Central',
      ),
    ],
    skills: [
      SkillCategory(
        label: 'Linguagens',
        domain: 'languages',
        skills: kLanguageSkills,
      ),
      SkillCategory(
        label: 'Mobile & Multiplataforma',
        domain: 'mobile',
        skills: kMobileSkills,
      ),
      SkillCategory(
        label: 'Backend & Mensageria',
        domain: 'backend',
        skills: kBackendSkills,
      ),
      SkillCategory(
        label: 'Web',
        domain: 'web',
        skills: kWebSkills,
      ),
      SkillCategory(
        label: 'Bancos de Dados & Cache',
        domain: 'backend',
        skills: kDatabaseSkills,
      ),
      SkillCategory(
        label: 'APIs & Arquitetura',
        domain: 'backend',
        skills: kArchitectureSkills,
      ),
      SkillCategory(
        label: 'Android & Nativo',
        domain: 'mobile',
        skills: kNativeSkills,
      ),
      SkillCategory(
        label: 'Testes & Qualidade',
        domain: 'quality',
        skills: kTestingSkills,
      ),
      SkillCategory(
        label: 'Dados, IA & Documentos',
        domain: 'backend',
        skills: kDataSkills,
      ),
      SkillCategory(
        label: 'Ferramentas & DevOps',
        domain: 'quality',
        skills: kToolSkills,
      ),
    ],
    education: [
      EducationEntry(
        degree: 'B.S. Engenharia Elétrica',
        institution: 'UFAM – Universidade Federal do Amazonas',
        period: '2020 – Atual',
        note: 'Cursando o 10º período',
      ),
      EducationEntry(
        degree: 'DevTitans – Desenvolvimento Android Avançado',
        institution: 'Motorola / UFAM',
        period: '2024 – 2025',
        note: 'Programa avançado de desenvolvimento Android patrocinado',
      ),
    ],
    courses: [
      CourseEntry(
        title: 'Testes para Desenvolvedores Android',
        provider: 'Udemy',
        year: '2023',
      ),
      CourseEntry(
        title: 'Desenvolvimento Backend',
        provider: 'Samsung Ocean',
        year: '2023',
      ),
      CourseEntry(
        title: 'Desenvolvimento Android com Flutter',
        provider: 'Alura',
        year: '2024',
      ),
    ],
    languages: [
      {'name': 'Português', 'level': 'Nativo'},
      {'name': 'Inglês', 'level': 'Avançado'},
      {'name': 'Espanhol', 'level': 'Avançado'},
      {'name': 'Alemão', 'level': 'Básico'},
    ],
  ),
};

class AllContributions {
  final Map<String, int> total;
  final List<Contribution> contributions;

  AllContributions({required this.total, required this.contributions});

  factory AllContributions.fromJson(Map<String, dynamic> json) {
    return AllContributions(
      total: Map<String, int>.from(json['total'] as Map),
      contributions: (json['contributions'] as List)
          .map((c) => Contribution.fromJson(c as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Contribution {
  final String date;
  final int count;
  final int level;

  Contribution({required this.date, required this.count, required this.level});

  factory Contribution.fromJson(Map<String, dynamic> json) {
    return Contribution(
      date: json['date'] as String,
      count: json['count'] as int,
      level: json['level'] as int,
    );
  }
}
