import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:swipe_my_ride/garageApp.dart';

const imageUrl = "https://www.telegraph.co.uk/content/dam/news/2017/11/11/Lam1_trans_NvBQzQNjv4BqnAdySV0BR-4fDN_-_p756cVfcy8zLGPV4EhRkjQy7tg.jpg?imwidth=450";
class ChatInterface extends StatefulWidget {
  @override
  State createState() => new ChatInterfaceState();
}

class ChatInterfaceState extends State<ChatInterface>{


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 570, right: 300),
          child: FloatingActionButton(
            child: Icon(Icons.chat),
            backgroundColor: Colors.green,
            onPressed: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GarageApp()),
                );
              }
            },
          )
      ),
      body: new ListView.builder(
          itemCount: 20,
          itemBuilder:(context, index) {
            return new GestureDetector(
              child: new Card(
                  child: ConversationListItem()
              ),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new ChatScreen()),

                );
              },

            );
          }),
    );
  }
}


class ConversationListItem extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ConversationListItemState();
  }
}

class _ConversationListItemState extends State<ConversationListItem>{
  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        _buildConversationImage(),
        _buildTitleAndLatestMessage(),
      ],
    );
  }

  _buildConversationImage(){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(imageUrl)
            ),
          )
      ),
    );
  }

  _buildTitleAndLatestMessage(){
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildConversationTitle(),
          _buildLatestMessage(),
        ],
      ),
    );

  }

  _buildConversationTitle(){
    return Text(
      'User',
      style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
    );
  }

  _buildLatestMessage(){
    return Text(
      '...',
      style: TextStyle(
          color: Colors.grey.shade700
      ),
    );
  }
}
