import 'package:flutter/material.dart';
import '../services/launchScrap.service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/alertDialogMethod.dart';
import '../models/launchScrap.model.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _urlController = TextEditingController();
  bool _isLoading = true;
  bool _data = false;

  late String urlRes = '';
  late String title = '';
  late String name;
  late String ref;
  late String weight;
  late String ean;
  late String especifications;
  List photos = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


        Container(
        margin: EdgeInsets.all(16.0),
        width: size.width / 2,
        child:
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                hintText: 'URL',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 2.0,
                  ),
                ),
              ),
            )),



            (_isLoading) ?
            TextButton(
                onPressed: (){
                  setState(() {
                    _isLoading = false;
                  });
                  launchScrap(context, _urlController.text);
                },
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  height: 45,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.black
                  ),
                  child:
                  const Center(child:Text('ENVIAR', style: TextStyle(fontSize: 22, color: Colors.white),)),
            ))
                :
                CircularProgressIndicator(color: Colors.black,),






            (_isLoading && _data)

                ?
            Column(
              children: [

                Text(urlRes),
                Text(name),
                Text(title),
                Text(ref),


            ],)

                :

                const SizedBox.shrink()








          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add)),

    );
  }








  launchScrap(context, url) async {
    final data = {'url': url};
    final http.Response response = await http.post(
      Uri.parse('http://localhost:8080/api/v1/scrape'),
      body: data,
    );

    if (response.statusCode == 200  ) {
      var jsonRes = launchScrapFromJson(response.body);

      urlRes = jsonRes.url;
      title = jsonRes.title;
      name = jsonRes.name;
      ref = jsonRes.ref;
      weight = jsonRes.weight;
      ean = jsonRes.ean;
      especifications = jsonRes.especifications;
      photos = jsonRes.photos;


      setState(() {
        _isLoading = true;
        _data = true;
      });
    } else {
      alertDialogText(context, "Ocurrió un error - Code:${response.statusCode}", response.body, "REINTENTAR", '/');
    }
  }





}
