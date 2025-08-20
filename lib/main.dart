import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menú principal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _menuButton(context, "Ejemplo de Layout", const ExampleLayoutScreen()),
            const SizedBox(height: 16),
            _menuButton(context, "Contador", const ExampleCounterScreen()),
            const SizedBox(height: 16),
            _menuButton(context, "Lista dinámica", const ExampleListScreen()),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Text(text),
    );
  }
}

class ExampleLayoutScreen extends StatelessWidget {
  const ExampleLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplo Layout")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12))),
                Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12))),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 180,
                  height: 70,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                ),
                const Text("Texto superpuesto", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.teal),
              title: const Text("Elemento 1"),
            ),
            ListTile(
              leading: const Icon(Icons.search, color: Colors.teal),
              title: const Text("Elemento 2"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleCounterScreen extends StatefulWidget {
  const ExampleCounterScreen({super.key});

  @override
  State<ExampleCounterScreen> createState() => _ExampleCounterScreenState();
}

class _ExampleCounterScreenState extends State<ExampleCounterScreen> {
  int counter = 0;

  void _increment() {
    setState(() => counter++);
  }

  void _decrement() {
    setState(() => counter--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contador")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor actual: $counter", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _increment, child: const Text("Aumentar")),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: _decrement, child: const Text("Disminuir")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleListScreen extends StatefulWidget {
  const ExampleListScreen({super.key});

  @override
  State<ExampleListScreen> createState() => _ExampleListScreenState();
}

class _ExampleListScreenState extends State<ExampleListScreen> {
  List<String> items = List.generate(12, (index) => "Elemento ${index + 1}");

  void _addItem() {
    setState(() {
      items.add("Elemento ${items.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista dinámica")),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list, color: Colors.teal),
            title: Text(items[index], style: const TextStyle(fontSize: 16)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
