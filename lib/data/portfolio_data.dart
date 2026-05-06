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

  const PortfolioContent({
    required this.title,
    required this.bio,
    required this.experiences,
    required this.projects,
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
    sectionSkills: 'Skills',
    sectionSkillsSubtitle: 'Technologies and tools I work with',
    sectionEducation: 'Education',
    sectionEducationSubtitle: 'Academic background & certifications',
    coursesHeading: 'Courses & Certifications',
    spokenLanguagesHeading: 'Languages',
    sectionContact: 'Contact',
    sectionContactSubtitle: "Let's talk",
    contactAvailableLabel: 'Open to opportunities',
    contactBuiltWith: 'built using Flutter',
    experiences: [
      ExperienceEntry(
        role: 'Software QA Android (Automation)',
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
        techs: ['Python', 'Flutter', 'Kotlin', 'FastAPI', 'CTS/GTS/VTS'],
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
        techs: ['Python', 'Scrapy', 'FastAPI', 'ADB', 'UIAutomator2'],
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
        role: 'Data Analyst',
        company: 'SEDUC',
        period: 'Oct 2021 – Aug 2022',
        bullets: [
          'Maintenance reporting with Excel and Power BI',
          'Data analysis and visualisation with Python and R',
        ],
        techs: ['Python', 'R', 'Power BI', 'Excel'],
      ),
    ],
    projects: [
      ProjectEntry(
        name: 'nexus_cts',
        url: 'https://github.com/desodre/nexus_cts',
        description:
            'Portal aggregating Google Android test suites (CTS, GTS, VTS) for streamlined compliance management.',
        techs: ['Dart', 'Flutter'],
      ),
      ProjectEntry(
        name: 'adb_utils',
        url: 'https://pub.dev/packages/adb_utils',
        description:
            'Open-source Dart library wrapping ADB commands for seamless Android device interaction from Dart code.',
        techs: ['Dart', 'ADB', 'Pub.dev'],
      ),
      ProjectEntry(
        name: 'fast_bridge',
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
    skills: [
      SkillCategory(
        label: 'Languages',
        skills: ['Python', 'Dart', 'Kotlin', 'Java', 'SQL', 'R'],
      ),
      SkillCategory(
        label: 'Frameworks',
        skills: ['Flutter', 'FastAPI', 'Robot Framework', 'Unittest', 'Scrapy'],
      ),
      SkillCategory(
        label: 'Tools',
        skills: [
          'Git',
          'GitHub',
          'Jenkins CI/CD',
          'Jira',
          'ADB',
          'Fastboot',
          'Bitbucket',
        ],
      ),
      SkillCategory(
        label: 'Databases',
        skills: ['PostgreSQL', 'MySQL', 'SQLite'],
      ),
      SkillCategory(
        label: 'Android',
        skills: ['CTS/GTS/VTS', 'Kernel', 'Firmware', 'UIAutomator2', 'Sensors'],
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
      CourseEntry(title: 'Android Developer Tests', provider: 'Udemy', year: '2023'),
      CourseEntry(title: 'Backend Development', provider: 'Samsung Ocean', year: '2023'),
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
    sectionSkills: 'Habilidades',
    sectionSkillsSubtitle: 'Tecnologias e ferramentas com que trabalho',
    sectionEducation: 'Formação',
    sectionEducationSubtitle: 'Formação acadêmica e certificações',
    coursesHeading: 'Cursos e Certificações',
    spokenLanguagesHeading: 'Idiomas',
    sectionContact: 'Contato',
    sectionContactSubtitle: 'Vamos conversar',
    contactAvailableLabel: 'Aberto a oportunidades',
    contactBuiltWith: 'feito com Flutter',
    experiences: [
      ExperienceEntry(
        role: 'Software QA Android (Automação)',
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
        techs: ['Python', 'Flutter', 'Kotlin', 'FastAPI', 'CTS/GTS/VTS'],
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
        role: 'Analista de Software (Kernel)',
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
        role: 'Analista de Dados',
        company: 'SEDUC',
        period: 'Oct 2021 – Aug 2022',
        bullets: [
          'Relatórios de manutenção com Excel e Power BI',
          'Análise de dados e visualização com Python e R',
        ],
        techs: ['Python', 'R', 'Power BI', 'Excel'],
      ),
    ],
    projects: [
      ProjectEntry(
        name: 'nexus_cts',
        url: 'https://github.com/desodre/nexus_cts',
        description:
            'Portal que agrega as suítes de testes Android do Google (CTS, GTS, VTS) para gerenciamento de conformidade simplificado.',
        techs: ['Dart', 'Flutter'],
      ),
      ProjectEntry(
        name: 'adb_utils',
        url: 'https://pub.dev/packages/adb_utils',
        description:
            'Biblioteca Dart open-source que encapsula comandos ADB para interação com dispositivos Android a partir do Dart.',
        techs: ['Dart', 'ADB', 'Pub.dev'],
      ),
      ProjectEntry(
        name: 'fast_bridge',
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
        url: 'https://github.com/desodre/Geppetto',
        description:
            'Framework de automação de UI para Android que orquestra e executa sua suíte de testes com precisão. Fornece uma API Python de alto nível para controlar dispositivos Android via ADB, Fastboot e UIAutomator2.',
        techs: ['Python', 'Android', 'UIAutomator2', 'ADB', 'Fastboot'],
      ),
    ],
    skills: [
      SkillCategory(
        label: 'Linguagens',
        skills: ['Python', 'Dart', 'Kotlin', 'Java', 'SQL', 'R'],
      ),
      SkillCategory(
        label: 'Frameworks',
        skills: ['Flutter', 'FastAPI', 'Robot Framework', 'Unittest', 'Scrapy'],
      ),
      SkillCategory(
        label: 'Ferramentas',
        skills: [
          'Git',
          'GitHub',
          'Jenkins CI/CD',
          'Jira',
          'ADB',
          'Fastboot',
          'Bitbucket',
        ],
      ),
      SkillCategory(
        label: 'Bancos de Dados',
        skills: ['PostgreSQL', 'MySQL', 'SQLite'],
      ),
      SkillCategory(
        label: 'Android',
        skills: ['CTS/GTS/VTS', 'Kernel', 'Firmware', 'UIAutomator2', 'Sensors'],
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
