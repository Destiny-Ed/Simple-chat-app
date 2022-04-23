import 'package:badges/badges.dart';
import 'package:cryto/Model/chat_model.dart';
import 'package:cryto/Provider/db_provider.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/material.dart';

class ChatDetailsPage extends StatefulWidget {
  const ChatDetailsPage({Key? key, this.data}) : super(key: key);

  final ChatDataModel? data;

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  List<IconData> actions = [Icons.call, Icons.video_call];

  TextEditingController controller = TextEditingController();

  List<String> icons = [
    'assets/action.png',
    'assets/video.png',
    'assets/photo.png',
    'assets/audio.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Hero(
                  tag: widget.data!.id!,
                  child: Badge(
                    badgeColor: Colors.green,
                    padding: const EdgeInsets.all(5),
                    position: BadgePosition.bottomEnd(end: 0, bottom: 0),
                    child: CircleAvatar(
                      backgroundColor: red,
                      // radius: 15,
                      backgroundImage: AssetImage(widget.data!.image!),
                    ),
                  ),
                ),
                title: Text(
                  widget.data!.title!,
                  style: TextStyle(color: black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Online', style: TextStyle(color: lightBlack)),
              ),
            ),
          ],
        ),
        actions: List.generate(
          actions.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: whiteGrey,
                radius: 15,
                child: Icon(
                  actions[index],
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/chat_bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            ///Chat area

            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: FutureBuilder(
                  future: DatabaseProvider()
                      .getMessages(widget.data!.id.toString()),
                  builder: (context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 2.5),
                          child: const Text('Start A Conversation'),
                        );
                      } else {
                        return Column(
                          children: [
                            ...List.generate(snapshot.data!.length, (index) {
                              final data = snapshot.data![index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Container(
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.only(left: 80),
                                        decoration: BoxDecoration(
                                            color: blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          data['text'],
                                          style: TextStyle(color: white),
                                        ),
                                      ),
                                      trailing: Icon(
                                        index.isEven
                                            ? Icons.check_circle_outline
                                            : Icons.circle_outlined,
                                        size: 16,
                                        color: grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        );
                      }
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 2.5),
                        child: const CircularProgressIndicator(),
                      );
                    }
                  },
                ))
              ],
            ),

            ///Bottom chat field
            Positioned(
              bottom: 0,
              child: Container(
                color: white,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ...List.generate(icons.length, (index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 13),
                        child: Image.asset(
                          icons[index],
                          width: 18,
                        ),
                      );
                    }),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(right: 13),
                        decoration: BoxDecoration(
                            color: whiteGrey,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (value) {
                                  DatabaseProvider()
                                      .sendMessage(
                                          value, widget.data!.id.toString())
                                      .then((value) {
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Message Sent"),
                                        ),
                                      );
                                      if (mounted) {
                                        setState(() {
                                          controller.clear();
                                        });
                                      }
                                    });
                                  });
                                },
                                controller: controller,
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsets.only(top: 3),
                                    hintStyle: TextStyle(color: grey),
                                    hintText: 'Aa'),
                              ),
                            ),
                            Image.asset(
                              'assets/emoji.png',
                              width: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/like.png',
                      width: 18,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
