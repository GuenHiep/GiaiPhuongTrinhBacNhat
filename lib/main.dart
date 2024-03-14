import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Equation Solver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinearEquationSolver(),
    );
  }
}

class LinearEquationSolver extends StatefulWidget {
  @override
  _LinearEquationSolverState createState() => _LinearEquationSolverState();
}

class _LinearEquationSolverState extends State<LinearEquationSolver> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOLVE (ax + b = 0)'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controllerA,
              decoration: InputDecoration(
                labelText: 'Nhập a',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _controllerB,
              decoration: InputDecoration(
                labelText: 'Nhập b',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _solveEquation,
              child: Text('Giải'),
            ),
            SizedBox(height: 20.0),
            Text(
              _result,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void _solveEquation() {
    double a = double.tryParse(_controllerA.text) ?? 0;
    double b = double.tryParse(_controllerB.text) ?? 0;

    if (a == 0) {
      setState(() {
        _result = 'Phương trình không phải là phương trình bậc nhất';
      });
    } else {
      double solution = -b / a;
      setState(() {
        _result = 'Đáp án là: x = $solution';
      });
    }
  }
}
