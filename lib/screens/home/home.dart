import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reorderables/reorderables.dart';
import 'package:yugen/models/todoModel.dart';
import 'package:yugen/routes/router.gr.dart';
import 'package:yugen/utils/todoMemory.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _rows = [];
  double ggScore = 0.0;
  int totalTasks = 230;
  TodoMemory todoMemory = new TodoMemory();

  @override
  void initState() {
    todoMemory.todoList.forEach((element) {
      _rows.add(
        Container(
          child: Container(
            child: ListTile(
              onTap: () async {
                _showMyDialog(element);
              },
              title: Text(element.taskName),
              leading: Checkbox(
                  value: false,
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
          child: Container(
            child: ListTile(
              onTap: () async {
                _showMyDialog(element);
              },
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
      ggScore = todoMemory.ggScore;
      totalTasks = todoMemory.totalTaskCompleted;
      _rows = _new;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEFF0F0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF4454DE),
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (BuildContext contextNav) {
                return bottomModelSheetWidget(contextNav);
              });
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  topHeader(),
                  welcomeCard(),
                  dynamicNote(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text(
                      "Today Goals",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text("All tasks"),
                  ),
                  tasks(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text(
                      "Productivity Recommendation",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
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
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: 33,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "${FirebaseAuth.instance.currentUser?.displayName ?? "Hey Hemanth,"}",
            style: TextStyle(fontSize: 24, fontFamily: 'Recoleta'),
          ),
          Spacer(),
          Icon(
            Icons.accessibility,
            size: 27,
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Image(
                image: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL.toString() ??
                        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
                    scale: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget welcomeCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff606eea),
              Color(0xff2130b4),
            ],
          ),
        ),
        height: 200,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      padding: EdgeInsets.only(left: 25),
                      child: AutoSizeText(
                        "Don't let yesterday take up too much of today.",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(right: 25),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "May 02",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    ExtendedNavigator.root.push(Routes.climbPage);
                  },
                  child: Text(
                    "Check my climb",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        AutoSizeText(
                          "$totalTasks",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: AutoSizeText(
                            "Total Yugen hours",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        AutoSizeText(
                          "$ggScore %",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: AutoSizeText(
                            "GG Score",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        AutoSizeText(
                          "2300",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: AutoSizeText(
                            "Total tasks completed",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dynamicNote() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFF2E3DF),
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        height: 75,
        child: Image.asset('assets/banner.png'),
      ),
    );
  }

  ListView rowFormation() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text("$i"),
        );
      },
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
        padding: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
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

  Future<void> _showMyDialog(TodoModel todoModel) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            // child: ListBody(
            //   children: <Widget>[
            //     Text('This is a demo alert dialog.'),
            //     Text('Would you like to approve of this message?'),
            //   ],
            // ),
            child: trialContainer(todoModel),
          ),
        );
      },
    );
  }

  Widget trialContainer(TodoModel todoModel) {
    return Container(
      child: SizedBox(
        width: 345,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 336.44,
                  height: 39.93,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 5,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Task",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 5,
                        child: SizedBox(
                          width: 60,
                          height: 35,
                          child: Material(
                            color: Color(0x3f4453de),
                            borderRadius: BorderRadius.circular(5),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Color(0xff4453de),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.black),
                SizedBox(height: 28),
                Container(
                  width: 278.76,
                  height: 113.59,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 278.76,
                            child: Text(
                              "${todoModel.taskName}",
                              style: TextStyle(
                                color: Color(0xff545454),
                                fontSize: 20,
                                fontFamily: "Work Sans",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 107.03,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Color(0xff4453de),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Important",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff4453de),
                                    fontSize: 12,
                                    fontFamily: "Work Sans",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 115.25,
                        top: 78.41,
                        child: Container(
                          width: 36.55,
                          height: 35.17,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 36.55,
                                height: 35.17,
                                child: Material(
                                  color: Color(0xff606dea),
                                  shape: CircleBorder(),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 19.97,
                                    height: 19.22,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterLogo(size: 19.22228240966797),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: 289.25,
                  child: Text(
                    "${todoModel.note}",
                    style: TextStyle(
                      color: Color(0xff545454),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  height: 48,
                  child: Material(
                    color: Color(0xff4453de),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Task completed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Work Sans",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomModelSheetWidget(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final taskTitleController = TextEditingController();
    final noteTitleController = TextEditingController();
    return Container(
      height: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 32),
            alignment: Alignment.center,
            child: Text(
              "Add Task",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    autofocus: true,
                    controller: taskTitleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please a valid numeric';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Task Title',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: noteTitleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please a valid numeric';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Task Title',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TodoModel todoModel = TodoModel(
                            uniqueId: 5,
                            taskName: taskTitleController.text,
                            note: noteTitleController.text,
                            deadlineTaskTime: 2134,
                            epochTime: 23423,
                            isCompleted: false,
                            filename: "qweqw");
                        todoMemory.add(todoModel);
                        updateTasks();
                        Navigator.pop(context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Task",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
