import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';

class DefaultData {
  List<Question> _normalQuestionsList = [];
  List<Question> _partyQuestionsList = [];
  List<Question> _coupleQuestionsList = [];
  List<Question> _hotQuestionsList = [];
  List<Category> _categoriesList = [];

  List<Category> get getCategoriesList => _getCategories();
  List<Question> get getNormalQuestionsList => _getNormalQuestions();
  List<Question> get getPartyQuestionsList => _getPartyQuestions();
  List<Question> get getCoupleQuestionsList => _getCoupleQuestions();
  List<Question> get getHotQuestionsList => _getHotQuestions();

  _getNormalQuestions() {
    return _normalQuestionsList = normalQuestions.map((e) =>
        Question.fromMap(e)).toList();
  }
  _getPartyQuestions() {
    return _partyQuestionsList = partyQuestions.map((e) =>
        Question.fromMap(e)).toList();
  }
  _getHotQuestions() {
    return _hotQuestionsList = hotQuestions.map((e) =>
        Question.fromMap(e)).toList();
  }
  _getCoupleQuestions() {
    return _coupleQuestionsList = coupleQuestions.map((e) =>
        Question.fromMap(e)).toList();
  }
  _getCategories() {
    return _categoriesList = categories.map((e) => Category.fromMap(e)).toList();
  }

  final categories = [
    {
      'id': 1,
      'description': 'Normal',
      'imageRoute' : 'assets/images/smile.png'
    },
    {
      'id': 2,
      'description': 'Fiesta',
      'imageRoute' : 'assets/images/party.png'
    },
    {
      'id': 3,
      'description': 'Traviesos',
      'imageRoute' : 'assets/images/naughty.png'
    },
    {
      'id': 4,
      'description': 'Vida Amorosa',
      'imageRoute' : 'assets/images/couple.png'
    },
  ];

