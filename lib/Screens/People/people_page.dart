import 'package:badges/badges.dart';
import 'package:cryto/Model/chat_model.dart';
import 'package:cryto/Model/stories_model.dart';
import 'package:cryto/Screens/Chat/chat_details.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List<String> actions = ['assets/chat_icon.png', 'assets/contact.png'];
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
          'People',
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
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(top: 40, bottom: 8),
                      child: Text('RECENTLY ACTIVE',
                          style: TextStyle(color: lightBlack))),

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
                        child: Badge(
                          badgeColor: Colors.green,
                          padding: const EdgeInsets.all(5),
                          position: BadgePosition.bottomEnd(end: 0, bottom: 0),
                          child: CircleAvatar(
                            backgroundColor: whiteGrey,
                            backgroundImage: AssetImage(data.image!),
                          ),
                        ),
                      ),
                      title: Text(data.title!),
                      trailing: CircleAvatar(
                        backgroundColor: whiteGrey,
                        radius: 15,
                        child: Image.asset(
                          'assets/wave.png',
                          width: 16,
                        ),
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
