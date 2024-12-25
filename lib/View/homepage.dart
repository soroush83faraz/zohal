import 'package:flutter/material.dart';
import 'package:zohal/models/child.dart';
import 'package:zohal/view/detail.dart';
import 'package:zohal/controllers/homepage_controller.dart';
import 'package:zohal/controllers/edit_controller.dart';
import 'package:zohal/controllers/add_controller.dart';
import 'dart:async'; 



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChildController _controller = ChildController();
  Color _titleColor =  Colors.white;



  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        _controller.updateTimes();
      });
    });
    Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        _titleColor = (_titleColor == Colors.white) ? Colors.orangeAccent : Colors.white;
      });
    });
  }

  void _addChild() async {
    final newChild = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddController()),
    );

    if (newChild != null && newChild is Child) {
      setState(() {
        _controller.addChild(newChild);
      });
    }
  }

  void _editChild(int index) async {
    final updatedChild = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditController(child: _controller.children[index])),
    );

    if (updatedChild != null && updatedChild is Child) {
      setState(() {
        _controller.editChild(index, updatedChild);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Kids Time Manager',
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
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _controller.children.isEmpty
            ? const Center(
                child: Text(
                  "No children added yet. Click the button below to add a child.",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: _controller.children.length,
                itemBuilder: (context, index) {
                  final child = _controller.children[index];
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: AssetImage(child.picture)),
                    title: Text(
                      child.name,
                      style:const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    subtitle: Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: child.timeLeft / child.totalReserved,
                                backgroundColor: Colors.grey[300],
                                color: child.timeLeft > 5 ? Colors.green : Colors.red,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "${child.timePassed}/${child.totalReserved} min",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () => _editChild(index),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChildDetailPage(child: child),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addChild,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
