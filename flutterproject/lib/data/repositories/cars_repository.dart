import 'dart:convert';

import '../../models/car.dart';

import '../data_providers/cars_data_provider.dart';

class CarsRepository {
  final CarsDataProvider _carsDataProvider;

  CarsRepository(this._carsDataProvider);

  Future<List<Car>> getCars() async {
    final response = await _carsDataProvider.getCars();
    final cars = jsonDecode(response);
    final allCars = <Car>[];
    for (final car in cars){
      allCars.add(Car.fromJson(car));
    }
    return allCars;
  }

  Future<Car> getCar(int id) async {
    final response = await _carsDataProvider.getCarById(id.toString());
    final car = jsonDecode(response);
    return Car.fromJson(car);
  }

  Future getCarsByGenre(String genre) {
    return _carsDataProvider.getCarsByGenre(genre);
  }

  Future<void> createCar(Car car, String token) async {
    await _carsDataProvider.addCar({
      'title': car.title,
      'description': car.description,
      'genre': car.genre,
      'platform': car.platform,
      'publisher': car.publisher,
      'releaseDate': car.releaseDate,
      'imageUrl': car.imageUrl,
    }, token);
  }

  Future<void> updateCar(Car car, String token) async {
    await _carsDataProvider.updateCar({
      'id': car.id,
      'title': car.title,
      'description': car.description,
      'genre': car.genre,
      'platform': car.platform,
      'publisher': car.publisher,
      'releaseDate': car.releaseDate,
      'imageUrl': car.imageUrl,
    }, token);
  }

  Future<void> deleteCar(int id, String token) async {
    await _carsDataProvider.deleteCar(id.toString(), token);
  }
}
