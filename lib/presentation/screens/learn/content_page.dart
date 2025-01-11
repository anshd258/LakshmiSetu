import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakshmi_setu/core/bloc/learning_content/cubit.dart';
import 'package:lakshmi_setu/core/bloc/learning_content/states.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';

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
      TextEditingController(text: 'English');

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 100,
              height: 35,
              child: TextField(
                controller: _languageController,
                decoration: const InputDecoration(
                  hintText: 'Language',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.content.isEmpty)
                  const Text('No content generated yet. Please try loading.'),
                if (state.content.isNotEmpty)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        state.content,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
