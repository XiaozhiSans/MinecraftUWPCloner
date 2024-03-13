# MinecraftUWPCloner
**MineraftUWPCloner** *("MCUWPC")* is a  
Minecraft UWP (*Windows 10/11* bedrock edition)  
Cloner.  
  
---
  
## How 2 clone Minecraft UWP
1. `git clone https://github.com/XiaozhiSans/MinecraftUWPCloner.git`  
   or download release pack from [here](https://www.github.com/XiaozhiSans/releases)  
   ![git clone](img/1-1.png)  
   ![release pack](img/1-2.png)  

2. then open `MinecraftUWPCloner.bat`  
   ![MinecraftUWPCloner.bat](img/2.png)  
  
2.5 press **yes**  
    ![uac](img/uac.png)  

3. and u will see this window  
   ![cmd window](img/3.png)  
   1. then input ur Minecraft appx **(afther extract)** path  
      for e.g. `d:\mcuwp`  
      ***notice: do not add "\\" at the end of path***  
      ![example path](img/3-path.png)  
   2. then we can see *menu*  
      ![menu](img/3-menu.png)  
      > my advice is `2813`  
  
4. input `2` to enable UWP Dev mode  
   if u enabled, just skip  

5. input `8` to modify *clone.xml*  
   ![clone.xml-notepad](img/4.png)  
   - in common, *maybe* we need modify *5 locations*  
      - Version  
        for e.g. `1.2.800.0`  
        ***notice: this version is not at all equal mc verion,  
        pls read oringinal AppxManifest.xml to get it***  
        ![how2get_packVerion](img/how2get_packVerion.png)  
  
      - ProcessorArchitecture  
        for e.g. `x64`  
        available value: 
          - `x64`  
          - `x86`  
          - `arm`  
          - `arm64`  
  
      - PhoneProductId  
        just an *uuid-v4*, get new uuid-v4 at [here](https://uuid.online)  
  
      - PhonePublisherId  
        *ditto*  
  
      - ProjectGUID  
        just a *guid*, get new guid at [here](https://guidgenerator.com)   
  
      press `ctrl+s` to save change  
  
6. now back to step3 mentioned window  
   then input `1` and the file was soon replaced  
   ![very fast!](img/6-path.png)  
  
7. then input `3` to install **Minecraft Clone**  
   ![installing...](img/7.png)  
  
8. when jump back to the menu open ur *start menu*  
   ![installed](img/installed.png)  
  
9. dont forget fo and star!! ~(￣▽￣)~🌹  
  
10. enjoy!  
