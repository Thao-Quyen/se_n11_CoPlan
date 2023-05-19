import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/Screen/AccountScreen/text_box.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  // user collection
  final userCollection = FirebaseFirestore.instance.collection('users');
  //color
  Color color1 = const Color.fromRGBO(134, 112, 112, 1);
  Color color2 = const Color.fromRGBO(213, 180, 180, 1);
  Color color3 = const Color.fromRGBO(228, 208, 208, 1);
  Color color4 = const Color.fromRGBO(245, 235, 235, 1);
  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: color4,
        title: Text(
          "Edit $field",
          style: TextStyle(color: color1),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: color1),
          decoration: InputDecoration(
              hintText: 'Enter new $field',
              hintStyle: TextStyle(color: color1)),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(newValue),
              child: Text('Save')),
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ],
      ),
    );
    //update new value firestore database
    if (newValue.trim().length > 0) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  //delete account

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 160),
              child: Text(
                'Account',
                style: TextStyle(fontSize: 16, color: color4),
              ),
            ),
            GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Icon(
                  Icons.logout,
                  color: color4,
                ))
          ],
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          // get user data
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        color: color1,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'Email: ${currentUser.email!}',
                      style: TextStyle(fontSize: 20, color: color4),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // user name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User name:',
                          style: TextStyle(fontSize: 20, color: color4),
                        ),
                        Text(
                            userData['last name'] +
                                ' ' +
                                userData['first name'],
                            style: TextStyle(fontSize: 20, color: color4))
                      ],
                    ),
                  ),
                ),
                MyTextBox(
                  text: userData['first name'],
                  sectionName: 'User first name',
                  onPressed: () => editField('first name'),
                  color1: color1,
                  color4: color4,
                ),
                MyTextBox(
                  text: userData['last name'],
                  sectionName: 'User last name',
                  onPressed: () => editField('last name'),
                  color1: color1,
                  color4: color4,
                ),
                MyTextBox(
                  text: userData['age'],
                  sectionName: 'Age',
                  onPressed: () => editField('age'),
                  color1: color1,
                  color4: color4,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error' + snapshot.error.toString()),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
