import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'chat_interface.dart';
import 'home_page.dart';


class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{


   TextEditingController _textController = new TextEditingController();
   List<ChatMessage> _messages = <ChatMessage> [];


  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState((){
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue ),
      child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              decoration: new InputDecoration.collapsed( hintText: "Send a message"),
              controller: _textController,
              onSubmitted: _handleSubmitted,
            ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: ()=> _handleSubmitted(_textController.text)
              ),
            ),
          ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context){
    return  new Scaffold(
      body: new Column(
        children: <Widget>[

        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),

        )
      ],
      ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 570, right: 300),
          child: FloatingActionButton(
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
          onPressed: () {
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            },
        )
        )
    );
  }
}