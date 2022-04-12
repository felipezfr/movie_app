import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:mocktail/mocktail.dart';

class DioServiceMock extends Mock implements DioServiceImp {}

void main() async {
  var repositoryImp = MoviesRepositoryImp(DioServiceMock());

  // when(() => repositoryImp.getMovies()).thenReturn(jsonDecode(jsonData));
  when(() => repositoryImp.getMovies()).thenAnswer(jsonDecode(jsonData));

  final list = await repositoryImp.getMovies();

  test('shold not be null', () {
    expect(list, isNotNull);
  });

  test('shold return Movies', () {
    expect(list, isA<Movies>());
  });

  test('shold return page 1', () {
    expect(list.page, 1);
  });

  test('shold return page 3', () async {
    var list = await repositoryImp.getMovies(page: 3);
    expect(list.page, 3);
  });

  test('shold return a list of Movie', () async {
    expect(list.listMovie, isA<List<Movie>>());
  });
}

String jsonData = """ 
{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg",
            "genre_ids": [
                28,
                878,
                35,
                10751
            ],
            "id": 675353,
            "original_language": "en",
            "original_title": "Sonic the Hedgehog 2",
            "overview": "Depois de se estabelecer em Green Hills, Sonic está pronto para mais liberdade e deixar sua marca como um herói, e Tom e Maddie concordam em deixá-lo em casa enquanto vão de férias. Mas, assim que eles se foram, Dr. Robotnik volta, desta vez com um novo parceiro, Knuckles, em busca de uma esmeralda que tem o poder de construir e destruir civilizações. Sonic se une a um novo companheiro, Tails, e juntos eles embarcam em uma jornada para encontrar a esmeralda antes que ela caia nas mãos erradas.",
            "popularity": 8634.369,
            "poster_path": "/f4SvCKIUrC2cDR7Xo4k1kaGAqQ2.jpg",
            "release_date": "2022-03-30",
            "title": "Sonic 2: O Filme",
            "video": false,
            "vote_average": 7.8,
            "vote_count": 289
        },
        {
            "adult": false,
            "backdrop_path": "/x747ZvF0CcYYTTpPRCoUrxA2cYy.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 406759,
            "original_language": "en",
            "original_title": "Moonfall",
            "overview": "Poucas semanas antes do impacto e com a humanidade à beira da aniquilação, a ex-astronauta da NASA Jo Fowler está convencida de que tem a resposta para salvar o planeta, mas apenas um colega do passado, o astronauta Brian Harper, e o teorista K.C. Houseman, acreditam nela. Os improváveis heróis correm contra o tempo para montar uma missão ao espaço, mas lá descobrem que a Lua não é o que parece.",
            "popularity": 6049.055,
            "poster_path": "/ACl5NQBHeEvypdVlaaE868bwFs.jpg",
            "release_date": "2022-02-03",
            "title": "Moonfall: Ameaça Lunar",
            "video": false,
            "vote_average": 6.5,
            "vote_count": 619
        },
        {
            "adult": false,
            "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
            "genre_ids": [
                28,
                12,
                878
            ],
            "id": 634649,
            "original_language": "en",
            "original_title": "Spider-Man: No Way Home",
            "overview": "Peter Parker é desmascarado e não consegue mais separar sua vida normal dos grandes riscos de ser um super-herói. Quando ele pede ajuda ao Doutor Estranho, os riscos se tornam ainda mais perigosos, e o forçam a descobrir o que realmente significa ser o Homem-Aranha.",
            "popularity": 6826.391,
            "poster_path": "/fVzXp3NwovUlLe7fvoRynCmBPNc.jpg",
            "release_date": "2021-12-15",
            "title": "Homem-Aranha: Sem Volta Para Casa",
            "video": false,
            "vote_average": 8.2,
            "vote_count": 11312
        },
        {
            "adult": false,
            "backdrop_path": "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg",
            "genre_ids": [
                16,
                10751,
                35,
                14
            ],
            "id": 508947,
            "original_language": "en",
            "original_title": "Turning Red",
            "overview": "Mei, de treze anos, está experimentando a estranheza de ser uma adolescente com uma reviravolta – quando ela fica muito animada, ela se transforma em um panda vermelho gigante.",
            "popularity": 6019.358,
            "poster_path": "/725WE0Qb1BbUF7aGvjiQqzzffpg.jpg",
            "release_date": "2022-03-10",
            "title": "Red: Crescer é Uma Fera",
            "video": false,
            "vote_average": 7.5,
            "vote_count": 1554
        },
        {
            "adult": false,
            "backdrop_path": "/ewUqXnwiRLhgmGhuksOdLgh49Ch.jpg",
            "genre_ids": [
                28,
                12,
                35,
                878
            ],
            "id": 696806,
            "original_language": "en",
            "original_title": "The Adam Project",
            "overview": "Depois de viajar no tempo e ir parar em 2022 sem querer, o piloto de combate Adam Reed se une à sua versão de 12 anos de idade para salvar o futuro.",
            "popularity": 2845.626,
            "poster_path": "/11MJy6lkt7yTEIowEPIkaK4B7lM.jpg",
            "release_date": "2022-03-11",
            "title": "O Projeto Adam",
            "video": false,
            "vote_average": 7,
            "vote_count": 1672
        },
        {
            "adult": false,
            "backdrop_path": "/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
            "genre_ids": [
                80,
                9648,
                53
            ],
            "id": 414906,
            "original_language": "en",
            "original_title": "The Batman",
            "overview": "Bruce Wayne é um jovem bilionário da cidade de Gotham City, Nova Jersey, que também age secretamente como o vigilante noturno Batman após o assassinato dos seus pais.",
            "popularity": 2337.739,
            "poster_path": "/wd7b4Nv9QBHDTIjc2m7sr0IUMoh.jpg",
            "release_date": "2022-03-01",
            "title": "Batman",
            "video": false,
            "vote_average": 7.9,
            "vote_count": 2783
        },
        {
            "adult": false,
            "backdrop_path": "/t7I942V5U1Ggn6OevN75u3sNYH9.jpg",
            "genre_ids": [
                28,
                53
            ],
            "id": 760868,
            "original_language": "sv",
            "original_title": "Svart krabba",
            "overview": "Para acabar com uma guerra apocalíptica e salvar a filha, uma militar embarca em uma missão desesperada: atravessar o mar congelado levando uma carga ultrassecreta.",
            "popularity": 2762.893,
            "poster_path": "/sw644BbNIxSGRqjwAC50uskDBHg.jpg",
            "release_date": "2022-03-18",
            "title": "Caranguejo Negro",
            "video": false,
            "vote_average": 6.2,
            "vote_count": 299
        },
        {
            "adult": false,
            "backdrop_path": "/3G1Q5xF40HkUBJXxt2DQgQzKTp5.jpg",
            "genre_ids": [
                16,
                35,
                10751,
                14
            ],
            "id": 568124,
            "original_language": "en",
            "original_title": "Encanto",
            "overview": "Uma garota chamada Mirabel Madrigal cresce como o único membro não mágico de sua família, que vivem escondidos em uma vibrante casa encantada nas montanhas da Colômbia.",
            "popularity": 2411.238,
            "poster_path": "/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg",
            "release_date": "2021-11-24",
            "title": "Encanto",
            "video": false,
            "vote_average": 7.7,
            "vote_count": 5954
        },
        {
            "adult": false,
            "backdrop_path": "/2hGjmgZrS1nlsEl5PZorn7EsmzH.jpg",
            "genre_ids": [
                28,
                53
            ],
            "id": 823625,
            "original_language": "en",
            "original_title": "Blacklight",
            "overview": "Confiança, identidade e o perigo do poder sem controle levam um agente secreto ao limite. Travis Block (Liam Neeson) vive e luta nas sombras. Um “consertador” autônomo do governo, Block é um homem perigoso cujas atribuições incluíam extrair agentes de situações ocultas. Quando Block descobre que um programa sombrio chamado Operação Unidade está abatendo cidadãos comuns por razões conhecidas apenas pelo seu supervisor, o chefe do FBI, Robinson (Aidan Quinn), ele pede a ajuda de uma jornalista (Raver-Lampman), mas seu passado e presente colidem quando seu filha e neta são ameaçadas. Agora Block precisa resgatar as pessoas que ama e expor a verdade para uma chance de redenção. Nada nem ninguém está seguro quando os segredos estão escondidos nas sombras.",
            "popularity": 2641.424,
            "poster_path": "/qgW5iIe6QUn170omG6tdGS4BB9U.jpg",
            "release_date": "2022-02-10",
            "title": "Agente das Sombras",
            "video": false,
            "vote_average": 6.1,
            "vote_count": 259
        },
        {
            "adult": false,
            "backdrop_path": "/stmYfCUGd8Iy6kAMBr6AmWqx8Bq.jpg",
            "genre_ids": [
                28,
                878,
                35,
                10751
            ],
            "id": 454626,
            "original_language": "en",
            "original_title": "Sonic the Hedgehog",
            "overview": "Sonic, o ouriço azul mais veloz do mundo, vive isolado e sem amigos na Terra desde que precisou fugir de seu planeta natal. Todavia, ele recebe a ajuda de um policial quando o Dr. Ivo Robotinik, a mando do governo dos Estados Unidos, começa a persegui-lo.",
            "popularity": 2232.332,
            "poster_path": "/eOC0FSGqyzcnnx7XFgLazI9nACT.jpg",
            "release_date": "2020-02-12",
            "title": "Sonic: O Filme",
            "video": false,
            "vote_average": 7.4,
            "vote_count": 7723
        },
        {
            "adult": false,
            "backdrop_path": "/An1nKjXahrChfEbZ3MAE8fsiut1.jpg",
            "genre_ids": [
                27
            ],
            "id": 661791,
            "original_language": "es",
            "original_title": "La abuela",
            "overview": "Uma modelo parisiense deve retornar a Madri, onde sua avó, que a criou, teve um derrame. Mas passar apenas alguns dias com esse parente se transforma em um pesadelo inesperado.",
            "popularity": 2464.112,
            "poster_path": "/19rA9FjhwI4VEfaCXV7648XUInR.jpg",
            "release_date": "2022-01-28",
            "title": "La abuela",
            "video": false,
            "vote_average": 6.3,
            "vote_count": 78
        },
        {
            "adult": false,
            "backdrop_path": "/tq3klWQevRK0Or0cGhsw0h3FDWQ.jpg",
            "genre_ids": [
                12,
                16,
                35,
                10751,
                14
            ],
            "id": 676705,
            "original_language": "fr",
            "original_title": "Pil",
            "overview": "Pil vive nas ruas da cidade medieval de Roc-en-Brume, junto com suas três doninhas mansas. Ela sobrevive de comida roubada do castelo do sinistro Regente Tristain. Um dia, para escapar de seus guardas, Pil se disfarça de princesa. Assim, ela embarca em uma aventura louca e delirante, junto com Crobar, um grande guarda desajeitado que pensa que ela é uma nobre, e Rigolin, um jovem bobo maluco. Pil vai ter que salvar Roland, herdeiro legítimo do trono sob a maldição de um feitiço. Esta aventura vai virar todo o reino de cabeça para baixo e ensinar a Pil que a nobreza pode ser encontrada em todos nós.",
            "popularity": 2424.93,
            "poster_path": "/78JfwRiubwX87BYgPXsdFKBf9P5.jpg",
            "release_date": "2021-08-11",
            "title": "Pil's Adventures",
            "video": false,
            "vote_average": 6.9,
            "vote_count": 46
        },
        {
            "adult": false,
            "backdrop_path": "/j0xO6355h5HfvC425sWDT6tiBZM.jpg",
            "genre_ids": [
                28,
                12,
                14
            ],
            "id": 939243,
            "original_language": "en",
            "original_title": "Sonic the Hedgehog 3",
            "overview": "",
            "popularity": 2412.241,
            "poster_path": "/aNSBaYTgPz8QEADi3xiD52X4uVF.jpg",
            "release_date": "",
            "title": "Sonic 3: O Filme",
            "video": false,
            "vote_average": 0,
            "vote_count": 0
        },
        {
            "adult": false,
            "backdrop_path": "/33wnBK5NxvuKQv0Cxo3wMv0eR7F.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 833425,
            "original_language": "en",
            "original_title": "No Exit",
            "overview": "Darby Thorne é uma mulher que viaja devido a uma emergência familiar, fica presa em nevasca e é forçada a se abrigar numa área de descanso na estrada com um grupo de desconhecidos. Ao topar com uma garota sequestrada numa van, ela encara uma terrível luta de vida ou morte para descobrir quem é o sequestrador.",
            "popularity": 2305.423,
            "poster_path": "/dvTTuRqwvM6wkDuA0JviE58NSRp.jpg",
            "release_date": "2022-02-25",
            "title": "Sem Saída",
            "video": false,
            "vote_average": 6.5,
            "vote_count": 326
        },
        {
            "adult": false,
            "backdrop_path": "/yzH5zvuEzzsHLZnn0jwYoPf0CMT.jpg",
            "genre_ids": [
                53,
                28
            ],
            "id": 760926,
            "original_language": "en",
            "original_title": "Gold",
            "overview": "Dois estranhos que estão viajando em um deserto e se surpreendem ao encontrar uma grande pepita de ouro. Eles pensam em uma estratégia para explorar e dividir a recompensa do tesouro encontrado. Enquanto um vai procurar equipamentos para dar continuidade no plano, o outro fica responsável por proteger o local e ambos lidam com diversos desafios nessa aventura.",
            "popularity": 1808.479,
            "poster_path": "/ejXBuNLvK4kZ7YcqeKqUWnCxdJq.jpg",
            "release_date": "2022-01-13",
            "title": "Gold",
            "video": false,
            "vote_average": 6.6,
            "vote_count": 170
        },
        {
            "adult": false,
            "backdrop_path": "/eG0oOQVsniPAuecPzDD1B1gnYWy.jpg",
            "genre_ids": [
                16,
                35,
                12,
                10751
            ],
            "id": 774825,
            "original_language": "en",
            "original_title": "The Ice Age Adventures of Buck Wild",
            "overview": "As peripécias hilárias dos mamíferos pré-históricos favoritos de todo mundo continuam, enquanto os gambás caçadores de emoções Crash e Eddie se juntam ao seu amigo caolho, aventureiro e caçador de dinossauros, a doninha Buck Wild, para enfrentar os dinossauros rebeldes do Mundo Perdido.",
            "popularity": 1677.267,
            "poster_path": "/1iVjKCGHPVNj7IQVB1DdpL8U7Y8.jpg",
            "release_date": "2022-01-28",
            "title": "A Era do Gelo: As Aventuras de Buck",
            "video": false,
            "vote_average": 6.9,
            "vote_count": 959
        },
        {
            "adult": false,
            "backdrop_path": "/tj4lzGgHrfjnjVqAKkLIjFqPSyO.jpg",
            "genre_ids": [
                28,
                878,
                14
            ],
            "id": 526896,
            "original_language": "en",
            "original_title": "Morbius",
            "overview": "Durante um experimento para encontrar a cura de uma rara doença sanguínea, o Dr. Michael Morbius acidentalmente se transforma num sanguinário vampiro.",
            "popularity": 1364.681,
            "poster_path": "/h4WLN3cmEjCsH1fNGRfvGV6IPBX.jpg",
            "release_date": "2022-03-30",
            "title": "Morbius",
            "video": false,
            "vote_average": 5.8,
            "vote_count": 382
        },
        {
            "adult": false,
            "backdrop_path": "/7CamWBejQ9JQOO5vAghZfrFpMXY.jpg",
            "genre_ids": [
                28,
                53,
                80
            ],
            "id": 928381,
            "original_language": "fr",
            "original_title": "Sans répit",
            "overview": "Depois de tomar medidas extremas para encobrir um acidente, um policial corrupto começa a receber ameaças de uma misteriosa testemunha e as coisas saem do controle.",
            "popularity": 1561.047,
            "poster_path": "/bktIW44oeurTptHLdkj7ayc4zbH.jpg",
            "release_date": "2022-02-25",
            "title": "Um Dia Difícil",
            "video": false,
            "vote_average": 5.9,
            "vote_count": 209
        },
        {
            "adult": false,
            "backdrop_path": "/eVSa4TpyXbOdk9fXSD6OcORJGtv.jpg",
            "genre_ids": [
                53
            ],
            "id": 803114,
            "original_language": "en",
            "original_title": "The Requin",
            "overview": "Um casal de férias no Vietnã se encontram presos em mar aberto após uma enorme tempestade tropical levar sua casa à beira-mar. Com o marido machucado e morrendo, a esposa precisa lutar contra os elementos sozinha, enquanto são cercado por tubarões brancos abaixo.",
            "popularity": 1553.358,
            "poster_path": "/i0z8g2VRZP3dhVvvSMilbOZMKqR.jpg",
            "release_date": "2022-01-28",
            "title": "The Requin",
            "video": false,
            "vote_average": 4.8,
            "vote_count": 92
        },
        {
            "adult": false,
            "backdrop_path": "/qBLEWvJNVsehJkEJqIigPsWyBse.jpg",
            "genre_ids": [
                16,
                10751,
                14,
                35,
                12
            ],
            "id": 585083,
            "original_language": "en",
            "original_title": "Hotel Transylvania: Transformania",
            "overview": "Drac e sua turma acabam sendo transformados em humanos após uma invenção de Van Helsing. Agora, eles precisam viajar até a Floresta Amazônica para encontrar o que pode ser a única solução para reverter a transformação, antes que seus poderes se percam para sempre.",
            "popularity": 1416.855,
            "poster_path": "/9PbtCo5IIkd26WPQfZUpPyn6fTz.jpg",
            "release_date": "2022-02-25",
            "title": "Hotel Transilvânia: Transformonstrão",
            "video": false,
            "vote_average": 7.1,
            "vote_count": 655
        }
    ],
    "total_pages": 33093,
    "total_results": 661853
}

""";
