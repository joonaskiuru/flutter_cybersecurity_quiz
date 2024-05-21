import 'package:cybersecurity_quiz_app/logic/bloc/quiz_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizList extends StatefulWidget {
  const QuizList({super.key});

  @override
  State<QuizList> createState() => _QuizList();
}

class _QuizList extends State<QuizList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
      switch (state.status) {
        case QuizStatus.failure:
          return const Center(child: Text('failed to fetch posts'));

        case QuizStatus.success:
          if (state.quizzes.isEmpty) {
            return const Center(child: Text('No quizzes.'));
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.quizzes.length
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      title: Container(
                          height: 400,
                          color: Colors.amber,
                          child: Text(state.quizzes[index].category)),
                    );
            },
            itemCount: state.quizzes.length,
            controller: _scrollController,
          );
        case QuizStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  // This method reacts to scrolling.
  void _onScroll() {
    if (_isBottom) context.read<QuizBloc>().add(LoadQuizzes());
  }

  // Check if user has scrolled all the way to the bottom.
  bool get _isBottom {
    debugPrint("Is Bottom");
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
