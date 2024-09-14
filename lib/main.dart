import 'package:flutter/material.dart';
import 'package:profile_ui/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget{

  List<Post> posts =[
    Post(name: 'Demba Amadou Mbaye', image: "images/sadio.png", time: "5 minutes", desc: "Enfin j'espère que sadio sera réspecté à sa juste valeure"),
    Post(name: 'Demba Amadou Mbaye', image: "images/nba.png", time: "2 jours", desc: "Ce fut un plaisir d'avoir rencontrer mon gars Davido, une personne humble"),
    Post(name: "Demba Amadou Mbaaye", image: "images/nba2.png", time: "1 semaine", desc: "la team nba Africa"),
    Post(name: 'Demba Amadou Mbaye', image: "images/curry.jpg", time: "5 ans", desc: "Steph curry, about last night. Le meilleur joueur de la nba , je veux rien savoir."),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = MediaQuery.of(context).size.width;
    var platform = Theme.of(context).platform;
    print("size: $width");
    print("platform: $platform");
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook profile'),

      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('images/rm.jpg', height: 200,width: width, fit: BoxFit.cover),
                Padding(
                    padding: EdgeInsets.only(top: 125),
                  child:CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.white,
                    child: profilePicture(72),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Spacer(),
                Text(
                  "Demba Amadou Mbaye",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Spacer(),
              ],
            ),

           const Padding(
               padding: EdgeInsets.all(10),
             child: Text(
               'Pray 4 me if i pass away 1st.✨',
               style: TextStyle(
                 color: Colors.grey,
               ),
               textAlign: TextAlign.center,
             ),
           ),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profile")
                ),
                buttonContainer(icon: Icons.border_color),
              ],
            ),
           Divider(thickness: 2),
           sectionTitle("A propos de moi"),
           aboutRow(icon: Icons.home, text: "Dakar, Senegal"),
           aboutRow(icon: Icons.work, text: "Developpeur flutter"),
           aboutRow(icon: Icons.favorite, text: "Passionné de voyage"),
            Divider(thickness: 2),
            sectionTitle("Amis"),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                friendsImage("Malick Mbaye", "images/malick.PNG", width/3.5),
                friendsImage("Life style", "images/car.png", width/3.5),
                friendsImage("Dev Flutter", "images/flutter.png", width/3.5),
              ],
            ),
            Divider(thickness: 2),
            sectionTitle("Mes publications"),
            allPosts()
          ],
        ) ,
      ),

    );

  }
  //----------------les fonctions---------------------
Container buttonContainer({IconData? icon, String? text}){
return Container(
  margin: EdgeInsets.only(left: 10, right: 10),
  padding:EdgeInsets.all(10),
   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(20),
     color: Colors.blue
   ),
   child: (icon==null)
    ?Center(child: Text(text ?? "NO ICON", style: TextStyle(color: Colors.white)))
    : Icon(icon, color: Colors.white,),
  height: 50,

);
}

Widget sectionTitle(String text){
    return Padding(
        padding: EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
}

Widget aboutRow({required IconData icon,required String text}){
    return Row(
    children: [
      Icon(icon),
      Padding(
          padding: EdgeInsets.all(5),
      child: Text(text),
      )

    ],
    );
}
CircleAvatar profilePicture (double radius) {
    return (
    CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage('images/pp.jpg'),
    )
    );
  }

  Column friendsImage(String name, String imagePath, double width){
    return Column(
     children: [
       Container(
         margin: EdgeInsets.all(5),
         height: width,
         width: width,
         decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover),
           borderRadius: BorderRadius.circular(20),
           //boxShadow: [BoxShadow(color: Colors.black)],
           color: Colors.blue
         ),
       ),
       Text(name)
     ],
    );
  }

  // POSTS

  Column allPosts(){
    List<Widget> postsToAdd = [];
    posts.forEach((element) {
      postsToAdd.add(post(post: element));
    });
    return Column(children: postsToAdd,);
  }

  //Container post({required String time , required String image, required String desc, int likes = 0, int comments = 0}) {
  Container post({required Post post}) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              profilePicture(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text(post.name),
              Spacer(),
              timeText(post.setTime())
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(post.image, fit: BoxFit.cover,)
          ),
          Text(post.desc,
            style: TextStyle(
                color: Colors.black),
            textAlign: TextAlign.center,

          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text(post.setLikes()),
              Icon(Icons.message),
              Text(post.setComments())
            ],
          )

        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text("Il y a $time", style: TextStyle(color: Colors.blue),);
  }
}