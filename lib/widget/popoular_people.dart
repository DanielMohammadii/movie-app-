import 'package:flutter/material.dart';
import 'package:movieapp/model/popular_people/ppl_result.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/widget/actor_detail.dart';

class PopularPeople extends StatefulWidget {
  const PopularPeople({super.key});

  @override
  State<PopularPeople> createState() => _PopularPeopleState();
}

class _PopularPeopleState extends State<PopularPeople> {
  bool isloading = false;
  List<PPlResult>? _pplresult;
  String baseUrl = 'https://image.tmdb.org/';
  List knowfor = [];
  @override
  void initState() {
    super.initState();
    getResult();
    ApiServices().getPopularPeople();
  }

  getResult() async {
    _pplresult = await ApiServices().getPopularPeople();
    if (_pplresult != null) {
      setState(() {
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Visibility(
        visible: isloading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _pplresult?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  _pplresult![index].profilePath != null
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ActorDetail(
                                  name: _pplresult![index].name.toString(),
                                  imgUrl:
                                      '$baseUrl/t/p/w300/${_pplresult![index].profilePath}',
                                  knowfor: _pplresult![index].knownFor,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    '$baseUrl/t/p/w300/${_pplresult![index].profilePath}'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/nophoto.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 110,
                      padding: const EdgeInsets.all(6),
                      color: Colors.black38,
                      child: Text(
                        _pplresult![index].name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
