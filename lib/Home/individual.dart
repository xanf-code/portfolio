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
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  final project = snapshot.data.docs.elementAt(projectID);
                  return Column(
                    children: [
                      UpperWidget(
                        project: project,
                      ),
                      const SizedBox(height: 30),
                      MidImageSection(
                        image: project['projectImage'].toString(),
                      ),
                      const SizedBox(height: 30),
                      BottomTextSection(project: project),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}

class BottomTextSection extends StatelessWidget {
  final QueryDocumentSnapshot project;

  const BottomTextSection({
    Key key,
    this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider _theme = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          SelectableText(
            project['projectDesc'].toString(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              height: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              onTap: () {
                VRouterData.of(context)
                    .pushExternal(project["link"].toString(), openNewTab: true);
              },
              child: Container(
                height: 45,
                width: 160,
                decoration: BoxDecoration(
                  color: _theme.darkTheme == true ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: SelectableText(
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
    );
  }
}

class UpperWidget extends StatelessWidget {
  final QueryDocumentSnapshot project;
  const UpperWidget({
    Key key,
    this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SelectableText(
            project['projectName'].toString(),
            style: GoogleFonts.poppins(
              fontSize: 29,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Project by ',
                  style: DefaultTextStyle.of(context).style.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Darshan Aswath",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ],
                ),
              ),
              SelectableText(
                project['timestamp'].toString(),
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MidImageSection extends StatelessWidget {
  const MidImageSection({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
