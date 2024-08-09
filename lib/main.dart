import 'package:flutter/material.dart';
import 'package:weather_kokorkin/offices.dart';

void main() {
  runApp(const WeatherMainScreen());
}

class WeatherMainScreen extends StatelessWidget {
  const WeatherMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<OfficesList> officesList;

  @override
  void initState() {
    officesList = getOfficesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offices List'),
      ),
      body: FutureBuilder(
        future: officesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.offices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(snapshot.data!.offices[index].name),
                    subtitle: Text(snapshot.data!.offices[index].address),
                    leading:
                        Image.network(snapshot.data!.offices[index].image),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: SelectableText('${snapshot.error}' , 
            
            ));
          }

          return const Center(child: CircularProgressIndicator());
        },
        
      ),
    );
  }
}
