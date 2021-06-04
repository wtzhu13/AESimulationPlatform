# AESimulationPlatform

## EN

a auto exposure Simulation platform base on Matlab

### Operation guide

![](.\rsc\ui.png)

The overall interface is designed as above. The luminance value of tatget is set 128 first,  you can modify it in the edit.

1. Choose the first frame image by clicking on the button of chooseFirstFrame;
2. Run the AE system by clicking on the button of Run, the luminance value of current image can be calculated by the system automatically;
3. The edit of frames shows which frame image it is now, and  the speed of AE algorithm can be compared with this.The range of target luminance is set  ±16 now, and it will be set by yourself the next version.

## ZH

一个自动曝光模拟仿真平台，通过平台可以测试自动曝光算法，基于MATLAB编写。

### 操作指引：

![](.\rsc\ui.png)

整体界面设计如图所示，默认目标亮度为128的中度灰，也可以自行设置。

1. 通过chooseFirstFrame按钮选择第一帧图像；
2. 点击Run按钮后开始运行系统，系统实时计算当前亮度值并显示在currentLu中；
3. 同时frames会显示帧数，及通过几次到达目标亮度范围，可以用于对比速度，目前版本默认目标亮度范围设置为±16，后续版本预计更新为可自己设置。