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

class ProjectEntry {
  final String name;
  final String url;
  final String description;
  final List<String> techs;

  const ProjectEntry({
    required this.name,
    required this.url,
    required this.description,
    required this.techs,
  });
}

class PublishedApp {
  final String name;
  final String description;
  final List<String> techStack;
  final String screenshotAsset;
  final String storeUrl;
  final String? repoUrl;

  const PublishedApp({
    required this.name,
    required this.description,
    required this.techStack,
    required this.screenshotAsset,
    required this.storeUrl,
    this.repoUrl,
  });
}

class SkillCategory {
  final String label;
  final List<String> skills;

  const SkillCategory({required this.label, required this.skills});
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
  final List<SkillCategory> skills;
  final List<EducationEntry> education;
  final List<CourseEntry> courses;
  final List<Map<String, String>> languages;
  // UI strings
  final String heroGreeting;
  final String heroViewWork;
  final String sectionExperience;
  final String sectionExperienceSubtitle;
  final String sectionProjects;
  final String sectionProjectsSubtitle;
  final String sectionPublishedApps;
  final String sectionPublishedAppsSubtitle;
  final String sectionSkills;
  final String sectionSkillsSubtitle;
  final String sectionEducation;
  final String sectionEducationSubtitle;
  final String coursesHeading;
  final String spokenLanguagesHeading;
  final String sectionContact;
  final String sectionContactSubtitle;
  final String contactAvailableLabel;
  final String contactBuiltWith;
  final String sectionContributions;
  final String sectionContributionsSubtitle;
  final String contributionsInLastYear;
  final String contributionsLess;
  final String contributionsMore;

