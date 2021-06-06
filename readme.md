# AESimulationPlatform

## EN

a auto exposure Simulation platform base on Matlab

After downloading this project, you can run the exe in the exe floder to test the platform. If the program prompts that it cannot be used, please make sure thar your PC has installed the right MCR, and you can find the version info by reading readme.

### File structure 

- dataCollection: Collect image date set automatically by Python;
- doc: Documentation ;
- exe: Executable file on windows;
- img: Test images;
- rsc: Static files;
- src: The source code.

```
AESimulationPlatform
│  readme.md
│  
├─dataCollection
│  │  collectImages.py
│  │  getPosOfMouse.py
│  │  testAutoGui.py
│  │  
│  └─.idea
│      │  .gitignore
│      │  dataCollection.iml
│      │  misc.xml
│      │  modules.xml
│      │  vcs.xml
│      │  
│      └─inspectionProfiles
│              profiles_settings.xml
│              
├─doc
│      doc.html
│      doc.md
│      
├─exe
│  │  aeIterativeMethod.exe
│  │  aeLUT.exe
│  │  brighenessLUT.mat
│  │  readme.txt
│  │  splash.png
│  │  
│  ├─aeIterativeMethod_resources
│  │      icon.ico
│  │      icon_16.png
│  │      icon_24.png
│  │      icon_32.png
│  │      icon_48.png
│  │      
│  └─rsc
│          about.png
│          bitbug_favicon.ico
│          ExposureCurve.png
│          ExposureCurve.sfit
│          info.png
│          ui.png
│          
├─img
│  │  FN_18_GAIN_1_ET_10000.jpg
│  │  FN_18_GAIN_1_ET_5000.jpg
│  │  FN_18_GAIN_1_ET_8000.jpg
│  │  
│  └─test
├─rsc
│      about.png
│      bitbug_favicon.ico
│      bitbug_favicon.png
│      ExposureCurve.png
│      ExposureCurve.sfit
│      info.png
│      ui.png
│      
└─src
        ae.m
        aeEquationMethod.m
        aeLUTMethod.m
        exposureCurve.m
        getBrighenessLut.m
        globalExposure.m
        judgeFileType.m
        nextFrame.m
        rgb2hsl.m
        splitParameters.m
        ui.fig
        ui.m
```



### Operation guide

![](.\rsc\ui.png)

The overall interface is designed as above. The luminance value of tatget is set 128 first,  you can modify it in the edit.

1. Choose the first frame image by clicking on the button of chooseFirstFrame;
2. Run the AE system by clicking on the button of Run, the luminance value of current image can be calculated by the system automatically;
3. The edit of frames shows which frame image it is now, and  the speed of AE algorithm can be compared with this.The range of target luminance is set  ±16 now, and it will be set by yourself the next version.

## ZH

一个自动曝光模拟仿真平台，通过平台可以测试自动曝光算法，基于MATLAB编写。

下载该项目后，可直接进入exe目录下运行可执行程序使用平台，如果提示无法运行，请先阅读readme文档，并保证电脑安装同版本的MCR。

### 文件结构

- dataCollection: 收集数据的Python脚本文件；
- doc: 说明知道文件；
- exe: windows上的可执行文件;
- img: 测试图片;
- rsc: 静态文件;
- src: 项目源代码.

```
AESimulationPlatform
│  readme.md
├─dataCollection
│  │  collectImages.py
│  │  getPosOfMouse.py
│  │  testAutoGui.py
│  │  
│  └─.idea
│      │  .gitignore
│      │  dataCollection.iml
│      │  misc.xml
│      │  modules.xml
│      │  vcs.xml
│      │  
│      └─inspectionProfiles
│              profiles_settings.xml
│              
├─doc
│      doc.html
│      doc.md
│      
├─exe
│  │  aeIterativeMethod.exe
│  │  aeLUT.exe
│  │  brighenessLUT.mat
│  │  readme.txt
│  │  splash.png
│  │  
│  ├─aeIterativeMethod_resources
│  │      icon.ico
│  │      icon_16.png
│  │      icon_24.png
│  │      icon_32.png
│  │      icon_48.png
│  │      
│  └─rsc
│          about.png
│          bitbug_favicon.ico
│          ExposureCurve.png
│          ExposureCurve.sfit
│          info.png
│          ui.png
│          
├─img
│  │  FN_18_GAIN_1_ET_10000.jpg
│  │  FN_18_GAIN_1_ET_5000.jpg
│  │  FN_18_GAIN_1_ET_8000.jpg
│  │  
│  └─test
├─rsc
│      about.png
│      bitbug_favicon.ico
│      bitbug_favicon.png
│      ExposureCurve.png
│      ExposureCurve.sfit
│      info.png
│      ui.png
│      
└─src
        ae.m
        aeEquationMethod.m
        aeLUTMethod.m
        exposureCurve.m
        getBrighenessLut.m
        globalExposure.m
        judgeFileType.m
        nextFrame.m
        rgb2hsl.m
        splitParameters.m
        ui.fig
        ui.m
```



### 操作指引：

![](.\rsc\ui.png)

整体界面设计如图所示，默认目标亮度为128的中度灰，也可以自行设置。

1. 通过chooseFirstFrame按钮选择第一帧图像；
2. 点击Run按钮后开始运行系统，系统实时计算当前亮度值并显示在currentLu中；
3. 同时frames会显示帧数，及通过几次到达目标亮度范围，可以用于对比速度，目前版本默认目标亮度范围设置为±16，后续版本预计更新为可自己设置。