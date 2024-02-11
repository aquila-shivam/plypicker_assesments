// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plypicker/providers/joke_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //signout
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    var JokesList = context.watch<JokeProvider>().initialJokes;
    var favoriteList = context.watch<JokeProvider>().favoriteJokes;
    
    debug(){
      // Add logging statements to debug
    print('Number of jokes: ${JokesList.length}');
    for (var joke in JokesList) {
        print('Joke: $joke');
    }

    }
    
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ],),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(onPressed: () async{
              await JokeProvider().fetchJokes();
            }, child: Text('Get') ),
            TextButton(onPressed: () {
              debug();
            }, child: Text('Debug') ),
            Expanded(child: ListView.builder(
              itemCount: JokesList.length,
              itemBuilder: (_,index){
                final currentJoke = JokesList[index];
                return Card(
                  key: ValueKey(index),
                  color: Colors.blue,
                  elevation: 4,
                  child: ListTile(
                    title: Text(currentJoke.joke,style: TextStyle(
                      color: Colors.white
                    ),),
                    trailing: IconButton(
                      icon:Icon(
                        Icons.favorite,
                        color: favoriteList.contains(currentJoke)
                               ? Colors.red
                               : Colors.white,
                        size: 30,
                      ),
                      onPressed: (){
                        if(!favoriteList.contains(currentJoke)){
                          context.read<JokeProvider>().addToFavorites(currentJoke);
                        }
                        else{
                          context.read<JokeProvider>().removeFromFavorites(currentJoke);
                        }
                      },
                      ),
                  ),
                );
              },
            )
            ),

          ],
        ),)
    );
  }
}

