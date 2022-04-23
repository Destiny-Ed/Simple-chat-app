import 'package:cryto/Model/chat_model.dart';
import 'package:cryto/Model/stories_model.dart';
import 'package:cryto/Screens/Chat/chat_details.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> actions = ['assets/camera.png', 'assets/edit.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: red,
            radius: 8,
            backgroundImage: const AssetImage('assets/person1.png'),
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(
              fontSize: 30, color: black, fontWeight: FontWeight.bold),
        ),
        actions: List.generate(
          actions.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: whiteGrey,
                radius: 15,
                child: Image.asset(
                  actions[index],
                  width: 16,
                ),
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    padding: const EdgeInsets.only(left: 10),
                    // margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: whiteGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      onTap: () {},
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: Icon(
                            Icons.search,
                            color: grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 8.8),
                          hintStyle: TextStyle(color: grey),
                          hintText: 'Search'),
                    ),
                  ),

                  ///Stories
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: whiteGrey,
                                  child: Icon(
                                    Icons.add,
                                    color: black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('Your story',
                                    style: TextStyle(color: lightBlack))
                              ],
                            ),
                          ),
                          ...List.generate(stories.length, (index) {
                            final data = stories[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: whiteGrey,
                                    backgroundImage: AssetImage(data.image!),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(data.title!,
                                      style: TextStyle(color: lightBlack))
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  ...List.generate(users.length, (index) {
                    final data = users[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    ChatDetailsPage(data: data)));
                      },
                      contentPadding: const EdgeInsets.all(0),
                      leading: Hero(
                        tag: data.id!,
                        child: CircleAvatar(
                          backgroundColor: whiteGrey,
                          backgroundImage: AssetImage(data.image!),
                        ),
                      ),
                      title: Text(data.title!),
                      subtitle: Text(data.subtitle!),
                      trailing: Icon(
                        index.isEven
                            ? Icons.check_circle_outline
                            : Icons.circle_outlined,
                        size: 16,
                        color: grey,
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