  final normalQuestions = [
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me senté en la ducha y lloré después de una ruptura.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he metido en una pelea a puñetazos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca se me ha caído el móvil al váter.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pasado horas viendo videos divertidos en YouTube.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he intentado comprobar cuántos caramemlos me caben en la boca.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he estado encerrado/a en una habitación.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he limpiado mi habitación metiendo todo en el armario.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he tenido miedo de los payasos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sido detenido por las autoridades.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he tenido miedo de las arañas.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he tenido diarrea en la casa de un amigo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he vestido como del sexo opuesto.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he saludado a alguien que pensaba que era otra persona.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he jugado con una tabla Ouija.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he ido a un campamento de verano.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nuunca he peleado con mi/mis hermano/s.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca envié un mensaje de texto a la persona equivocada.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he tropezado en público.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "yo nunca me he comido una caja entera de helado de golpe.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he saltado una clase.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he perdido un examen.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sido rechazado por alguien que me gusta.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he hecho trampa en un examen.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he llorado en el baño de la escuela.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he olvidado el cumpleaños de un amigo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he cantado en la ducha.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca jamás he dudado de mi orientación sexual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he contado un secreto que se suponía que debía mantener.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he creado una cuenta falsa en las redes sociales.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he puesto cara de pato al tomar una selfie.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he aprendido la coreografía de un baile K-Pop.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he usado un sostén/calzoncillos con relleno.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he usado lencería.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pasado meses sin saber o recordar el nombre de alguien con quien me llevo o llevaba bien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he fingido saber hablar otro idioma para impresionar a alguien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he nadado totalmente desnudo/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he tenido sexo en la cama de mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he tenido que llamar a la policía a alguien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he robado dinero a mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he perdido la parte de abajo de mi traje de baño mientras estaba en la playa.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he practicado hablar en público frente al espejo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he practicado hablar en público frente a mi mascota.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he fingido que un chiste me hace gracia.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sido sujeto experimental.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he jugado beer pong.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he entrado sin permiso en una casa ajena.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he deseado la muerte a alguien que está hoy aquí.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he fingido estar enviando mensajes de texto mientras hago fotos de quien tengo delante.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he hecho un piercing en una zona innombrable.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he asustado en un espejo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca tuve el sentimiento que me iba a morir.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he gastado más de 30 euros en algo que no me gustaba solo para impresionar a alguien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he usado la toalla de ducha de otra persona por accidente.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he comprado a la desesperada un regalo para mi pareja para evitar una discusión.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pasado más de cinco días sin ducharme.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pasado más de una semana sin ducharme.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido un examen a pesar de haberlo hecho mirando los apuntes todo el rato.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he llevado la ropa interior al revés durante todo un día.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he fingido encontrarme mal para no ir a una reunión familiar.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he elegido una asignatura optativa solo para ligar.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he fingido que alguien me caía mal para ocultar que me atraía.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he cortado el pelo para parecerme a un famoso o famosa.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sentido amor a primera vista.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he intentado ser vegetariano/a y fracasado en menos de un mes.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca le he arruinado el cumpleaños a alguien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he quedado muy en ridículo al intentar flirtear con alguien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he aparecido en un vídeo que se ha hecho viral.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sospechado que mi padre o mi madre tienen un amante.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he eliminado mi historial de navegación.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he dejado plantado a alguien en una cita.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he dicho que me gustaba mucho un regalo y luego lo he devuelto.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he probado una aplicación de citas.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he robado en una tienda.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he respondido \"gracias\" cuando me han dicho \"te quiero\".",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he comido las sobras de otra mesa en un restaurante.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he usado el cepillo de dientes de otra persona.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he tenido celos de mis amigos.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he salido con alguien más joven que yo.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he roto un hueso.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Nunca he rechazado un beso.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he fingido que me llamaban para escapar de una cita.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 1,
      "description": "Yo nunca me he arrepentido de un tatuaje.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he tirado un pedo y he dicho “que mal huele” para despistar.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he fingido estar enfermo para evitar ir a la escuela.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he usado ropa interior de otra persona.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he intimidado a un compañero de clase.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he vomitado durante una excursión escolar.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he conocido a alguien famoso.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he hablado con un extraño por internet.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he hecho trampa en un examen.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he fingido conocer a un extraño porque sentía que alguien me seguía.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he recolocado el calzoncillo en público.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he comido accidentalmente comida para perros.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he intentado impresionar al que me gustaba pareciendo estar informado/a.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he sido echado de un pub / club / bar.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he salvado la vida de otra persona.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he ido de un bar/restaurante sin pagar.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he tenido que ir a un juzgado.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he troleado a alguien en las redes sociales.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me había reído tanto que me hice pis en los pantalones.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he inventado un novio / novia falso.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he fingido estar enfermo para que la gente me preste atención.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he ido solo al cine.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he quedado dormido en el cine.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he perdido en la casa de alguien.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he sido sorprendido con una fiesta sorpresa.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Nunca he mentido a un amigo para evitar un mal mayor.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he quedado despierto toda la noche",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he fingido estar en un videoclip cuando salgo de la ducha mientras pongo caras intensas en el espejo.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he mirado el papel después de ir al baño.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca les he robado comida a mis hermanos o amigos cuando se levantan para ir al baño.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he usado pijama en la calle y fingí que era ropa.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he borrado una foto de una red social por no gustarme cómo salgo.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he dicho una mentira a mis amigos.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he recibido una bofetada en público.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he escuchado reggaetón en sesión privada en Spotify para que nadie me descubriera.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he tenido una época vegetariana o vegana.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he dejado caer mi móvil al WC.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he quedado paralizado en una presentación en público.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he hecho trampas en un juego de mesa.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he vomitado encima de alguien.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca le he hecho ghosting a nadie.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he llegado tarde al trabajo.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he comido algo del suelo.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he cogido dinero de mis padres sin avisar.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he robado dinero.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he sido arrestado porque me uní a una protesta.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he olido mi propia ropa interior para ver si está limpia o sucia.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca usado la misma ropa interior más de 4 días seguidos.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he hecho un simpa en una feria.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he robado dinero a mi tio/a.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he cambiado de acera al ver a alguien que no quiería saludar.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he maquillado.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he robado dinero a mi hermano/a.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he robado dinero a mis abuelos.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he roto un móvil dos semanas o menos después de comprarlo.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he metido dinero para adquirir objetos de un videojuego.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he faltado a clase por jugar a los videojuegos.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he mentido a mis padres sobre mis notas.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he sido amonestado en el instituto.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he jugado al FIFA.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he jugado al Super Mario.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he jugado Minecraft.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he visto/descargado una película pirata.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he descargado una aplicación de movíl/ordenador pirata.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he quemado la mitad del cuerpo en la playa.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he conducido borracho/a.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he viajado en el coche con alguien borracho.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he suspendido una materia del instituto/universidad con un 4.9.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he sido pillado copiando en un examen.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he hecho el Bottle-Flip Challenge",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca he hecho el Dab después de que pasó de moda.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 1,
      "description": "Yo nunca me he cagado encima.",
      "isFavourite": 0
    },

    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he preferido comer comida rápida antes de comida casera.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pensado que ducharse era una perdida de tiempo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pensado que lavarse los dientes era una perdida de tiempo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pensado he defendido a alguien de algo y finalmente resultó ser culpable.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he escapado de la guardia civil o Policía.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he superado la cantidad de alcohol permitida en un test de alcoholemia.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he escapado de un test de alcoholemia.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suplicado a mis padres para tener una mascota.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he insultado a mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he cotilleado con mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he negado a salir de casa con mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pedido comida a domicilio y finalmente no llegó.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pedido un paquete que jamás llegó.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he hecho un simpa en una entrega a domicilio.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pedido comida mas de tres veces a domicilio en un mismo día.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he estado alimentando a base de comida rápida por más de 3 días seguidos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pagado la membresía del gimnasio y acabar no yendo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he ido al gimnasio para ligar.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he acabado más de tres películas en un día.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he acabado más de una serie en un día.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he acabado más de cinco pelíulas en un día.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he negado a vacunar del COVID .",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pillado el COVID más de una vez.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pillado el COVID más de dos veces.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pillado el COVID más de tres veces.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he saltado el confinamiento.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he estado confinado.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pensado que la pandemia del COVID fue planeada.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he discutido con mis padres sobre política.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he emborrachado con mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he discutido con mis amigos sobre política.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sido mordido por mi propia mascota.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he quemado en la cocina.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he intentado escapar de casa de pequeño.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he intentado escapar de casa de mayor.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he quedado encerrado/a en un ascensor.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he quedado dormido/a en un ascensor.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he quedado dormido/a conduciendo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he quedado dormido/a bajo la lluvia.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he tropiezado por estar mirando el móvil.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he ido a Londres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he ido a Paris.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pensado que África es un país.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sentido odio hacia un país en específico.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sentido odio real hacia una persona.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he resbalado en la bañera.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he ido a una piscina pública.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he jugado a la Playstation.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he jugado a la Xbox.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he jugado a la Nintendo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he jugado a la Wii.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he discutido con alguien de Atención Cliente de un servicio(Telefonía,Internet etc...).",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he contestado mal a mi Jefe.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he encontrado con un animal salvaje.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he deseado tener un animal salvaje como mascota.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he perdido las llaves del coche.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he pagado el Premium de Spotify.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he usado la cuenta de Netflix,HBO o Prime video de alguien sin su permiso.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he cansado del anuncio de Youtube premium.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he realizado más de 2 tests de antígenos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he realizado más de 5 tests de antígenos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he realizado más de 10 tests de antígenos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he realizado más de 20 tests de antígenos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he realizado más de 50 tests de antígenos (Los que beben tienen que acabar sus vasos).",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido el examen teórico de la autoescuela.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido el examen teórico de la autoescuela más de una vez.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido el examen práctico de la autoescuela.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido el examen práctico de la autoescuela más de una vez.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido el examen práctico de la autoescuela más de tres veces.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he suspendido el examen teórico de la autoescuela más de tres veces.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he encontrado con alguien al abrir la puerta de un baño.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he golpeado una pared y me arrepiento porque era doloroso.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me había reído tanto que me oriné encima.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he vestido como del sexo opuesto.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he tirado un pedo delante de alguien que me gustaba.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he volado en primera clase.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he conducido un coche manual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he devuelto mi comida a un restaurante.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca le he mentido a mi mejor amigo sobre con quién estaba.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he estado en Disneyland.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca me he quedado dormido en clase.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he sido despedido.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he ganado la lotería.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he inventado un novio / novia falso.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he fingido que huía de los zombis meintras corría.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he mentido en algo para impresionar a mi cita.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":1,
      "description": "Yo nunca he bailado solo en la pista de baile.",
      "isFavourite": 0
    },

  ];

  //Fiesta
  final partyQuestions =
    [
      //s
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he estado de fiesta 24 horas seguidas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he robado botellas de un discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he peleado con un/a camarero/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he equivocado pidiendo una copa que no quería.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca invité a alguien a una copa de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "A mi nunca me invitaron a una copa de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tomado mas de 2 chupitos seguidos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tomado el chupito de RTVG(mezcla de Ron-Tequila-Vodka-Ginebra en el mismo chupito).",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he vomitado en la barra mientras pedia al camarero/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he comido dentro de una discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pedido una canción a DJ durante una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he sido invitado a más de 4 copas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he fingido estar sobrio de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he fingido estar ebrio de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tirado la copa a alguien de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "A mi nunca me han tirado la copa de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "A mi nunca me han robado la copa de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tirado una copa sin querer sin haberle dado ni un sorbo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tenido que volver a casa antes de lo previsto porque iba muy borracho/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he equivocado de mi grupo de amigos de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he fumado dentro de una discoteca/pub.",
        "isFavourite": 0
      },
      //e
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he bebido antes de cumplir 18.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he bebido antes de cumplir 16.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he vomitado encima por estar borracho.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pagado a un portero para dejarme entrar en la discoteca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he mentido a mis padres para salir de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he escupido en la bebida de alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he quedado dormido en el baño de una discoteca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he quedado sin dinero para el taxi por gastar mas de lo que debía de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he retirado antes de que empiece la fiesta por ir muy borracho.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he salido de fiesta sin ropa interior.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pedido alcohol a un desconocido de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he vomitado dentro de una discoteca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he quedado dormido de pie dentro de la discoteca/lugar de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he perdido de camino a casa por ir borracho.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he dado mi numero a un camarero/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pedido el numero a un camarero/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he entrado a mas de 5 locales en una noche.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he dejado a mi amigo/a tirado para ir con otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he discutido con un camarero/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he dejado mi relación de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he acabado mas de 1 botella en 1 noche de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he vomitado en el taxi de vuelta a casa después de una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he discutido con el taxista de vuelta a casa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he ido a una fiesta estando muy enfermo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he llevado a mi mascota de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he salido de fiesta el dia antes de un examen.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he ido a un examen de empate.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he vomitado en un examen por estar borracho.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he salido de fiesta el día anterior a una entrevista de trabajo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he puesto los cuernos a mi pareja por estar borracho/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he llegado a casa sin los calzados después de una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he caido de fiesta.(Los que beben tienen que contar como fue).",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he llevado un golpe por decir cosas inapropiadas estando borracho.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he jugado a girar la botella.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he dormido en la calle por estar borracho.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he entrado a una fiesta sin que me hayan invitado.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he ido borracho a la casa equivocada.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he desmayado por beber.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he bebido solo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he emborrachado para ganar confianza.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he bebido del cuerpo de alguien.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he intentado esconder un chupetón que me hicieron de fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he tenido tanta resaca que juré no volver a beber nunca más.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he estado de fiesta sin parar durante más de 72 horas.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he despertado en un lugar extraño porque iba muy borracho.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he bebido hasta perder el conocimiento.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he exagerado mis logros para intentar ligar de fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he trabajado borracho.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he gastado más de 200 euros en una noche de fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he enviado un mensaje a un ex de fiesta sin venir a cuento.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he colado en un reservado de una discoteca.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he sido echado de un reservado.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he ido de fiesta con auriculares.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he perdido las llaves del coche de fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he encontrado a mis padres mas borrachos que yo en una fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he pedido el número de teléfono a un portero de una discoteca.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "A mi nunca me ha pedido el número de teléfono un portero de una discoteca.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he llevado una petaca a un pub/discoteca.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he robado vasos de cristal/cartón de una discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he falsificado un DNI/NIE/Pasaporte para ir a una fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he estado perreando a alguien de fiesta y resulta ser alguien del sexo opuesto.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "A mi nunca me han pedido sacar los pasos prohibidos de fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he estado/visto a alguien estudiando en una discoteca/pub.(Los que beben tienen que dar contexto)",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he ofrecido droga a alguien en una fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "A mi nunca me han ofrecido droga en una fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he pillado a 2 o mas personas manteniendo relaciones sexuales en los baños de una discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he pillado a alguien masturbándose en los baños de una discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he cantado borracho en un karaoke.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he tirado la bebida encima de alguien de fiesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "A mi nunca me han puesto la copa con la bebida que quiero en una discoteca sin que yo dijera nada.",
        "isFavourite": 0
      },
      //s
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he discutido sobre política de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he bebido mas de 3 tipos de bebidas distintas en una noche.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he ido a una fiesta ilegal durante la pandemia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he salido de fiesta sin mascarilla cuando era obligatorio.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he liado con alguien de fiesta sabiendo que tiene el COVID.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he contagiado del COVID en una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he decidido no ir a una fiesta porque también iba mi ex-pareja.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he buscado una pelea de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "A mi nunca me han tocado el culo de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he bebido un agua entre cada copa para no tener resaca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he discutido con un DJ de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca le he tirado la mesa a un DJ(queriendo o sin querer).",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he invitado a un/a camarero/a a una copa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he invitado a un/a camarero/a a un chupito.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pagado la ronda a todos en un bar/discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca me he quedado dormido en la barra de una discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he perdido la cartera de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he perdido las llaves de casa en una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tenido que llevar todos los amigos casa porque iban borrachos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he tenido que llevar un amigo/a a casa porque iba borracho/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he salido de fiesta sin beber alcohol.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he intentado salir de fiesta sin beber.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pretendido conocer a un/a borracho/a para hablar con el/ella.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he pretendido conocer al dueño de una discoteca/pub para intimidar al portero.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he perdido mi entrada a una discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he perdido mi abrigo o chaqueta de fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he llegado a casa sin los calzados después de una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he llegado a casa sin la ropa interior después de una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":2,
        "description": "Yo nunca he invitado a mis padres a una copa en una discoteca/pub.",
        "isFavourite": 0
      },
      //e
    ];

  //Traviesos
  final hotQuestions =
    [
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he follado en los baños de una discoteca/pub",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he vuelto con mi ex.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Nunca he tenido una relación abierta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he sido infiel.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he dudado de mi orientación sexual.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he accidentado al tratar de impresionar un chico o una chica que me gustara.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he practicado cómo besar usando mi almohada.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he ido a un club de striptease.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he discutido mientras mantenía relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he besado con el hermano\\a mayor de un amigo\\a.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he despertado con alguien comiéndome.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he sido esposado.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he acostado con gemelos idénticos.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he probado el fisting.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he practicado sexo anal.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido doble penetración.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he sido preguntado por mis padres si era virgen.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado que mi pareja me domine cuando me acuesto con el.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo con más de tres personas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido a mi pareja atascada dentro de mi.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo en un probador.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo estando con el periodo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo en público.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo con más de cuatro personas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo en una biblioteca.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he azotado a una persona mayor que yo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he usado un juguete sexual con otra persona.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido una llamada erótica.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he acostado con mi jefe para ascender.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo en la cama de un amigo y no se lo he dicho.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo con más de dos personas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tragado semen.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he pillado a un amigo teniendo sexo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido o dado un trabajito con los pies.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he llevado un botón anal y he salido a la calle.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he acostado con alguien por venganza.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo con más de tres personas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo con más de una persona en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido dinero por matener relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo con un stripper.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado usando una fruta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un orgasmo vaginal.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho un cuarteto con otros tres hombres.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido un trabajito con la mano.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tirado fichas al novio\\a de un amigo\\a.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tirado fichas al novio de un amigo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he sentido atraído por alguien del mismo sexo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Nunca me he hecho fotos en ropa interior.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido una fantasía erótica con alguien de la escuela.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he sentido atraído por alguien de este grupo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he fantaseado con mi mejor amigo\\a.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he mantenido relaciones con alguien 10 años mayor que yo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he sido pillado masturbándome.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he besado con un familiar.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he enredado con una persona del trabajo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he despertado desnudo(a) en casa ajena.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he fingido un orgasmo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he fantaseado con alguien que está hoy aquí.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo en el lugar de trabajo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he participado en una orgía.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca le he hecho un baile erótico a alguien.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he mantenido relaciones con alguien 5 años mayor que yo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tomado la pastilla del día después.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he pasado más de seis meses sin tener sexo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho una cobra (o me la han hecho).",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he sentido atraído por el padre o la madre de un amigo.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca me he acostado con alguien en la primera cita.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho sin haber querido.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con mas de una persona en un mismo dia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido tirarme a la madre/padre de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido tirarme al hermano/a de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he querido liar con alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido fantasias sexuales sobre alguien que no considerase atractivo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho a pelo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he acabado en la boca de alguien/ me han acabado en la boca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido tirarme al novio/a de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han pedido que fuese mas lento porque iba demasiado rapido.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado con las ganas a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han dejado con las ganas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido la tipica discusion de \"luces encendidas/ apagadas\".",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he encontrado un pelo en la boca tras hacer oral.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he puesto los cuernos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han puesto los cuernos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dudado de mi orientación sexual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con dos personas de distinto sexo en una noche.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien y me he arrepentido inmediatamente después.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo por pena.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he tirado a mi ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han pillado en el acto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en un lugar publico.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en la cama de una tercera persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con mas gente al rededor.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho un trio.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido fantasias sexuales sobre hacer un trio con mi novio/a y otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado con un objeto inanimado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he hecho daño a mi mismo al masturbarme.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he decepcionado al liarme/tirarme a alguien con quien tenia muchas ganas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he practicado sadomasoquismo o usado objetos relacionados.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he arrepentido mientras me estaba liando con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he intentado anal pero no salio bien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he practicado anal por placer.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a alguien que tenia menos años que yo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho algo sexual en el colegio/universidad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han hecho un chupeton en un lugar poco comun.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he intentado emborrachar a alguien para liarme con esa persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he visto porno con otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he grabado con alguien en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado con una pelicula que no fuese pornografica.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un gatillazo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con la regla.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he querido liar con mas de personas presentes.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho disfrazado para satisfacer algun morbo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con el chico/a con quien estaba intentando ligar un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me lo he tragado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he excitado en un momento muy poco apropiado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca se me ha roto el condon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado un año sin sexo tras haberlo hecho previamente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he puesto/a mi nunca me han puesto un condon con la boca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he involucrado comida en el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he tomado/he comprado la pastilla del dia después.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo por teléfono.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que correr a buscar mi ropa porque acababan de tocar el timbre de la casa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he parado de liarme/tirarme a alguien para preguntarle a la persona como se llamaba.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a el/la ex de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que enseñar/a mi nunca me han tenido que enseñar como desabrochar un sujetador.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido una fantasia sexual sobre un profesor/profesora.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pillado a mis padres haciendolo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he sacado fotos desnudo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he llamado a alguien por un nombre equivocado mientras lo estabamos haciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han lamido el culo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en la ducha.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado el kamasutra para aprender o involucrar nuevas posiciones en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con alguien que era virgen.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca haría un trio con mi hermano/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he mentido sobre ser virgen.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho un trio con mi hermano/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho un trio con mi mejor amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he haría un trio con mi hermano/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/ tirado a alguien que no me parecia atractivo/a solo porque estaba desesperado/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he creido haber contraido una enfermedad de transmision sexual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he exagerado un orgasmo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un follamigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he salido de casa sin ropa interior.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a un extranjero/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sentido envidia al ver los genitales de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sentido envidia al ver los genitales de mi hermano/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado en casa de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho/a mi nunca me han hecho una mamada con condon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado hielo en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado un helado en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pedido que satisfacieran un fetiche mio pero sin exito.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he intentado esconder una ereccion en publico sin exito.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto la violencia en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he tirado/se han tirado un pedo en el acto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que mear en el acto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he roto la ropa interior a alguien al quitarsela.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho/me han hecho una cubana.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado viendo hentai.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he aceptado hacer algo sexual por dinero.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he metido/me han metido mas de dos dedos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en un coche y sono la bocina.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han tenido que enseñar una foto de con quien me habia liado porque no me acordaba.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he depilado los genitales pensando que iba a pinchar y acabe comiendome los mocos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido unirme a dos amigos que estuviesen haciendolo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho una lista de todas los tios/tias con las que me he liado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he conseguido liarme/tirarme a un amor platonico.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que usar mas de condones en una misma ronda.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en todos los cuartos de mi/su casa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pedido por Chatroulette/Omegle que me enseñen el pene/las tetas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que usar paginas online o aplicaciones para ligar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he dado cuenta de que me estaban mirando mientras lo estaba haciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a alguien que me cayera mal.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca se me han/yo nunca he acabado encima del cuerpo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han dado una hostia por estar tirando la caña.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he arrepentido de con quien habia perdido la virginidad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que acababa de vomitar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto alguien sin saber en su momento que esa persona tenia menos años que yo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he salido con alguien con quien sabia que no iba a estar mucho tiempo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he medido el pene.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con mis/sus padres cerca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he ligado con alguien para poner celoso/a a una persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he resbalado mientras lo hacia en la ducha.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he dicho a alguien \"te quiero\" solo para follar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho/a mi nunca me han hecho sangrar al meter dedos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he echado un polvo malisimo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado al menos veces en un dia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un sueño mojado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado que el sexo oral era asqueroso.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado que el sexo oral es mejor que la penetracion.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en otra persona mientras estaba haciendolo con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con alguien que en mi opinion tenia el pene pequeño.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado condones con sabores.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca se me han acabado dentro sin condon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he guardado las fotos de mi ex desnudo/a después de haber cortado con el/ella.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado/nunca han usado conmigo la marcha atras como metodo anticonceptivo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que tenia novio/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha tirado la caña un familiar de mi novio/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he mandado a la friendzone a alguien tras haberme liado con esa persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he alegrado por algo malo que le haya pasado a mi ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho mas de 3 veces en un dia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien de mi actual clase.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han hecho una cobra de verdad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho mas de 5 veces en un dia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha dado mas morbo hacerlo fuera de casa que dentro.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he quedado dormido/a durante el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he pillado por alguien mientras tenia novio/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he cortado con un novio/a porque el sexo no me satisfacia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he roto la cama al hacerlo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han llamado la atencion los vecinos por hacer demasiado ruido durante el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han agarrado del pelo con fuerza en el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he aguantado menos de 2 minutos en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado viendo porno por mas de 1 hora.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he estado masturbando por mas de de 1 hora.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he estado masturbando por mas de de 2 horas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho 2 o mas veces seguidas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han despertado con una mamada/polvo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado mientras hacia una videollamada con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he creado una cuenta falsa en alguna red social para ver lo que hacia un/a ex sin que se diese cuenta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he conseguido liarme o salir con alguien con quien estaba previamente en la friendzone.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han pillado un chupeton mis padres.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he deseado una sugar-mommy o un sugar-daddy.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca tendria una relacion con alguien presente si se diese el caso.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he visto porno de hermanastros/padrastros/madrastas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han hecho garganta profunda.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he utilizado una app de sugar-mommies/daddies",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he sentido mal conmigo mismo tras tocarme.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he seguido el rollo a alguien que me estaba tirando porque me daba pena.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he fingido ser de otra nacionalidad para ligar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo interracial.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado frustrado porque no me satisfacia el sexo con una persona a quien queria.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado en grupo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he obsesionado entera o parcialmente con alguien tras liarme con esa persona una vez.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he lamido unos pezones.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han lamido los pezones.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado en la friendzone con alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he cortado con alguien para salir con otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Nunca han cortado conmigo para salir con otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho estando enfermo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido tirar/tirado a mi mejor amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he preferido los culos a las tetas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido pique con el novio/a de mi ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he soñado que me liaba/tiraba a alguien y me he decepcionado al despertarme.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que tenia muy mal aliento.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han hecho daño al practicar sexo oral.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido la paranoia de estar embarazada porque se me habia retrasado la regla.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han hecho una mamada conduciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he seguido el rollo a alguien que me estaba tirando solo para conseguir alcohol.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he visto un juguete sexual y he sentido intriga.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un sueño sexual sobre alguien presente/de la clase.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sentido intriga por practicar sexo oral con alguien de mi mismo sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado que el sexo entre mismo sexo es o seria mejor que el sexo entre distintos sexos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sentido atraccion por algun familiar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he chupado un pene/coño que supiera muy mal.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha interrumpido mi mascota mientras estaba haciendolo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he equivocado de agujero.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado justo antes de hacerlo para durar mas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado un video porno como modelo a seguir.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he vestido de cierta forma para atraer la atencion de alguien y paso de mi.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he alquilado una habitacion de hotel o motel solo para follar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca haria un trio con gente aqui presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido ganas de ver follar a alguno de los presentes.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he jugado a algun juego con el castigo de hacer un striptease.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que besase realmente mal.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado el movil mientras lo estaba haciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho manteniendo contacto visual con la otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha tirado para atras ver cuanto pelo pubico tenia la persona con la que lo iba a hacer.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he reido mientras lo estaba haciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tirado la caña de broma y acabo saliendo mejor de lo que esperaba.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado al mejor amigo/a de mi ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he hecho fotos sensuales desnudo/a para enviarselas a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he hecho fotos desnudo para enviarselas a un familiar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he creido que alguien presente me ha tirado la caña alguna vez.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que ha querido tener algo conmigo después sin que yo quisiera.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a alguien que no he vuelto a ver en mi vida.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he imaginado como serian las tetas/el pene de alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me habria tirado a alguien de clase principio de curso pero ahora me da asco.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho/provocado squirting.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han ocasionado moratones o arañazos en el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han dado un pollazo en la cara.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han tirado la caña para conseguir alcohol.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con musica de fondo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en la lluvia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a alguien que estaba muy por encima de mis posibilidades.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido una cita de donde creia que podia surgir algo y acabe decepcionandome.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han intentado emborrachar para liarse conmigo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he mentido sobre mi mismo para ligar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho estando borracho/fumado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he robado condones a un familiar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he llevado condones pensando que iba a pinchar y acabe dandoselos a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he jugado a roles en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado saliva como lubricante.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado tres o mas veces con alguien con quien no tenia nada.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he negado haberme liado con alguien pese a ser verdad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con mas de 40 personas en toda mi vida.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con mas de 50 personas en toda mi vida.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dormido en la misma cama con alguien del sexo opuesto sin que pasara nada.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con mas de 10 personas en toda mi vida.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con mas de 20 personas en toda mi vida.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he chantajeado a alguien con contar un secreto suyo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he enterado de cuernos a un amigo/a y lo he ocultado por alguna razon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con mas de 30 personas en toda mi vida.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado mas de un mes sin masturbarme.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pasado de los preliminares y he ido directo/a al sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he quedado en los preliminares porque no me apetecia el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado un polvo a mitad por cualquier razon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he asustado al ver el tamaño del pene de alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien justo después de vomitar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me corrido antes de meterlo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he dado cuenta de que me estaban mirando mientras meaba.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido arcadas al hacer oral.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto alguien que no considerase atractivo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han hecho una mamada bajo el agua.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he rechazado a un/una ex que queria volver a liarse conmigo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en otro pais.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado con una foto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en una vieja o un animal mientras lo hacia para durar mas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he deseado a un viejo o una vieja.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he comprado algo en un sex shop.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han retado a liarme con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado pensando en alguien que no fuese mi pareja en ese momento.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a alguien a quien le tenia ganas mientras tenia novio/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho sin quitarme la mayoria de la ropa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado enamorado de 2 personas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado enamorado de mas de 3 personas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un/una ex que se cambio de acera después de dejarlo conmigo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he hecho la cobra a alguien que me habia rechazado previamente por venganza.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he puesto cachondo/a a alguien con un simple susurro al oido.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho justo después de discutir para reconciliarnos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca volveria con un/una ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me volveria a liar con alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en solo una posicion todo el rato.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he subido un video a una página de videos porno.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he acabado encima de mi propio cuerpo sin querer.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han puesto tanto que me han hecho temblar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he probado mi propia corrida sin querer.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca se me ha dormido una parte del cuerpo mientras lo hacia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he probado mi propia corrida por curiosidad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca se me ha perdido algo dentro de alguien/de mi mismo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que parar para preguntar si iba todo bien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han propuesto un trio seriamente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he negado a masturbarme.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he excitado/empalmado cuando me han perreado en una fiesta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han usado para poner celoso/a a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado en la cama con alguien del sexo opuesto pero solo hubo besos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he rascado los genitales en publico y me han visto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con los calcetines puestos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con los ojos cerrados.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he negado a hacerle oral a alguien que me lo habia pedido.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con un chico mas bajito/una chica mas alta que yo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con gafas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien con quien no deberia haberlo hecho por ir borracho/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido complejo sobre alguna parte de mi cuerpo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho justo antes de dormirme y al despertarme.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha tirado la caña alguien pensando que era de otra orientacion sexual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he aceptado hacer/que me hicieran algo que no queria solo para follar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho que alguien hiciera algo que no queria con el sexo como recompensa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido fotos de alguien desnudo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he estado mirando las tetas a una chica y me ha pillado de pleno.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he estado mirando el culo a un/una tio/tia y me ha pillado de pleno.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto mas hacerlo sin condon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he acabado y he continuado sin parar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido tirarme al hermano/a de mi pareja o de un/a ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado un mancha en la ropa o en la cama después de follar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sido dominante en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado en una ducha que no fuese la mia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he contado a alguien que habia follado inmediatamente después de hacerlo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en una bañera.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en el suelo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho encima de un techo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho encima de un arbol.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con persona mirando.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han visto haciendo cualquier cosa sexual en el cine.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido sexo esta ultima semana.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado hoy.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sudado mucho/bastante durante el sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he buscado consejos sexuales en internet.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha gustado mas estar debajo que encima.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha gustado mas estar encima que debajo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he salido con alguien a quien no queria.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido un amigo/a que se ha liado con mi ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha hecho una cobra alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he hecho una cobra a alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado en otro pais.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien solo porque un amigo/a me ayudo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en hacer un trio con 2 de los presentes.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca pense que podria tener algo con alguien presente/de mi actual clase sin darme cuenta de que no le atraia para nada.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado con amigo/as en casa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado pensando en alguien menor que yo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tonteado/ligado con alguien con quien no tenia ningun interes en quedar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he pillado por alguien con quien no podria tener nada por su orientacion sexual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado que alguien presente podia ser una fiera en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he vuelto con un/una ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/he salido con alguien con quien habia previamente negado que tendria algo jamas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he arrepentido de liarme con/pillarme por alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he puesto la ropa interior de alguien del sexo opuesto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he acabado al mismo tiempo que la persona con quien lo estaba haciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en una cama individual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he estado en una playa nudista.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he empalmado/exitado en una playa nudista.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado lubricante de sabores.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado que alguien usara un juguete sexual conmigo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto hacer oral.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha oido haciendolo un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he oido a un amigo/a haciendolo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado manchas en la pared.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he mirado en el espejo mientras lo estaba haciendo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he negado a hacerlo con mi pareja pese a que me lo suplicara.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca les he contado a mis padres que perdi la virginidad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dicho que no podia ir a alguna quedada por quedarme follando.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sido sumiso/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en operarme las tetas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en operarme el culo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca se me ha salido en pleno acto y me he hecho daño.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he hecho algo que previamente pense que nunca haria.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he/a mi nunca me han hecho el hamster.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he perdido la virginidad con 15 años o menos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en operarme el pene",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he desvirgado a alguien menor de años.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he rendido poco en algun deporte porque acababa de hacerlo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he puesto el condon al reves.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he usado lubricantes con efectos de calor o frio.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he jugado el juego de la galleta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he puesto un condon que me fuera incomodamente pequeño o apretado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado con un condon puesto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con los ojos tapados por algo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he perdido el equilibrio mientras lo hacia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he caido meintras lo hacía de pie.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado que alguien presente podria salir del armario.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca estuve a punto de liarme con alguien hasta que otra persona me interrumpio.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he entrado en un puticlub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he querido entrar en un puticlub pero por una razon u otra no lo hice.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he enviado/recibido fotos desnudas por accidente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto mas hacerlo con los padres cerca.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha puesto un/a repartidor/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que asegurarme de hacerlo en silencio para que no nos oyeran los padres.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he sido incapaz de recrear una posicion de kamasutra.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado o tenido algo con alguien para olvidarme de otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha tirado la caña un familiar de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he empezado a salir con alguien menos de un mes después de dejarlo con mi ex.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que estaba minimo de rollo con un amigo/a mio.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he descubierto ser el amor platonico o similar de alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido agujetas después del sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado/tirado a alguien en otro pais.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he liado con alguien que no era mi objetivo en aquel momento.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he dejado una paja a mitad por cualquier razon.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca haria un trio con una persona de distinto sexo y otra de mi mismo sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he pensado en crear una cuenta de Tinder.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca he tenido que parar porque el sexo era demasiado intenso.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha pillado algun familiar mio/de mi pareja un condon usado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca me he masturbado con una conversacion de texto con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me ha tirado la caña la pareja de un amigo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con un chico circumcidado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "A mi nunca me han tirado la caña sin que me enterara.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca le he seguido el rollo a un profesor/a que me estuviese tirando.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en los baños del instituto/universidad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he arrepentido de haberme acostado con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he creido que el tamaño importa.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he cumplido mis fantasías en la cama.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he estado exitado/a con alguien de mi familia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he practicado sexting.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca lo he hecho en el bus.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he querido estar atado.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he estado en una relación abierta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he hecho daño con un juguete sexual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me atrevería a quedarme en ropa interior en público.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca lo he hecho en la montaña.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he olido la ropa interior de otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pensado en recrear una escena de sexo de una pelicula con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca lo he hecho en el coche con lluvia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca lo he hecho en el coche.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca lo he hecho en la nieve.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he visto a alguien desnudo de forma accidental.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca lo he hecho en la lluvia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he enamorado de alguien de mi mismo sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca estaría con alguien mayor que yo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca estaría con alguien mas joven que yo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca le he puesto un nombre a mis partes intimas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca besaría con alguno de mis exs.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he sufrido una lesión meintras mantenia relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me disfrazaría para hacerlo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he tocado en la universidad o en el trabajo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he usado una aplicación de citas.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pasado mas de seis meses sin tener sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca pensado que un personaje de dibujos animados fuera atractivo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he criticado al novio/novia de un ex en las redes sociales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he visto una película porno entera.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he acostado con alguien que me dobla la edad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he fingido tener novio o novia.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he mentido sobre cuanto mido para ligar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he viajado a otro país solo para tener sexo con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he masturbado al aire libre.",
        "isFavourite": 0

      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido cibersexo a traves de la webcam.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he participado en una orgía.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he tocado justo al despertarme por la mañana.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he liado con alguien en los baños de la uni/oficina.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he/a mi nunca me han metido los dedos en la discoteca/pub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he utilizado la vaselina como lubricante.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he mentido en esta sesión de juego para parecer guay.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he fantaseado con un/a famoso/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he utilizado la comida como juguete sexual.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pagado para mantener relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he ofrecido dinero a cambio de mantener relaciones sexuales con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he intentado tirar a alguien sabiendo que tiene pareja.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho en un campo de fútbol.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca lo he hecho con dos preservativos a la vez.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he roto un preservativo a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he puesto un cronometro para ver cuánto duro.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he grabado a otras personas manteniendo relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido más de una polla en la boca a la vez.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he negado a tener relaciones sexuales con otra persona porque esa persona no estaba depilado/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he ido a un puticlub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he negado a tener relaciones sexuales con otra persona por no estar depilado/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he corrido en el pelo de alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "A mi nunca me han corrido en el pelo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "A mi nunca me han escupido manteniendo relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he escupido a alguien manteniendo relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "A mi nunca me han puesto cachondo los pies de alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "A mi nunca me han puesto cachondo los pies de alguien presente.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he vomitado mientras me estaba liando con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he vomitado mientras hacía el oral a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he cagado en el pecho a alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "A mi nunca me ha puesto que me chupen los pies.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he creado una cuenta en una página porno.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pagado la suscripción Premium de Pornhub.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pagado la suscripción Premium de cualquier página porno.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pensado en crear un Onlyfans.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he pagado una suscripción en Onlyfans.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca rechazaría a algunos de los presentes aunque me ofrecieran 1 millón de euros.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "A mi nunca me ha entrado el hambre manteniendo relaciones sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he aburrido estando en el acto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he llamado un número sin querer estando en el acto.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he llamado a mi ex estando en el acto para darle celos.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he ajustado mis botones en función de quién está en la habitación.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido una aventura de una noche y me quedé a desayunar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido una aventura de una noche y me quedé hasta la hora de cenar.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he mentido para proteger a un amigo infiel.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he mentido sobre mi virginidad.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he echado a alguien después de tener sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he echo daño mientras me masturbaba a mi mismo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he mirado en Google los efectos adversos de masturbarte.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he reído al ver los genitales de otra persona.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he hecho favores a cambio de sexo.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he subido la falda para hacerla más corta.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he usado ropa interior comestible.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he ido a una fiesta para enrollarme con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido dificultad para encontrar el punto g.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he sentido vergüenza después de acostarme con alguien.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido sexo en una boda.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido un orgasmo anal.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he perdido algo en uno de mis orificios.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tomado viagra.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he tenido más de 10 parejas sexuales.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he metido el pene en una aspiradora.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he hecho un cuarteto con otros tres hombres.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca le he mirado el culo a un extraño.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he hablado y dado mimos con alguien toda la noche.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca me he liado con mi primo/a.",
        "isFavourite": 0
      },
      {
        "id" : 0,
        "categoryId":3,
        "description": "Yo nunca he utilizado un preservativo femenino.",
        "isFavourite": 0
      },

    ];

  final coupleQuestions = [
    {
      "id": 0,
      "categoryId": 4,
      "description": "Yo nunca he mentido diciendo que me gustaba lo que había cocinado mi pareja.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 4,
      "description": "Yo nunca he tenido una pelea de pareja en público.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 4,
      "description": "Yo nunca he cotilleado a quién daba like mi pareja o exparejas.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 4,
      "description": "Yo nunca he preferido no estar con mi pareja.",
      "isFavourite": 0
    },
    {
      "id": 0,
      "categoryId": 4,
      "description": "Yo nunca he mirado el teléfono de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he borrado conversaciones subidas de tono para que mi pareja no me pillase.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca le he roto la ropa a mi pareja al quitarsela.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he pensado que me casaria con un ex o pareja actual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca le he hecho un baile sensual a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca me he encarado con alguien que estuviese mirando o molestando a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he estado un mes sin hacerlo teniendo pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he archivado un chat porque no queria que mi pareja lo viera pero tampoco queria borrarlo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca me he puesto celoso al ver a mi pareja hablar con su ex.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he tenido envidia de la pareja de un amigo/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he intentado/querido que una pareja rompiese.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he tenido menos apetito sexual que mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca he tenido mas apetito sexual que mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca lo he hecho en una posicion que no me gustara solo porque mi pareja queria.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId": 4,
      "description": "Yo nunca le he mentido sobre mis experiencias sexuales a mi nueva pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he pillado de otra persona mientras tenia pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he pillado de otra persona mientras tenia pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pillado a mi pareja masturbandose.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he sentido vergüenza alguna vez con mi pareja en público. (Los que beben tienen que contar el motivo)",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he puesto alguna ropa de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he tenido que separar a mi pareja en una pelea.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he sugerido un trio a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he visto pornografía con mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he participado en una orgía con mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he negado a visitar a mis suegros.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he sido rechazado por mis suegros.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he discutido con mis suegros.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he llegado tarde a una comida/cena con mis suegros.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "A mi nunca me ha puesto mi suegro/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pillado a mis suegros manteniendo relaciones sexuales.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he viajado a otro continente con mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he viajado a otro país con mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he tenido que llevar mi pareja a casa porque estaba demasiado borracho/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he visto a mi pareja rechazar a otra persona.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he deseado no estar con mi pareja/ex-pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he regalado un anillo a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pensado que el precio del anillo regalado por mi pareja importa.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he planteado dejar a mi pareja por una pequeña discusión.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pensado que la relación duraría poco con mi ex o pareja actual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he imaginado a mi pareja manteniendo relaciones con otra persona.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he sentido inseguro al ver al ex de mi pareja/ex-pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca haría un trio con mi pareja y ex pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he fingido no conocer a mi pareja en público.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he negado a dormir con mi pareja por una discusión.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he llevado un susto porque pensaba que mi novia estaba embarazada.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he planteado tener hijos con mi pareja/ex-pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "A mi nunca me ha puesto el hermano/a de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he peleado con el hermano/a de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca tendría un trío con mi pareja y su hermano/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he fallado en el NNN(No-Nut-November) por culpa de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he mudado a otro país o ciudad para estar con mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he cotilleado con mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he querido ver a mi pareja con la cabeza rapada.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he intentado convencer a mi paraja para hacer algo que él/ella no quería hacer.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pasado mas de un día sin hablar con mi pareja/ex-pareja por una discusión.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pasado mas de 3 días sin hablar con mi pareja/ex-pareja por una discusión.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pasado mas de 1 semana sin hablar con mi pareja/ex-pareja por una discusión.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he hecho un baile sensual a mi pareja para seducirle/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pensado que mi pareja/ex-pareja me odiaba.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he desconfiado en mi pareja/ex-pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he preguntado a mi pareja sobre sus relaciones anteriores.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he llevado bien con algún ex de mi pareja actual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca trabajaría en la misma empresa que mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca trabajaría en la misma empresa que mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he arrepentido de haber presentado mi pareja a mis padres.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he estado nervioso al estar con mis suegros.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he metido a mis ex-parejas en un grupo de whatsapp o cualquier red social para decirles algo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he confrontado al ex de mi pareja actual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "A mi nunca me han preguntado si mi pareja era mi padre/madre.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "A mi nunca me han preguntado si mi pareja era mi abuelo/a.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he conocido a mi pareja por Tinder.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pillado a mi pareja viendo pornografía.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca tuve una pareja que estaba obsesionado con los videojuegos.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca tuve una pareja que estaba obsesionado con el fútbol o cualquier otro deporte/actividad",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he recibido flores de alguien con quien estoy saliendo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he intentado robar las contraseñas de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he arrepentido de haber salido con alguien.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he tenido deseos sexuales que no comentaría a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he tirado un pedo delante de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca me he hecho el mismo tatuaje con mi novia/ novio.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he intentado robarle la pareja a otra persona.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca le he regalado flores a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pensado que he encontrado el amor de mi vida.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca le he hecho un masaje a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he intentado de impresionar a los padres de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he olido la ropa de mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he roto algunas de las reglas de la relación con mi ex o pareja actual.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he fingido dolores de cabeza u otras dolencias físicas porque no tenía ganas de tener sexo.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he tenido mal de amores.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he devuelto un regalo de mi ex después de la ruptura.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he comprado la colonia de mi ex pareja solo para acordarme de como olía.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he discutido con mi pareja delante de mis suegros.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he fingido estar embarazada para asustar a mi pareja.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he tenido un mejor amigo que no fuera mi novio.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he tenido una mejor amiga que no fuera mi novia.",
      "isFavourite": 0
    },
    {
      "id" : 0,
      "categoryId":4,
      "description": "Yo nunca he pensado en como sería tener una familia con mi pareja.",
      "isFavourite": 0
    },
  ];
}
