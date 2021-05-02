import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reorderables/reorderables.dart';
import 'package:yugen/utils/todoMemory.dart';

class TeamsPage extends StatefulWidget {
  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<Widget> _rows = [];
  TodoMemory todoMemory = new TodoMemory();

  @override
  void initState() {
    todoMemory.todoList.forEach((element) {
      _rows.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            color: Color(0xFFE9E9E9),
            child: ListTile(
              title: Text(
                element.taskName,
                style: TextStyle(
                    decoration: element.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              leading: Checkbox(
                  value: element.isCompleted,
                  onChanged: (value) {
                    todoMemory.updateCompleted(element);
                    updateTasks();
                  }),
            ),
          ),
        ),
      );
    });
    super.initState();
  }

  void updateTasks() {
    List<Widget> _new = [];
    todoMemory.todoList.forEach((element) {
      _new.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            color: Color(0xFFE9E9E9),
            child: ListTile(
              title: Text(
                element.taskName,
                style: TextStyle(
                    decoration: element.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              leading: Checkbox(
                  value: element.isCompleted,
                  onChanged: (value) {
                    todoMemory.updateCompleted(element);
                    updateTasks();
                  }),
            ),
          ),
        ),
      );
    });

    setState(() {
      _rows = _new;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEFF0F0),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  topHeader(),
                  // welcomeCard(),
                  // dynamicNote(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                    child: Text(
                      "My Team Goals",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  tasks(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topHeader() {
    return Container(
      child: Image.asset(
        'assets/team.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget tasks() {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }

    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 300,
      child: Container(
        // color: Colors.white,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            ReorderableSliverList(
              delegate: ReorderableSliverChildListDelegate(_rows),
              onReorder: _onReorder,
            )
          ],
        ),
      ),
    );
  }
}
