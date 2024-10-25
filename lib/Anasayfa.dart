import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {

  var tfController =TextEditingController();
  String alinanVeri="";
  String resimAdi="mutlu.png";
  bool switchControl=false;
  bool checkboxControl=false;
  int radioDeger=0;
  bool progressControl=false;
  double ilerleme=30.0;
  //veri okuma
  var tfSaat =TextEditingController();
  var tfTarih =TextEditingController();
  var ulkelerListesi =<String>[];
  String secilenUlke ="türkiye";

  void initState(){
    super.initState();
    ulkelerListesi.add("türkiye");
    ulkelerListesi.add("fransa");
    ulkelerListesi.add("almanya");
    ulkelerListesi.add("ispanya");
    ulkelerListesi.add("italya");
    ulkelerListesi.add("yunanistan");
    ulkelerListesi.add("norveç");


  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets"),backgroundColor: Colors.red,),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Text(alinanVeri),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: tfController,
                decoration: InputDecoration(hintText: "veri"),
              keyboardType: TextInputType.number,
                obscureText: true, //gizleeme

              ),
            ),

            ElevatedButton(onPressed: (){
              setState(() {
                alinanVeri=tfController.text;
              });
            }, child: const Text("veriyi al")),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {

                    resimAdi ="mutlu.png";

                  });
                }, child: const Text("resim 1")),

                Image.asset("resimler/$resimAdi",fit: BoxFit.cover,),
                ElevatedButton(onPressed: (){
                  setState(() {


                    resimAdi ="star.png";

                  });
                }, child: const Text("resim 2")),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(width: 200,
                  child: SwitchListTile(
                      title:  const Text("dart"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: switchControl,
                      onChanged: (veri){
                        setState(() {
                          switchControl=veri;
                        });
                      }),
                ),
                SizedBox(width: 200,
                  child: CheckboxListTile(
                      title:  const Text("flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkboxControl,
                      onChanged: (veri){
                        setState(() {
                          checkboxControl=veri!;
                        });
                      }),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 200,
                  child: RadioListTile(
                      title:  const Text("fenerbahçe"),

                      value: 1,
                      groupValue:radioDeger,
                      onChanged: (veri){
                        setState(() {
                          radioDeger=veri!;
                        });
                      }),
                ),
                SizedBox(width: 200,
                  child: RadioListTile(
                      title:  const Text("galatasaray"),
                      value: 2,
                      groupValue: radioDeger,
                      onChanged: (veri){
                        setState(() {
                          radioDeger=veri!;
                        });
                      }),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {


                    progressControl=true;


                  });
                }, child: const Text("Başla")),
               Visibility(visible: progressControl,child: const CircularProgressIndicator()),


                ElevatedButton(onPressed: (){
                  setState(() {


                    progressControl=false;


                  });
                }, child: const Text("Dur")),
              ],
            ),
            Text(ilerleme.toInt().toString()),
            Slider(max: 100.00,min: 0.0,value: ilerleme, onChanged:(veri){
              setState(() {
               ilerleme =veri;
              });

            }),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(width: 120,
                    child: TextField(controller: tfSaat, decoration: const InputDecoration(hintText: "saat"),)),

                IconButton(onPressed: (){

                  showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                  .then((value){
                    tfSaat.text="${value!.hour} :${value.minute}";
                  });

                }, icon: const Icon(Icons.access_time)),
                SizedBox(width: 120,
                    child: TextField(controller: tfTarih, decoration: const InputDecoration(hintText: "tarih"),)),

                IconButton(onPressed: (){
                  showDatePicker(context: context,initialDate:DateTime.now(), firstDate: DateTime(2000),
                      lastDate: DateTime(2030))
        .then((value){
            tfTarih.text="${value!.day} / ${value.month}/ ${value.year}";
                  });
                }, icon: const Icon(Icons.date_range)),






              ],
            ),

            DropdownButton(
              value: secilenUlke,
                icon: const Icon(Icons.arrow_drop_down),
                items: ulkelerListesi.map((ulke){
                  return DropdownMenuItem(value: ulke,child: Text(ulke),);

                }).toList(),
                onChanged: (veri){
                setState(() {
                  secilenUlke=veri!;
                });
                }



        ),
           GestureDetector(
             
             onTap: (){
               print("containera tek tıklandı");
             },
               onDoubleTap: (){
               print("containera çift tıklandı");
               },
               onLongPress: (){
               print("containera uzun basıldı");
               },
               child: Container(width: 200,height: 500,color: Colors.red,)),
        ],
        ),
      ),
    );
  }
}
