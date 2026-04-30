import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/education_section.dart';
import '../widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _keys = {
    'home': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final key = _keys[section];
    if (key?.currentContext == null) return;
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    final offset =
        _scrollController.offset + box.localToGlobal(Offset.zero).dy - NavBar.height;
    _scrollController.animateTo(
      offset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Spacer so content starts below the fixed navbar
                SizedBox(height: NavBar.height),
                Container(
                  key: _keys['home'],
                  child: HeroSection(onScrollToSection: _scrollToSection),
                ),
                Container(
                  key: _keys['experience'],
                  child: const ExperienceSection(),
                ),
                Container(
                  key: _keys['projects'],
                  child: const ProjectsSection(),
                ),
                Container(
                  key: _keys['skills'],
                  child: const SkillsSection(),
                ),
                const EducationSection(),
                Container(
                  key: _keys['contact'],
                  child: const ContactSection(),
                ),
              ],
            ),
          ),
          // Fixed navbar overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(onNavTap: _scrollToSection),
          ),
        ],
      ),
    );
  }
}
