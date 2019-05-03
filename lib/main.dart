import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const String _name = 'Son Chau';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FriendlyChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  final List _messages = [];

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage message = new ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendlyChat'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(
            height: 1,
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                child: Text(_name[0]),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
