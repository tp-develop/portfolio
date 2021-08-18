import 'package:taloengrat_cv/screens/main_screen/widgets/icon_newtab_widget.dart';

class IconNavigateModel {
  final String tooltipMessage;
  final String url;
  final String pathImageB;
  final String pathImageW;
  final ALTERNATIVE_TYPE? alternativeType;
  IconNavigateModel({
    required this.tooltipMessage,
    required this.url,
    required this.pathImageB,
    required this.pathImageW,
    this.alternativeType,
  });
}

List<IconNavigateModel> iconNavigate = [
  IconNavigateModel(
    tooltipMessage: 'Taloengrat Poomchaiya',
    pathImageB: 'images/github_b.png',
    pathImageW: 'images/github_w.png',
    url: 'https://github.com/Taloengrat?tab=repositories',
  ),
  IconNavigateModel(
    tooltipMessage: 'Taloengrat Poomchaiya',
    pathImageB: 'images/linkedin_b.png',
    pathImageW: 'images/linkedin_w.png',
    url:
        'https://www.linkedin.com/in/taloengrat-poomchaiya-5bba86204/?originalSubdomain=th',
  ),
  IconNavigateModel(
    tooltipMessage: 'Line id : armtp1997',
    pathImageB: 'images/line-logo_b.png',
    pathImageW: 'images/line-logo_w.png',
    url: '',
    alternativeType: ALTERNATIVE_TYPE.LINE,
  ),
  IconNavigateModel(
    tooltipMessage: 'tp.sourcecode@gmail.com',
    pathImageB: 'images/email_b.png',
    pathImageW: 'images/email_w.png',
    url: '',
    alternativeType: ALTERNATIVE_TYPE.EMAIL,
  ),
  IconNavigateModel(
    tooltipMessage: 'tp.sourcecode@gmail.com',
    pathImageB: 'images/youtube_b.png',
    pathImageW: 'images/youtube_w.png',
    url: 'https://www.youtube.com/channel/UCpZbrIT9vATGUYsyuegqeBQ/featured',
  ),
];