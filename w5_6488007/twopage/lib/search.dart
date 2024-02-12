import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cinemate',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.theaters, color: Colors.white),
            onPressed: () {
              // Handle cinema icon tap
              // navigate to another page or perform any other action
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              TextField(
                controller: searchController,
                style: TextStyle(color: Colors.white, fontSize: 14.0), // Adjust fontSize
                decoration: InputDecoration(
                  labelText: 'Enter your movie name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
                onSubmitted: (value) {
                  // Handle search when Enter key is pressed
                 String userInput = searchController.text;
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => SecondPage(inputData: userInput),
                  ),
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String inputData;
  SecondPage({required this.inputData});
    final List<Map<String, String>> items = List.generate(
    30,
    (index) => {
      'name': 'Item $index',
      'description': 'Description $index',
      'photoUrl': 'https://via.placeholder.com/150', 
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result for: ' + inputData,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        
      ),
            body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20.0, // Increased spacing
            mainAxisSpacing: 20.0, // Increased spacing
            childAspectRatio: 0.6,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Card(
                    color: Colors.orangeAccent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      items[index]['photoUrl']!,
                      fit: BoxFit.fill,
                      height: 150,
                      width: 125,
                    ),
                    ),
                  ),
                  SizedBox(height: 15), // Increased space between the Card and Text
                  Text(
                    items[index]['name']!,
                    style: TextStyle(color: Colors.white),
            
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}