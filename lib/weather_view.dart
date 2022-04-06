import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting/network/dio_helper.dart';
import 'package:sorting/provider/provider_notifer.dart';

import 'model/weather_model.dart';

class WeatherView extends StatelessWidget {
  final TextEditingController _weatherController = TextEditingController()
    ..text = 'amman';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                  controller: _weatherController,
                  validator: (value) {
                    return value!.isNotEmpty ? null : 'city can not be empty';
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(color: Colors.teal,),
              const SizedBox(
                height: 30,
              ),
              if (context.watch<LoginProvider>().weatherModel != null)
                Text(
                    '${context.watch<LoginProvider>().weatherModel!.weather![0].description}'),
              if (context.watch<LoginProvider>().weatherModel != null)
                Container(
                    child: Image.network(
                        'https://openweathermap.org/img/wn/${context.watch<LoginProvider>().weatherModel!.weather![0].icon}@2x.png')),
              if (context.watch<LoginProvider>().weatherModel != null)
                Text(
                  ' ${context.watch<LoginProvider>().weatherModel!.name}  \n ${context.watch<LoginProvider>().weatherModel!.main!.temp}°C',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () => Provider.of<LoginProvider>(context, listen: false)
            .getWeatherInfo(context, _weatherController.text),
        label: const Text(
          'get weather',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.cloud),
      ),
    );
  }
}
