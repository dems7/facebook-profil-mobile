class Post{
  String name;
  String time;
  String image;
  String desc;
  int    likes;
  int  comments;

  Post({
    required this.name,
    required this.image,
    required this.time,
    required this.desc,
    this.likes = 0,
    this.comments = 0,
  });

  String setTime() => 'il y a $time minutes';

  String setLikes (){
    if(likes>1){
    return " $likes j'aimes";
  }
    else{
      return " $likes j'aime";
    }
  }
  String setComments (){
    if (comments>1){
      return '$comments commentaires';
    }
    else{
      return '$comments commentaire';
    }
  }
}