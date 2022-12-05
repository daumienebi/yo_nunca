import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';

class DefaultData {
  List<Question> _normalQuestionsList = [];
  List<Question> _intermediateQuestionsList = [];
  List<Question> _hotQuestionsList = [];
  List<Category> _categoriesList = [];

  List<Category> get getCategoriesList => _getCategories();
  List<Question> get getNormalQuestionsList => _getNormalQuestions();
  List<Question> get getIntermediateQuestionsList => _getIntermediateQuestions();
  List<Question> get getHotQuestionsList => _getHotQuestions();

  _getNormalQuestions() {
    return _normalQuestionsList = normalQuestions.map((e) => Question.fromMap(e)).toList();
  }
  _getIntermediateQuestions() {
    return _intermediateQuestionsList = intermediateQuestions.map((e) => Question.fromMap(e)).toList();
  }
  _getHotQuestions() {
    return _hotQuestionsList = hotQuestions.map((e) => Question.fromMap(e)).toList();
  }
  _getCategories() {
    return _categoriesList = categories.map((e) => Category.fromMap(e)).toList();
  }

  final categories = [
    {
      'id': 1,
      'description': 'NORMAL',
      'imageRoute' : 'assets/images/wine.jpg'
    },
    {
      'id': 2,
      'description': 'INTERMEDIO',
    'imageRoute' : 'assets/images/shots.jpg'
    },
    {
      'id': 3,
      'description': 'CALIENTE',
      'imageRoute' : 'assets/images/smirk_face.png'
    },
  ];

  /*
     _   _  ____  _____  __  __          _
  | \ | |/ __ \|  __ \|  \/  |   /\   | |
  |  \| | |  | | |__) | \  / |  /  \  | |
  | . ` | |  | |  _  /| |\/| | / /\ \ | |
  | |\  | |__| | | \ \| |  | |/ ____ \| |____
  |_| \_|\____/|_|  \_\_|  |_/_/    \_\______|
  */

  final normalQuestions = [
    {"id": 0, "categoryId": 1, "description": "Yo nunca he fingido estar enfermo para evitar ir a la escuela.", "isFavourite": 0},
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
      "description": "Yo nunca he intentado impresionar al que me gustaba pareciendo estar informada.",
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
      "description": "Yo nunca he hecho un simpa en un restaurante.",
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
      "description": "Yo nunca he entrado a una fiesta sin que me hayan invitado.",
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
      "description": "Yo nunca he mentido diciendo que me gustaba lo que había cocinado una amistad o mi pareja.",
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
      "description": "Yo nunca he cogido dinero de mis padres sin avisar",
      "isFavourite": 0
    }
  ];


  /*
  _____ _   _ _______ ______ _____  __  __ ______ _____ _____       _______ ______
 |_   _| \ | |__   __|  ____|  __ \|  \/  |  ____|  __ \_   _|   /\|__   __|  ____|
   | | |  \| |  | |  | |__  | |__) | \  / | |__  | |  | || |    /  \  | |  | |__
   | | | . ` |  | |  |  __| |  _  /| |\/| |  __| | |  | || |   / /\ \ | |  |  __|
  _| |_| |\  |  | |  | |____| | \ \| |  | | |____| |__| || |_ / ____ \| |  | |____
 |_____|_| \_|  |_|  |______|_|  \_\_|  |_|______|_____/_____/_/    \_\_|  |______|
*/
  final intermediateQuestions =
    [
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
        "description": "Yo nunca he intentado esconder un chupetón.",
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
        "description": "Yo nunca he tenido una pelea de pareja en público.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he usado ropa interior de otra persona.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he sido arrestado porque me uní a una protesta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he estado de fiesta sin parar durante más de veinticuatro horas.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he probado una aplicación de citas.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he robado en una tienda.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he respondido \"gracias\" cuando me han dicho \"te quiero\".",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he tirado un pedo y he dicho “que mal huele” para despistar.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he accidentado al tratar de impresionar un chico o una chica que me gustara.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he dejado caer mi móvil al WC.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he quedado paralizado en una presentación en público.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca me he roto un hueso.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Nunca he rechazado un beso.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he fingido que me llamaban para escapar de una cita.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Nunca me he hecho fotos en ropa interior.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he vuelto con mi ex.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he cotilleado a quién daba like mi pareja o exparejas.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Nunca he tenido una relación abierta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he preferido no estar con mi pareja.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he sido infiel.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he dudado de mi orientación sexual.",
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
        "description": "Yo nunca he perdido el conocimiento.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he robado dinero.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he exagerado mis logros para intentar ligar.",
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
        "description": "Yo nunca he olido mi propia ropa interior para ver si está limpia o sucia.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he dejado plantado a alguien en una cita.",
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
        "description": "Yo nunca he enviado un mensaje a un ex sin venir a cuento.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he dicho que me gustaba mucho un regalo y luego lo he devuelto.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he comido las sobras de otra mesa en un restaurante.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he mirado el teléfono de mi pareja.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he usado el cepillo de dientes de otra persona.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he tenido celos de mis amigos.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 2,
        "description": "Yo nunca he salido con alguien más joven que yo",
        "isFavourite": 0
      }
    ];

  /*
      _    _  ____ _______
 | |  | |/ __ \__   __|
 | |__| | |  | | | |
 |  __  | |  | | | |
 | |  | | |__| | | |
 |_|  |_|\____/  |_|

  */
  final hotQuestions =
    [
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
        "description": "Yo nunca he sido preguntado por mis padres si era virgen",
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
        "description": "Yo nunca… he tenido sexo con más de tres personas en la misma noche.",
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
        "description": "Yo nunca… he tenido sexo estando con el periodo",
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
        "description": "Yo nunca… he tenido sexo con más de cuatro personas en la misma noche.",
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
        "description": "Yo nunca… me he acostado con mi jefe para ascender.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tenido sexo en la cama de un amigo y no se lo he dicho.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tenido sexo con más de dos personas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tragado semen.",
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
        "description": "Yo nunca… he recibido o dado un trabajito con los pies.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he llevado un botón anal y he salido a la calle.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… me he acostado con alguien por venganza.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tenido sexo con más de tres personas en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tenido sexo con más de una persona en la misma noche.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he recibido dinero por matener relaciones sexuales",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tenido sexo con un stripper.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… me he masturbado usando una fruta.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he tenido un orgasmo vaginal.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he hecho un cuarteto con otros tres hombres.",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca… he recibido un trabajito con la mano.",
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
        "description": "Yo nunca he revisado el Whatsapp de mi pareja",
        "isFavourite": 0
      },
      {
        "id": 0,
        "categoryId": 3,
        "description": "Yo nunca he tirado fichas al novio de un amigo",
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
        "description": "Yo nunca he fantaseado con mi mejor amigo\\a",
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
      }

    ];
/*
* Search bar in AppBar, Badge needs to be imported
* Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                10.0,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                10.0,
              ),
            ),
          ),
          hintText: 'Search petients,transcript,contacts',
          prefixIcon: Icon(
            Icons.menu,
          ),
          suffixIcon: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Positioned(
                right: 15,
                child: Badge(
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  badgeContent: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ),
    ),
  ),
* */
}
