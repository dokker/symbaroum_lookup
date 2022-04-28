import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../entities/checkboxlistmodel.dart';

List<CheckboxListModel> checkboxListModel = CheckboxListModel.getOptions();

class GetDrawer extends StatelessWidget {
  const GetDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: GetCheckboxes(),
    );
  }
}

class GetCheckboxes extends StatefulWidget {
  const GetCheckboxes({Key? key}) : super(key: key);

  @override
  _GetCheckboxesState createState() => _GetCheckboxesState();
}

class _GetCheckboxesState extends State<GetCheckboxes> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: checkboxListModel.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                        title: Text(
                            checkboxListModel[index].title ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        dense: true,
                        secondary: const Icon(Icons.hive),
                        value: checkboxListModel[index].isCheck,
                        onChanged: (bool? val) {
                          itemChange(val, index);
                        }
                    ),
                  ]
              ),
            ),
          );
        },
    );
  }

  void itemChange(bool? val, int index) {
    setState(() {
      checkboxListModel[index].isCheck = val ?? false;
      //_runFilter('');
    });
  }
}

