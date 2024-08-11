import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_kokorkin/providers_example/color_provider.dart';
import 'package:weather_kokorkin/providers_example/container_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>.value(value: CountProvider()),
          FutureProvider<List<User>>(
            create: (_) async => UserProvider().loadUserData(),
            initialData: const [],
          ),
          StreamProvider(create: (_) => EventProvider().intStream(), initialData: 0),
          ChangeNotifierProvider.value(value: ColorProvider()),
        ],
        child: DefaultTabController(
          length: 4,
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Provider Demo"),
                centerTitle: true,
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.add)),
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.message)),
                    Tab(icon: Icon(Icons.umbrella_sharp)),
                  ],
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  MyCountPage(),
                  MyUserPage(),
                  MyEventPage(),
                  ContainerPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCountPage extends StatelessWidget {
  const MyCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider _state = Provider.of<CountProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${_state.counterValue}', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 50),
            Text('0', style: Theme.of(context).textTheme.labelLarge),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: _state._decrementCount,
                ),
                Consumer<CountProvider>(
                    builder: (context, value, child) => IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.green,
                        onPressed: value._incrementCount))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyUserPage extends StatelessWidget {
  const MyUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('FutureProvider Example, users loaded from a File',
              style: TextStyle(fontSize: 17)),
        ),
        Consumer(
          builder: (context, List<User> users, _) {
            return users.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index].firstName),
                          subtitle: Text(users[index].website),
                        );
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}

// Event page (counting)
class MyEventPage extends StatelessWidget {
  const MyEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<int>(context);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('StreamProvider Example', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 50),
        Text('${_value}', style: Theme.of(context).textTheme.labelLarge),
      ],
    ));
  }
}

// CountProvider (ChangeNotifier)
class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get counterValue => _count;

  void _incrementCount() {
    _count++;
    notifyListeners();
  }

  void _decrementCount() {
    _count--;
    notifyListeners();
  }
}

// UserProvider (Future)
class UserProvider {
  final String _dataPath = "assets/users.json";
  List<User> users = [];

  Future<String> loadAsset() async {
    return await Future.delayed(const Duration(seconds: 2), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    return users;
  }
}

// EventProvider (Stream)
class EventProvider {
  Stream<int> intStream() {
    Duration interval = const Duration(seconds: 2);
    return Stream<int>.periodic(interval, (int count) => count++);
  }
}

// User Model
class User {
  final String firstName, lastName, website;
  const User(this.firstName, this.lastName, this.website);

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'],
        lastName = json['last_name'],
        website = json['website'];
}

// User List Model
class UserList {
  final List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson)
      : users = usersJson.map((user) => User.fromJson(user)).toList();
}
