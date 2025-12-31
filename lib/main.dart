import 'package:flutter/material.dart';
import 'package:incubyte/extension_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StringCalculatorScreen(),
    );
  }
}

class StringCalculatorScreen extends StatefulWidget {
  const StringCalculatorScreen({super.key});

  @override
  State<StringCalculatorScreen> createState() => _StringCalculatorScreenState();
}

class _StringCalculatorScreenState extends State<StringCalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _errorMessage = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _calculateSum() {
    setState(() {
      _errorMessage = '';
      _result = '';

      try {
        // Replace literal \n with actual newlines
        final processedInput = _controller.text.replaceAll(r'\n', '\n');
        print("Input: $processedInput");
        final sum = processedInput.calculate();
        _result = 'Result: $sum';
      } on Exception catch (e) {
        _errorMessage = e.toString();
      }
    });
  }

  void _clearInput() {
    setState(() {
      _controller.clear();
      _result = '';
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Calculator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter numbers to calculate their sum:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Examples:\n1,2,3\n4\\n5\\n6\n//;\\n1;2;3',
                border: const OutlineInputBorder(),
                labelText: 'Input String',
                helperText: 'Use comma, newline, or custom delimiters',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _calculateSum,
                    icon: const Icon(Icons.calculate),
                    label: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _clearInput,
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_result.isNotEmpty)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                ),
              ),
            if (_errorMessage.isNotEmpty)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Supported Formats:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildExample('Empty string', '""', 'Result: 0'),
            _buildExample('Single number', '23', 'Result: 23'),
            _buildExample('Comma-separated', '1,2,3', 'Result: 6'),
            _buildExample('Newline-separated', '4\\n5\\n6', 'Result: 15'),
            _buildExample('Custom delimiter', '//;\\n1;2;3', 'Result: 6'),
            _buildExample('Negative numbers', '1,-2,3', 'Error thrown'),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String title, String input, String output) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '• $title:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(input, style: const TextStyle(fontFamily: 'monospace')),
          ),
          Expanded(
            flex: 2,
            child: Text(
              output,
              style: TextStyle(
                color: output.startsWith('Error') ? Colors.red : Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
