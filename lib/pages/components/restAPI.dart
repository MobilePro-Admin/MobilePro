import 'package:flutter/material.dart';
import 'package:untitled2/pages/components/placesModel.dart';

class RESTAPI {
  List<PlaceModel> dummyAllPlaces = [
    PlaceModel(
        name: "Leticia",
        description:
        "Es la capital del departamento y se encuentra a hora y media de Bogotá por vía aérea. Leticia es una ciudad muy visitada por los turistas, quienes fascinados por la exótica cultura amazónica llegan a ella desde diferentes lugares del mundo.",
        image: "assets/images/leticia.jpg",
        rateperpackage: 400.0,
        rating: 3.8),
    PlaceModel(
        name: "Lago Tarapoto",
        description:
        "Ubicado a 80 kilómetros de Leticia, cerca de hora y media de recorrido por el río Amazonas, encontramos el Lago Tarapoto, cuna de los símbolos de la región amazónica. Los delfines rosados y el loto gigante Victoria Regia.",
        image: "assets/images/lagotarapoto.jpg",
        rateperpackage: 350.0,
        rating: 5.0),
    PlaceModel(
        name: "Parque Amacayacú",
        description:
        "En el extremo sur del departamento del Amazonas, Amacayacu ofrece al visitante un espacio de recreación, esparcimiento y conocimiento no sólo de la belleza y diversidad de la selva, sino de su gente y la cultura de los grupos humanos que habitan allí.",
        image: "assets/images/parqueamacayacu.jpg",
        rateperpackage: 350.0,
        rating: 4.2),
    PlaceModel(
        name: "Reserva Natural Marasha",
        description:
        "La Reserva Natural Marasha en el Amazonas, ofrece a sus visitantes una variedad de actividades que van desde la pesca deportiva, caminatas por la selva, el viaje en canoa, o la caimaneada nocturna.",
        image: "assets/images/marasha.jpg",
        rateperpackage: 350.0,
        rating: 3.2),
    PlaceModel(
        name: "Santa Sofía o Isla de los Micos",
        description:
        "El corregimiento de Santa Sofía, también conocido como Isla de los Micos, es uno de los atractivos turísticos más visitados en el Amazonas colombiano. Se encuentra ubicado al norte de Leticia y para llegar hasta allí se debe viajar en lancha por cerca de una hora.",
        image: "assets/images/isladelosmicos.jpg",
        rateperpackage: 350.0,
        rating: 4.9),
  ];

  Future<List<PlaceModel>> getAllPlaces() async {
    await Future.delayed(Duration(milliseconds: 900));
    return dummyAllPlaces;
  }
}
