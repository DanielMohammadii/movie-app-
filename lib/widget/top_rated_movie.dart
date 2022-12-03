import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/model/trending_model/result.dart';
import 'package:movieapp/services/api_services.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  List<Result>? _result;
  String baseUrl = 'https://image.tmdb.org/';
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    getResult();
  }

  getResult() async {
    _result = await ApiServices().getData();
    if (_result != null) {
      setState(() {
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TopRated Movies',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Visibility(
              visible: isloading,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _result?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              image: NetworkImage(
                                "$baseUrl/t/p/w300/${_result![index].poster_path}",
                              ),
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
                              _result![index].title,
                              style: const TextStyle(
                                color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
