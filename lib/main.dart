import 'package:context_composition/widgets/box.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Composition',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String noteDetailTitle = '';
  String noteDetailContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Composition'),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Box(
                  title: 'TIMELINE',
                  child: _buildTimelineList(),
                ),
                Box(
                  title: 'NOTES',
                  child: _buildQueryResultList(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Box(
                title: 'DETAILS',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildDetailView(),
                    _buildPromptBox(),
                    _buildResponseView(),
                    _buildAddNoteBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailView() {
    String detailText = '';
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detail View',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(detailText),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  // Implement close functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  // Implement save functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromptBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Prompt',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your query',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Implement search functionality
                },
              ),
            ),
            onSubmitted: (value) {
              // Implement query submission functionality
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  // Implement submit functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResponseView() {
    String responseText = 'Example response from GPT based on the query.';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Response',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SingleChildScrollView(
            child: Text(responseText),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineList() {
    // Example data
    List<Map<String, String>> exampleNotes = [
      {
        'title': '4/10/22 16:00 Call: Bart, Concrete Co. - delivery',
        'content': 'Delivery expected Thursday, confirmed liftgate.',
      },
      {
        'title': '4/10/22 15:45 Call: Jane, Insurance Co. - claim update',
        'content': 'Claim approved, reimbursement in 5-7 business days.',
      },
      {
        'title': '4/9/22 14:30 Meeting: Team brainstorming session',
        'content': 'Discussed new marketing strategies, assigned tasks.',
      },
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: exampleNotes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(exampleNotes[index]['title']!),
            onTap: () {
              setState(() {
                noteDetailTitle = exampleNotes[index]['title']!;
                noteDetailContent = exampleNotes[index]['content']!;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildQueryResultList() {
    final List<String> entries = [
      '4/07/22 11:00 Call: Alice, Concrete Co.',
      '4/08/22 14:00 Call: Bob, Concrete Co.',
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(entries[index]),
            onTap: () {
              // Implement onTap functionality
            },
          );
        },
      ),
    );
  }

  Widget _buildAddNoteBox() {
    TextEditingController noteController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: noteController,
            decoration: const InputDecoration(
              labelText: 'Add a new note',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement note addition functionality
              noteController.clear();
            },
            child: const Text('Add Note'),
          ),
        ],
      ),
    );
  }
}
