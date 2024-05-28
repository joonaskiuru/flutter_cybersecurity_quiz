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
    final theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(theme.brightness == Brightness.light
                ? "assets/images/Background_light.jpg"
                : "assets/images/Background_dark.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: theme.brightness == Brightness.light
                    ? Colors.white70
                    : Colors.black87,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  style: theme.textTheme.titleLarge,
                  controller: _textcontroller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan.shade700)),
                    hintText: 'Search...',
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                  BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
                switch (state.status) {
                  case QuizStatus.failure:
                    return const Center(child: Text('failed to fetch posts'));

                  case QuizStatus.success:
                    if (state.quizzes.isEmpty) {
                      return Center(
                          child: Card(
                              child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'No Quizzes.',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      )));
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
        )));
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
