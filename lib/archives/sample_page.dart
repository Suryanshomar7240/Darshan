import 'package:flutter/material.dart';
import 'package:travel_app/archives/database.dart';

class samplePage extends StatefulWidget {
  const samplePage({Key? key}) : super(key: key);

  @override
  State<samplePage> createState() => _samplePageState();
}

class _samplePageState extends State<samplePage> {
  List locationList = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getLocationsList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        locationList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: locationList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(locationList[index]['name']),
                  subtitle: Text(locationList[index]['location']['state']),
                  leading: CircleAvatar(
                    child: Image(
                      image: NetworkImage(locationList[index]['image']),
                    ),
                  ),
                  trailing: Text('${locationList[index]['devotees']}'),
                ),
              );
            }));
  }
}
