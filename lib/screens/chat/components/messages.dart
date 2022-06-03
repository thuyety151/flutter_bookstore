import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';


class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final user = FirebaseAuth.instance.currentUser;
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy(
                  'createdAt',
                  descending: true,
                )
                .snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSnapshot.data!.docs;
              return ListView.builder(
                reverse: true,
                itemCount: chatDocs.length,
                itemBuilder: (ctx, index) => MessageBubble(
                  //(chatSnapshot.data!.docs[index])['status'], 
                  (chatDocs[index])['text'],
                  //(chatDocs[index])['username'],
                  //(chatDocs[index])['userImage'],
                  //(chatDocs[index].data())['userId'] == user!.uid,
                  key: ValueKey(chatDocs[index].id),
                ),
              );
      },
    );
  }
}