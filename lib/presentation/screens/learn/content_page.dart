import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakshmi_setu/core/bloc/learning_content/cubit.dart';
import 'package:lakshmi_setu/core/bloc/learning_content/states.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/data/models/story_model.dart';

class LearningContentScreen extends StatefulWidget {
  static const route = '/learningContentScreen';
  static const routeName = 'LearningContentScreen';
  final String? topic;
  const LearningContentScreen({super.key, required this.topic});

  @override
  State<LearningContentScreen> createState() => _LearningContentScreenState();
}

class _LearningContentScreenState extends State<LearningContentScreen> {
  final TextEditingController _languageController =
      TextEditingController(text: 'Hindi');

  @override
  void initState() {
    context
        .read<LearningContentCubit>()
        .generateContent(widget.topic.toString(), _languageController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.toString()),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: SizedBox(
        //       width: 100,
        //       height: 35,
        //       child: TextField(
        //         controller: _languageController,
        //         decoration: const InputDecoration(
        //           hintText: 'Language',
        //           contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        //           border: OutlineInputBorder(),
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: BlocBuilder<LearningContentCubit, LearningContentState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.error.isNotEmpty) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(
                  color: context.colorScheme.error,
                ),
              ),
            );
          }
          final content = state.content;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(
                      content?.title ?? "", content?.story ?? ""),
                  _buildSectionTitle(
                      "Cultural Relevance", content?.culturalRelevance ?? ""),
                  _buildRealScenario(content?.realScenario),
                  _buildTranslationSection(content!.translation),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title, String content,
      {bool translation = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.shade300.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.brown.shade200, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.notes_outlined, size: 32, color: Colors.brown),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown.shade800,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRealScenario(RealScenario? realScenario,
      {bool translation = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.shade300.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.brown.shade200, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 32, color: Colors.brown),
                const SizedBox(height: 8),
                Text(
                  realScenario?.title ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              realScenario?.scenario ?? "",
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown.shade800,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranslationSection(Translation translation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Translated Story", translation.story),
        _buildSectionTitle(
            "Translated Cultural Relevance", translation.culturalRelevance),
        _buildRealScenario(translation.realScenario),
      ],
    );
  }
}
