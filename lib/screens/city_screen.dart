import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.green,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none
                      ),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.green,
                        size: 50.0,
                      )
                    ),
                    onChanged: (value){
                      cityName = value;
                    },
                  ),
                ),
              ),
              TextButton(
                child: Text("Get weather", style: TextStyle(fontSize: 30.0, color: Colors.green),),
                onPressed: (){
                  Navigator.pop(context, cityName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
