import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wastedrinkdl/bloc/ai_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.image}) : super(key: key);

  final File image;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    context.read<AiBloc>().add(GetPrediction(file: widget.image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.close),
              color: Theme.of(context).colorScheme.secondaryVariant,
              onPressed: () => Navigator.pop(context))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Column(
            children: [
              Text(
                'RESULT',
                style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                    color: Theme.of(context).colorScheme.secondaryVariant)),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Image.file(widget.image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<AiBloc, AiState>(builder: (context, state) {
                return Card(
                  margin: const EdgeInsets.all(0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: Center(
                      child: state.status == AiStatus.success
                          ? Text(
                              'CAN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                            )
                          : const CircularProgressIndicator(),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
