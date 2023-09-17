import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> images = [
    {
      'photoURL':
          'https://t3.ftcdn.net/jpg/05/66/82/02/360_F_566820278_N8xRuEKEdFsCJpywmSg1TmFdCDNo2jkn.jpg',
      'photoName': 'Photo 0',
      'description': 'Description for Photo 0'
    },
    {
      'photoURL':
          'https://www.australiangeographic.com.au/wp-content/uploads/2018/06/orange-bellied-parrot-500x294.jpg',
      'photoName': 'Photo 1',
      'description': 'Description for Photo 1'
    },
    {
      'photoURL':
          'https://www.allaboutbirds.org/news/wp-content/uploads/2020/07/STanager-Shapiro-ML.jpg',
      'photoName': 'Photo 2',
      'description': 'Description for Photo 2'
    },
    {
      'photoURL':
          'https://a-z-animals.com/media/2022/06/Lovebirds-on-fence.jpg',
      'photoName': 'Photo 3',
      'description': 'Description for Photo 3'
    },
    {
      'photoURL':
          'https://t3.ftcdn.net/jpg/05/66/82/02/360_F_566820278_N8xRuEKEdFsCJpywmSg1TmFdCDNo2jkn.jpg',
      'photoName': 'Photo 4',
      'description': 'Description for Photo 5'
    },
    {
      'photoURL': 'https://a-z-animals.com/media/2018/09/Parrot-lovebirds.jpg',
      'photoName': 'Photo 5',
      'description': 'Description for Photo 5'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Photos...',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 230,
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    return Card(
                        elevation: 0,
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    images[index]['photoName'] + '  Clicked'),
                              ));
                            },
                            child: Image.network(
                              images[index]['photoURL'],
                              width: 75,
                              height: 75,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(images[index]['photoName']),
                          ),
                        ]));
                  }),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (_, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      images[index + 1]['photoURL'],
                    ),
                  ),
                  title: Text(images[index + 1]['photoName']),
                  subtitle: Text(images[index + 1]['description']),
                );
              },
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Photos Uploaded Successfully!')));
              },
              child: Icon(Icons.upload),
            )
          ],
        ),
      ),
    );
  }
}
