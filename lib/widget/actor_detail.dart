import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/model/popular_people/known_for.dart';

import 'package:movieapp/model/popular_people/ppl_result.dart';
import 'package:movieapp/services/api_services.dart';

class ActorDetail extends StatefulWidget {
  final String name;
  final String? imgUrl;
  List<KnownFor>? knowfor;
  ActorDetail({
    super.key,
    required this.name,
    this.imgUrl,
    this.knowfor,
  });

  @override
  State<ActorDetail> createState() => _ActorDetailState();
}

class _ActorDetailState extends State<ActorDetail> {
  String baseUrl = 'https://image.tmdb.org/';
  List<Map> knowfor = [{}];
  bool isloading = false;
  List<PPlResult>? _pplresult;

  @override
  void initState() {
    super.initState();
    getResult();
    ApiServices().getPopularPeople();
    setState(() {
      print(widget.knowfor!.first.originalLanguage);
    });
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 35, 35),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('${widget.imgUrl}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.name,
                  style: GoogleFonts.redRose(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10)
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'Known For',
              style: GoogleFonts.actor(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 15,
              ),
              itemCount: widget.knowfor!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '$baseUrl/t/p/original/${widget.knowfor![index].posterPath}'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
