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

// ── Data ─────────────────────────────────────────────────────────────────────

const String kName = 'Jhonatha Cirilo Sodre';
const String kTitle = 'Software Engineer · Android Developer · QA Automation';
const String kLocation = 'Manaus, AM, Brazil';
const String kEmail = 'jhon.desodre@gmail.com';
const String kPhone = '+55 (92) 993165406';
const String kGitHub = 'https://github.com/desodre';
const String kLinkedIn = 'https://www.linkedin.com/in/jhonsodre/';
const String kAvatarUrl =
    'https://avatars.githubusercontent.com/u/108944889?v=4';
const String kBio =
    'Undergraduate Electrical Engineering student (10th period) with over '
    'three years of experience in Android development and testing. '
    'Specialist in test automation, firmware validation, and cross-platform '
    'development using Flutter, Python, and Kotlin.';

const List<ExperienceEntry> kExperiences = [
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
];

const List<ProjectEntry> kProjects = [
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
];

const List<SkillCategory> kSkills = [
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
      'Unittest',
      'Scrapy',
    ],
  ),
  SkillCategory(
    label: 'Tools',
    skills: ['Git', 'GitHub', 'Jenkins CI/CD', 'Jira', 'ADB', 'Fastboot', 'Bitbucket'],
  ),
  SkillCategory(
    label: 'Databases',
    skills: ['PostgreSQL', 'MySQL', 'SQLite'],
  ),
  SkillCategory(
    label: 'Android',
    skills: ['CTS/GTS/VTS', 'Kernel', 'Firmware', 'UIAutomator2', 'Sensors'],
  ),
];

const List<EducationEntry> kEducation = [
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
];

const List<CourseEntry> kCourses = [
  CourseEntry(
    title: 'Android Developer Tests',
    provider: 'Udemy',
    year: '2023',
  ),
  CourseEntry(
    title: 'Backend Development',
    provider: 'Samsung Ocean',
    year: '2023',
  ),
  CourseEntry(
    title: 'Android Development with Flutter',
    provider: 'Alura',
    year: '2024',
  ),
];

const List<Map<String, String>> kLanguages = [
  {'name': 'Portuguese', 'level': 'Native'},
  {'name': 'English', 'level': 'Advanced'},
  {'name': 'Spanish', 'level': 'Advanced'},
  {'name': 'German', 'level': 'Basic'},
];
