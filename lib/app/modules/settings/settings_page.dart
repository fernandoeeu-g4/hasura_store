import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/modules/settings/profile/profile_module.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key key, this.title = "Settings"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin<SettingsPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(counter.toString()),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('settings/profile');
                },
                child: Text('Fernando'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn2',
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
