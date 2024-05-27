import 'package:cybersecurity_quiz_app/logic/bloc/quiz_bloc.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_event.dart';
import 'package:cybersecurity_quiz_app/logic/bloc/quiz_state.dart';
import 'package:cybersecurity_quiz_app/presentation/widgets/quiz_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizList extends StatefulWidget {
  const QuizList({super.key});

  @override
  State<QuizList> createState() => _QuizList();
}

class _QuizList extends State<QuizList> {
  final _scrollController = ScrollController();
  final _textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _textcontroller.addListener(_searchQueryChanged);
  }

  void _searchQueryChanged() {
    context.read<QuizBloc>().add(LoadQuizzes(filter: _textcontroller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _textcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search...',
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
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
                        : QuizListItem(quiz: state.quizzes[index]);
                  },
                  itemCount: state.quizzes.length,
                  controller: _scrollController,
                );
              case QuizStatus.initial:
                return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    _textcontroller
      ..removeListener(_searchQueryChanged)
      ..dispose();
    super.dispose();
  }

  // This method reacts to scrolling.
  void _onScroll() {
    if (_isBottom) {
      context.read<QuizBloc>().add(LoadQuizzes(filter: _textcontroller.text));
    }
  }

  // Check if user has scrolled all the way to the bottom.
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
