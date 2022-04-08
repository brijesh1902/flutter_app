import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/data_model.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();

}

class _NewsPageState extends State<NewsPage> {
  List<Data> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var url = Uri.parse("https://api.sampleapis.com/futurama/characters");
    var response = await http.get(url);
    if(response.statusCode == 200) {
      isLoading = true;
      var item = jsonDecode(response.body.toString());

      setState(() {
        items.clear();

        for(Map i in item) {
          Name name = Name.fromJson(i["name"]??'');
          Images images = Images.fromJson(i["images"]??'') ;

          Data data = Data(name: name , images: images, gender: i["gender"]??'', species: i["species"]??'',
              homePlanet: i["homePlanet"]??'', occupation: i["occupation"]??'', sayings: List<String>.from(i["sayings"]??''),
              id: i['id']?? 0, age: i["age"]??'');

          items.add(data);
        }

      });
    } else {
      setState(() {
        items = [];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Center(child: Text('News List')),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if(!isLoading || items.contains(null)) {
      return const Center(child: CircularProgressIndicator(color: Colors.black54,));
    }
    return Center(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => getCardView(index)
        )
    );
  }

  Widget getCardView(index) {
    var fullName = items[index].name.first+" "+items[index].name.middle+" "+items[index].name.last;
    var image = items[index].images.main;
    String desc = items[index].sayings.toString();
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(image.toString())
                  )
              ),
            ),
            const SizedBox(width: 20),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(height: 10),
                Text(fullName.toString().trim(), textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.blue),),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Text(
                    desc.substring(1, desc.length-1),
                    maxLines: 2,
                    style: const TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            const Divider(
              color: Colors.grey,
            )

          ],
        ),
      ),
    );
  }
}