  const PortfolioContent({
    required this.title,
    required this.bio,
    required this.experiences,
    required this.projects,
    required this.publishedApps,
    required this.skills,
    required this.education,
    required this.courses,
    required this.languages,
    required this.heroGreeting,
    required this.heroViewWork,
    required this.sectionExperience,
    required this.sectionExperienceSubtitle,
    required this.sectionProjects,
    required this.sectionProjectsSubtitle,
    required this.sectionPublishedApps,
    required this.sectionPublishedAppsSubtitle,
    required this.sectionSkills,
    required this.sectionSkillsSubtitle,
    required this.sectionEducation,
    required this.sectionEducationSubtitle,
    required this.coursesHeading,
    required this.spokenLanguagesHeading,
    required this.sectionContact,
    required this.sectionContactSubtitle,
    required this.contactAvailableLabel,
    required this.contactBuiltWith,
    required this.sectionContributions,
    required this.sectionContributionsSubtitle,
    required this.contributionsInLastYear,
    required this.contributionsLess,
    required this.contributionsMore,
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
// ── Bilingual content ─────────────────────────────────────────────────────────

const Map<String, PortfolioContent> kContent = {
  'en': PortfolioContent(
    title: 'Software Engineer · Android Developer · QA Automation',
    bio: 'Undergraduate Electrical Engineering student (10th period) with over '
        'three years of experience in Android development and testing. '
        'Specialist in test automation, firmware validation, and cross-platform '
        'development using Flutter, Python, and Kotlin.',
    heroGreeting: '👋  Hello, World!',
    heroViewWork: 'View my work',
    sectionExperience: 'Experience',
    sectionExperienceSubtitle: 'Professional history & achievements',
    sectionProjects: 'Projects',
    sectionProjectsSubtitle: 'Open-source work & personal builds',
    sectionPublishedApps: 'Published Apps',
    sectionPublishedAppsSubtitle: 'Mobile applications available on app stores or as public builds',
    sectionSkills: 'Skills',
    sectionSkillsSubtitle: 'Technologies and tools I work with',
    sectionEducation: 'Education',
    sectionEducationSubtitle: 'Academic background & certifications',
    coursesHeading: 'Courses & Certifications',
    spokenLanguagesHeading: 'Languages',
    sectionContact: 'Contact',
    sectionContactSubtitle: "Let's talk",
    contactAvailableLabel: 'Open to opportunities',
    contactBuiltWith: 'built using Jaspr',
    sectionContributions: 'GitHub Activity',
    sectionContributionsSubtitle: 'Open source contributions',
    contributionsInLastYear: 'contributions in the last year',
    contributionsLess: 'Less',
    contributionsMore: 'More',
    experiences: [
      ExperienceEntry(
        role: 'Android Developer',
        company: 'Eldorado',
        period: 'May 2024 – Present',
        isCurrent: true,
        bullets: [
          'Compliance testing for Android devices',
          'Test automation using Python, Flutter Tests, and Unittest',
          'Execution of CTS, GTS, and VTS test suites',
          'Cross-platform apps with Flutter and Kotlin Native',
          'Backend services with FastAPI',
        ],
        techs: ['Python', 'Flutter', 'Kotlin', 'FastAPI', 'CTS/GTS/VTS', 'Kotlin', 'Jetpack Compose'],
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
      ),
      ProjectEntry(
        name: 'Adb Utils',
        url: 'https://pub.dev/packages/adb_utils',
        description:
            'Open-source Dart library wrapping ADB commands for seamless Android device interaction from Dart code.',
        techs: ['Dart', 'ADB', 'Pub.dev'],
      ),
      ProjectEntry(
        name: 'Fast Bridge',
        url: 'https://github.com/desodre/fast_bridge',
        description:
            'Cross-platform Android device debugger, ADB controls, and a FastAPI + UIAutomator2.',
        techs: ['Flutter', 'Android', 'Python', 'FastAPI', 'UIAutomator2'],
      ),
      ProjectEntry(
        name: 'Meu Ar Manaus',
        url: 'https://github.com/desodre/Meu_Ar_Manaus',
        description:
            'Civic Flutter app providing real-time air quality data and alerts for residents of Manaus, AM.',
        techs: ['Flutter', 'Android'],
      ),
      ProjectEntry(
        name: 'NFC-Tools',
        url: 'https://github.com/desodre/NFC-Tools',
        description:
            'Android application for reading, writing, and managing NFC tags with an intuitive Flutter UI.',
        techs: ['Flutter', 'Android', 'NFC'],
      ),
      ProjectEntry(
        name: 'Geppetto',
        url: 'https://github.com/desodre/Geppetto',
        description:
            'Geppetto is an Android UI automation framework that orchestrates and executes your test suite with precision and care. It provides a high-level Python API for controlling Android devices via ADB, Fastboot, and UIAutomator2.',
        techs: ['Python', 'Android', 'UIAutomator2', 'ADB', 'Fastboot'],
      ),
    ],
    publishedApps: [
      PublishedApp(
        name: 'Termofication',
        description:
            'A wordle-like puzzle game where players guess the correct word within a limited number of attempts. Multiplayer mode with real-time updates and a custom word list.',
        techStack: ['Flutter', 'Android', 'REST API', 'Data Parsing', 'Real-time Updates', 'Google play services'],
        screenshotAsset: 'images/apps/home_termo.png',
        storeUrl: 'https://github.com/desodre/Termofication',
        repoUrl: 'https://github.com/desodre/Termofication',
      ),
    ],
    skills: [
      SkillCategory(
        label: 'Languages',
        skills: ['Python', 'Dart', 'Kotlin', 'Java', 'SQL', 'R'],
      ),
      SkillCategory(
        label: 'Frameworks',
        skills: [
          'Flutter',
          'FastAPI',
          'Robot Framework',
          'Pytests',
          'Unittest',
          'Scrapy',
          'Jetpack Compose'
        ],
      ),
      SkillCategory(
        label: 'Tools',
        skills: [
          'Git',
          'GitHub',
          'GitLab',
          'GitHub Actions',
          'Jenkins CI/CD',
          'Jira',
          'ADB',
          'Fastboot',
          'Bitbucket',
        ],
      ),
      SkillCategory(
        label: 'Databases',
        skills: ['PostgreSQL', 'MySQL', 'SQLite', 'MongoDB', 'Redis'],
      ),
      SkillCategory(
        label: 'Android',
        skills: [
          'CTS/GTS/VTS',
          'Kernel',
          'Firmware',
          'UIAutomator2',
          'Sensors',
          'Flutter',
          'Jetpack Compose'
        ],
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
    heroGreeting: '👋  Olá, Mundo!',
    heroViewWork: 'Ver meu trabalho',
    sectionExperience: 'Experiência',
    sectionExperienceSubtitle: 'Histórico profissional e conquistas',
    sectionProjects: 'Projetos',
    sectionProjectsSubtitle: 'Trabalho open-source e criações pessoais',
    sectionPublishedApps: 'Apps Publicados',
    sectionPublishedAppsSubtitle: 'Aplicativos móveis disponíveis em lojas ou como builds públicas',
    sectionSkills: 'Habilidades',
    sectionSkillsSubtitle: 'Tecnologias e ferramentas com que trabalho',
    sectionEducation: 'Formação',
    sectionEducationSubtitle: 'Formação acadêmica e certificações',
    coursesHeading: 'Cursos e Certificações',
    spokenLanguagesHeading: 'Idiomas',
    sectionContact: 'Contato',
    sectionContactSubtitle: 'Vamos conversar',
    contactAvailableLabel: 'Aberto a oportunidades',
    contactBuiltWith: 'feito com Jaspr',
    sectionContributions: 'Atividade no GitHub',
    sectionContributionsSubtitle: 'Contribuições open source',
    contributionsInLastYear: 'contribuições no último ano',
    contributionsLess: 'Menos',
    contributionsMore: 'Mais',
    experiences: [
      ExperienceEntry(
        role: 'Android Developer',
        company: 'Eldorado',
        period: 'May 2024 – Present',
        isCurrent: true,
        bullets: [
          'Testes de conformidade para dispositivos Android',
          'Automação de testes com Python, Flutter Tests e Unittest',
          'Execução das suítes CTS, GTS e VTS',
          'Apps multiplataforma com Flutter e Kotlin Native',
          'Serviços de backend com FastAPI',
        ],
        techs: ['Python', 'Flutter', 'Kotlin', 'FastAPI', 'CTS/GTS/VTS', 'Kotlin', 'Jetpack Compose'],
      ),
      ExperienceEntry(
        role: 'Software QA (Manual)',
        company: 'SIDIA',
        period: 'Jan 2023 – Feb 2024',
        bullets: [
          'Testes black-box, funcional e de regressão para Android',
          'Testes de rede LTE/GSM com CMW500',
          'Automação de tarefas com Scrapy',
          'Desenvolvimento de backend com FastAPI',
          'Automação de testes Android com ADB, Fastboot, UIAutomator2',
        ],
        techs: ['Python', 'Scrapy', 'FastAPI', 'ADB', 'UIAutomator2'],
      ),
      ExperienceEntry(
        role: 'Analista de Software Embarcado (Kernel)',
        company: 'Voltz Institute',
        period: 'Aug 2022 – Nov 2022',
        bullets: [
          'Desenvolvimento do Kernel Android',
          'Deploy de builds OTA em dispositivos embarcados',
          'Debug de sensores e validação de firmware',
        ],
        techs: ['Android Kernel', 'OTA', 'Firmware'],
      ),
      ExperienceEntry(
        role: 'Android Developer intern',
        company: 'SEDUC',
        period: 'Oct 2021 – Aug 2022',
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
      ),
      ProjectEntry(
        name: 'Adb Utils',
        url: 'https://pub.dev/packages/adb_utils',
        description:
            'Biblioteca Dart open-source que encapsula comandos ADB para interação com dispositivos Android a partir do Dart.',
        techs: ['Dart', 'ADB', 'Pub.dev'],
      ),
      ProjectEntry(
        name: 'Fast Bridge',
        url: 'https://github.com/desodre/fast_bridge',
        description:
            'Debugger multiplataforma para Android com controles ADB e integração FastAPI + UIAutomator2.',
        techs: ['Flutter', 'Android', 'Python', 'FastAPI', 'UIAutomator2'],
      ),
      ProjectEntry(
        name: 'Meu Ar Manaus',
        url: 'https://github.com/desodre/Meu_Ar_Manaus',
        description:
            'App cívico em Flutter com dados de qualidade do ar em tempo real e alertas para moradores de Manaus, AM.',
        techs: ['Flutter', 'Android'],
      ),
      ProjectEntry(
        name: 'NFC-Tools',
        url: 'https://github.com/desodre/NFC-Tools',
        description:
            'Aplicativo Android para leitura, escrita e gerenciamento de tags NFC com interface intuitiva em Flutter.',
        techs: ['Flutter', 'Android', 'NFC'],
      ),
      ProjectEntry(
        name: 'Geppetto',
        url: 'https://pypi.org/project/geppetto-android/',
        description:
            'Framework de automação de UI para Android que orquestra e executa sua suíte de testes com precisão. Fornece uma API Python de alto nível para controlar dispositivos Android via ADB, Fastboot e UIAutomator2.',
        techs: ['Python', 'Android', 'UIAutomator2', 'ADB', 'Fastboot'],
      ),
    ],
    publishedApps: [
      PublishedApp(
        name: 'Termofication',
        description:
            'Um jogo de palavras estilo Wordle onde os jogadores tentam adivinhar a palavra correta em um número limitado de tentativas. Modo multiplayer com atualizações em tempo real e lista de palavras personalizada.',
        techStack: ['Flutter', 'Android', 'REST API', 'Data Parsing', 'Real-time Updates', 'Google Play Services'],
        screenshotAsset: 'images/apps/home_termo.png',
        storeUrl: 'https://github.com/desodre/Termofication',
        repoUrl: 'https://github.com/desodre/Termofication',
      ),
      
    ],
    skills: [
      SkillCategory(
        label: 'Linguagens',
        skills: ['Python', 'Dart', 'Kotlin', 'Java', 'SQL', 'R'],
      ),
      SkillCategory(
        label: 'Frameworks',
        skills: [
          'Flutter',
          'FastAPI',
          'Robot Framework',
          'Pytests',
          'Unittest',
          'Scrapy',
          'Jetpack Compose'
        ],
      ),
      SkillCategory(
        label: 'Ferramentas',
        skills: [
          'Git',
          'GitHub',
          'GitLab',
          'GitHub Actions',
          'Jenkins CI/CD',
          'Jira',
          'ADB',
          'Fastboot',
          'Bitbucket',
        ],
      ),
      SkillCategory(
        label: 'Bancos de Dados',
        skills: ['PostgreSQL', 'MySQL', 'SQLite', 'MongoDB', 'Redis'],
      ),
      SkillCategory(
        label: 'Android',
        skills: [
          'CTS/GTS/VTS',
          'Kernel',
          'Firmware',
          'UIAutomator2',
          'Sensors'
        ],
      ),
    ],
    education: [
      EducationEntry(
        degree: 'B.S. Engenharia Elétrica',
        institution: 'UFAM – Universidade Federal do Amazonas',
        period: '2020 – Present',
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
