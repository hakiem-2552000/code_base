import 'package:code_base/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:code_base/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NumberTriviaBloc>(
      create: (context) => sl<NumberTriviaBloc>(),
      child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state is Loaded) Text(state.trivia.text),
                  if (state is Error) Text(state.message),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<NumberTriviaBloc>(context)
                          .add(GetTriviaForRandomNumber());
                    },
                    child: const Text('check').tr(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
