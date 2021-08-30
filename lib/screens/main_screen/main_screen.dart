import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taloengrat_cv/constance.dart';
import 'package:taloengrat_cv/models/topic_model.dart';
import 'package:taloengrat_cv/providers/language_provider.dart';
import 'package:taloengrat_cv/screens/main_screen/components/extracurticular_activities_component.dart';
import 'package:taloengrat_cv/screens/main_screen/components/contact_component.dart';
import 'package:taloengrat_cv/screens/main_screen/components/education_component.dart';
import 'package:taloengrat_cv/screens/main_screen/components/myskill_component.dart';
import 'package:taloengrat_cv/screens/main_screen/components/mystory_component.dart';
import 'package:taloengrat_cv/screens/main_screen/components/sidebar_contact.dart';

import 'components/header_component.dart';
import 'components/other_component.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _scrollController = ScrollController();
  GlobalKey _keyMyStory = GlobalKey();
  GlobalKey _keyMySkill = GlobalKey();
  GlobalKey _keyActivities = GlobalKey();
  GlobalKey _keyEducation = GlobalKey();
  GlobalKey _keyContact = GlobalKey();
  GlobalKey _keyOther = GlobalKey();

  List<double> _listTopicPosition = [];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(_afterRender);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    WidgetsBinding.instance!.addPostFrameCallback(_afterRender);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getMyStoryPosition() {
    final RenderBox? myStotyBox =
        _keyMyStory.currentContext!.findRenderObject() as RenderBox;
    final position = myStotyBox!.localToGlobal(Offset.zero);
    _listTopicPosition.add(position.dy);
  }

  _getMySkillPosition() {
    final RenderBox? mySkillBox =
        _keyMySkill.currentContext!.findRenderObject() as RenderBox;
    final position = mySkillBox!.localToGlobal(Offset.zero);
    _listTopicPosition.add(position.dy);
  }

  _getActivity() {
    final RenderBox? activityBox =
        _keyActivities.currentContext!.findRenderObject() as RenderBox;
    final position = activityBox!.localToGlobal(Offset.zero);
    _listTopicPosition.add(position.dy);
  }

  _getEducation() {
    final RenderBox? activityBox =
        _keyEducation.currentContext!.findRenderObject() as RenderBox;
    final position = activityBox!.localToGlobal(Offset.zero);
    _listTopicPosition.add(position.dy);
  }

  _getOther() {
    final RenderBox? otherBox =
        _keyOther.currentContext!.findRenderObject() as RenderBox;
    final position = otherBox!.localToGlobal(Offset.zero);
    _listTopicPosition.add(position.dy);
  }

  _getContact() {
    final RenderBox? activityBox =
        _keyContact.currentContext!.findRenderObject() as RenderBox;
    final position = activityBox!.localToGlobal(Offset.zero);
    _listTopicPosition.add(position.dy);
  }

  _afterRender(_) {
    _getMyStoryPosition();
    _getMySkillPosition();
    _getActivity();
    _getEducation();
    _getOther();
    _getContact();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final language = Provider.of<LanguageProvider>(context).item;
    final isEnglish = language == 'English';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeaderComponent(
                  size: size,
                  scrollController: _scrollController,
                  listTopicPosition: _listTopicPosition,
                ),
                SizedBox(
                  height: defaultSpace * 2,
                ),
                MyStoryComponent(
                  key: _keyMyStory,
                  size: size,
                  topic: topicList.elementAt(0),
                  isEnglish: isEnglish,
                ),
                MySkillComponent(
                  key: _keyMySkill,
                  size: size,
                  topic: topicList.elementAt(1),
                  isEnglish: isEnglish,
                ),
                ExtracurricularActivitiesComponent(
                  key: _keyActivities,
                  size: size,
                  topic: topicList.elementAt(2),
                  isEnglish: isEnglish,
                ),
                EducationComponent(
                  key: _keyEducation,
                  size: size,
                  topic: topicList.elementAt(3),
                  isEnglish: isEnglish,
                ),
                OtherComponent(
                  key: _keyOther,
                  size: size,
                  topicModel: topicList.elementAt(4),
                  isEnglish: isEnglish,
                ),
                ContactComponent(
                  key: _keyContact,
                  size: size,
                  topic: topicList.elementAt(5),
                  isEnglish: isEnglish,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 50,
              height: 200,
              child: SideBarContactComponent(
                size: size,
                axizType: AXIZ_TYPE.COLUMN,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
