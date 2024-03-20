// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:submission_project/data/models.dart';
import 'package:submission_project/data/services.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_bloc.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_event.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_state.dart';

class SelectionScreen extends StatefulWidget {
  final String? selectedValue;
  const SelectionScreen({
    Key? key,
    this.selectedValue,
  }) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  SelectionBloc selectionBloc = SelectionBloc();
  String? selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.selectedValue ?? "India";
    selectionBloc.add(SelectionDataLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Country Selection"),
        ),
        body: BlocBuilder<SelectionBloc, SelectionState>(
          bloc: selectionBloc,
          builder: (context, state) {
            if (state is DataLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DataLoadedState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  print("Runtime Check : ${state.data.first.runtimeType}");
                  final item = state.data[index];
                  return ListTile(
                    onTap: () {
                      // print("Imagem : ${item.flags.png}");
                      selectCountry(item, context);
                    },
                    title: Text(
                      item.name.common,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    leading: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Image.network(item.flags.png, fit: BoxFit.contain),
                    ),
                    trailing: Radio(
                      groupValue: selectedValue ?? "Ni",
                      value: "${item.name.common}",
                      onChanged: (value) {
                        selectCountry(item, context);
                      },
                    ),
                  );
                },
                physics: BouncingScrollPhysics(),
              );
            } else if (state is DataErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Center(
              child: Text("Check your network"),
            );
          },
        ));
  }

  void selectCountry(Country item, BuildContext context) {
    selectedValue = item.name.common;
    setState(() {});
    Navigator.pop(context, [item.flags.png, item.name.common]);
  }
}
