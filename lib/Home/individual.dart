import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ModelClass/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class IndividualPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectID =
        int.tryParse(VRouteElementData.of(context).pathParameters['id'] ?? '0');

    final DarkThemeProvider _theme = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("projects").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final project = snapshot.data.docs.elementAt(projectID);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            project["projectName"].toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          CachedNetworkImage(
                            height: 300,
                            imageUrl: project["projectImage"].toString(),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              project["projectDesc"].toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                VRouterData.of(context).pushExternal(
                                    project["link"].toString(),
                                    openNewTab: true);
                              },
                              child: Container(
                                height: 45,
                                width: 160,
                                decoration: BoxDecoration(
                                  color: _theme.darkTheme == true
                                      ? Colors.white
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "GITHUB",
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: _theme.darkTheme == true
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
