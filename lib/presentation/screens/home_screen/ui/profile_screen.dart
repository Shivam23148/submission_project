import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_bloc.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_event.dart';
import 'package:submission_project/presentation/screens/selection_screen/bloc/selection_state.dart';
import 'package:submission_project/presentation/screens/selection_screen/ui/selection_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SelectionBloc selectionBloc = SelectionBloc();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 3, right: 3, bottom: 0.05),
        child: BottomAppBar(
            elevation: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade700,
                    border: Border.all(color: Colors.grey.shade500)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Icon(Icons.bookmark),
                    Icon(Icons.person)
                  ],
                ),
              ),
            )),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        margin: EdgeInsets.only(top: 50),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {},
          child: Image.asset(
            "assets/image/frame.png",
            fit: BoxFit.contain,
            height: 30,
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 4, color: Colors.black87),
              borderRadius: BorderRadius.circular(80)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/image/profile_picture.jpeg"),
                    fit: BoxFit.cover)),
          ),
          Text(
            "Michael Watson",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text("(203) 2563-8542"),
          SizedBox(
            height: 10,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.001,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.grey.shade900,
                  Colors.grey.shade400,
                  Colors.white,
                  Colors.grey.shade400,
                  Colors.grey.shade900
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ))),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                child: Column(children: [
                  option_button(
                      optionbutton: OptionButtonControl(
                    title: "Profile",
                    leadingIcon: Icons.person_2_outlined,
                    trailingIcon: Icon(Icons.arrow_forward_ios_rounded),
                  )),
                  SizedBox(
                    height: 12,
                  ),
                  option_button(
                    optionbutton: OptionButtonControl(
                      title: "Favorite",
                      leadingIcon: Icons.star_border_purple500_sharp,
                      trailingIcon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  option_button(
                    optionbutton: OptionButtonControl(
                      title: "Country",
                      leadingIcon: Icons.flag_outlined,
                      onTap: () async {
                        List result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectionScreen(
                                      selectedValue: selectedValue,
                                    )));

                        selectionBloc.add(
                            SelectionRadioTapEvent(countryCode: result.first));

                        selectedValue = result.elementAt(1);
                        print("Result is $result");
                      },
                      trailingIcon: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: BlocBuilder<SelectionBloc, SelectionState>(
                          bloc: selectionBloc,
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Image.network(
                                      state is SelectedRadioState
                                          ? state.countryCode
                                          : "https://flagcdn.com/w320/in.png",
                                      fit: BoxFit.contain),
                                ),
                                Text(
                                  state is SelectedRadioState
                                      ? state.countryCode
                                          .split("/")[state.countryCode
                                                  .split("/")
                                                  .length -
                                              1]
                                          .split(".")[0]
                                          .toUpperCase()
                                          .padLeft(5)
                                          .padRight(7)
                                      : " IN ",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  option_button(
                      optionbutton: OptionButtonControl(
                          title: "Notification",
                          leadingIcon: Icons.notifications_none_outlined,
                          trailingIcon: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ))),
                  SizedBox(
                    height: 12,
                  ),
                  option_button(
                      optionbutton: OptionButtonControl(
                    title: "Settings",
                    leadingIcon: Icons.settings,
                    trailingIcon: Icon(Icons.arrow_forward_ios_rounded),
                  )),
                  SizedBox(
                    height: 12,
                  ),
                  option_button(
                      optionbutton: OptionButtonControl(
                    title: "Help",
                    leadingIcon: Icons.help_outline,
                    trailingIcon: Icon(Icons.arrow_forward_ios_rounded),
                  )),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout_outlined),
                          Text(
                            "Log out",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ]),
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class option_button extends StatelessWidget {
  final OptionButtonControl optionbutton;

  const option_button({super.key, required this.optionbutton});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade800,
      margin: EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: ListTile(
          onTap: optionbutton?.onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          leading: Icon(optionbutton.leadingIcon),
          title: Text(optionbutton.title),
          trailing: optionbutton.trailingIcon),
    );
  }
}

class OptionButtonControl {
  final String title;
  final IconData leadingIcon;
  final Widget trailingIcon;
  VoidCallback? onTap;

  OptionButtonControl(
      {required this.title,
      required this.leadingIcon,
      required this.trailingIcon,
      this.onTap});
}


/* height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.grey.shade800),
      alignment: Alignment.center, */