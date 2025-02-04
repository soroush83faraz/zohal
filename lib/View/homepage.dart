import 'package:flutter/material.dart';
import 'package:zohal/models/child.dart';
import 'package:zohal/view/detail.dart';
import 'package:zohal/controllers/homepage_controller.dart';
import 'package:zohal/controllers/edit_controller.dart';
import 'package:zohal/controllers/add_controller.dart';
import 'package:zohal/controllers/save_controller.dart';
import 'package:zohal/controllers/load_controller.dart';
import 'package:zohal/controllers/card_controller.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChildController _controller = ChildController();
  final SaveController _saveController = SaveController();
  final LoadController _loadController = LoadController();
  Color _titleColor = Colors.white;

  @override
  void initState() {
    _loadChildren();
    super.initState();

    _loadChildren();
    Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        _controller.updateTimes();
      });
      _saveChildren();
    });
    Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        _titleColor =
            (_titleColor == Colors.white) ? Colors.orangeAccent : Colors.white;
      });
    });
  }

  void _addChild(List<Child> _children) async {
    final newChild = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (contex) => AddController(children: _children)),
    );

    if (newChild != null && newChild is Child) {
      setState(() {
        _controller.addChild(newChild);
      });
      _saveChildren();
    }
  }

  void _editChild(int index, List<Child> children) async {
    final updatedChild = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => EditController(
                child: _controller.children[index],
                children: children,
              )),
    );

    if (updatedChild != null && updatedChild is Child) {
      setState(() {
        _controller.editChild(index, updatedChild);
      });
      _saveChildren();
    }
  }

  void _loadChildren() async {
    List<Child> children = await _loadController.loadChildrenData();
    for (var child in children) {
      child.updateTimePassed();
    }
    setState(() {
      _controller.setChildren(children);
    });
  }

  void _saveChildren() {
    _saveController.saveChildrenData(_controller.children);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'سیستم مدیریت خانه بازی',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _titleColor,
                shadows: const [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 5,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.orangeAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("images/winnie-the-pooh.png")),
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _controller.children.isEmpty
            ? const Center(
                child: Text(
                  "!هیچ کودکی در حال حاضر در حال بازی نیست",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: _controller.children.length,
                itemBuilder: (context, index) {
                  final child = _controller.children[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: GlowCard(
                      child: Card(
                        elevation: 20,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.transparent,
                        shadowColor: Colors.black54,
                        child: ListTile(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          leading: SizedBox(
                            width: 80,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.white),
                                  onPressed: () =>
                                      _editChild(index, _controller.children),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.white),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('حذف کودک'),
                                          content:
                                              const Text('آیا مطمئن هستید؟'),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('خیر'),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _controller
                                                          .deleteChild(index);
                                                      _saveChildren();
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('بله'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                child.name,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "-" + (child.number).toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: LinearProgressIndicator(
                                    value:
                                        ((child.timeLeft) / child.totalReserved)
                                            .abs(),
                                    backgroundColor: Colors.grey[300],
                                    color: child.timeLeft > 5
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Text(
                                "دقیقه ${(child.timeLeft).abs()}",
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChildDetailPage(child: child),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addChild(_controller.children),
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
