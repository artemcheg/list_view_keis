import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ListDemo(),
      ),
    );
  }
}

class User extends StatelessWidget {
  const User({Key? key, required this.number, required this.name})
      : super(key: key);
  final String name;
  final String number;

  snackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Скрыть',
          onPressed: () {
            // Code to execute.
          },
        ),
        content: Text(text),
        duration: const Duration(milliseconds: 5000),
        width: 350,
        // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(), color: Colors.teal),
      child: ListTile(
        onTap: () {
          snackBar(context, "Вызвать $name по номеру $number?");
        },
        title: Text.rich(
          TextSpan(
              text: "Имя: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: name, style: const TextStyle(color: Colors.white))
              ]),
        ),
        subtitle: Text.rich(
          TextSpan(
              text: "Номер: ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: number, style: const TextStyle(color: Colors.white))
              ]),
        ),
      ),
    );
  }
}

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  var user = <User>[
    const User(number: "+77545121222", name: "Иван"),
    const User(number: "+77544324233", name: "Анна"),
    const User(number: "+77556776544", name: "Джек"),
    const User(number: "+77512344555", name: "Джон"),
    const User(number: "+77508976666", name: "Мэри"),
    const User(number: "+77545423477", name: "Ватсон"),
    const User(number: "+77515676888", name: "Олег"),
    const User(number: "+77590890099", name: "Инна"),
    const User(number: "+77514345700", name: "Дарья"),
    const User(number: "+77587866816", name: "Оля")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: user.length,
        itemBuilder: (BuildContext context, int index) {
          return user[index];
        });
  }
}
