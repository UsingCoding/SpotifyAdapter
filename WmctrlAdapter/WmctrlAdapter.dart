import './WmctrlAdapterInterface.dart';

import 'dart:io';

class WmctrlAdapter implements WmctrlAdapterInterface
{
  static final String WMCTRL = 'wmctrl';

  static final String APPLICATIONS_LIST_ARGS = '-lx';

  Future<String> retrieveApplicationTitle(String applicationClass) async
  {
    final applicationsList = ((await Process.run(WMCTRL, [APPLICATIONS_LIST_ARGS])).stdout) as String;

    int searchPos = applicationsList.indexOf(applicationClass);

    if (searchPos == 0) 
    {
      return '' ;
    }

    searchPos += applicationClass.length;

    int tabsLeft = 2;
    bool inWord = false;

    while (true) 
    {
      if (applicationsList[searchPos] == ' ') 
      {
        ++searchPos;
        inWord = false;
        continue;
      }
      
      if (!inWord) 
      {
        inWord = true;
        --tabsLeft;
      }

      ++searchPos;

      if (tabsLeft == 0) 
      {
        break;
      }
    }

    searchPos -= 2;
    String result = '';

    while (true) 
    {
      if (applicationsList[searchPos] == '\n') 
      {
        break;  
      }

      result += applicationsList[searchPos];
      ++searchPos;

      print(applicationsList[searchPos]);
    }

    return result.trim();
  }
}