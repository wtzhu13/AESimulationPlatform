# !/usr/bin/python3
# -*- coding: utf-8 -*-

"""
@Author:    wtzhu
@Project:   AESimulationPlatform
@File:      collectImages.py
@Describe:  use pyautogui to automate the images data what need to use in the platform
@Date:      20210602
@E-mail:    wtzhu_13@163.com
@Version:   V1.0
@Copyright: All rights reserved, wtzhu
------------------------------------------
author      |   Date    |   Describe
------------------------------------------
wtzhu       | 20210602  |
------------------------------------------    
"""

# ---------------------import files---------------------------
import os
import shutil
import pyautogui as pag
from time import sleep
from time import time

# ----------------------global values-------------------------
pag.PAUSE = 0.5


# ----------------------func files----------------------------
def auto_save_images():
    """
    save images auto bu use pyautogui
    :return:
    """
    # to IQTool UI
    pag.click(1137, 172)
    # save image from 300-30000, step is 10
    for us in range(300, 30301, 100):
        # set shutter by click shutter range
        pag.click(830, 590, clicks=2)
        # set shutter
        pag.write(str(us))
        # write parameter into board
        pag.press("enter")
        sleep(1)
        # save image
        pag.click(1350, 230)
        # format name
        format_file_name(str(us))


def format_file_name(us):
    """
    rename the image file using the required format
    :return:
    """
    # move image to the required path
    path = "E:\\Mysher\\Sigmastar\\SS333\\tools\\apitool\\Image"
    file_type = ".jpg"
    for index, value in enumerate(os.listdir(path)):
        # file type is .jpg
        if value.endswith(file_type):
            print(value)
            # rename file
            os.rename(path + "\\" + value, path + "\\" + "FN_18_GAIN_1_ET_{}.jpg".format(us))
            # mv renamed file to The specified location
            shutil.move(path + "\\" + "FN_18_GAIN_1_ET_{}.jpg".format(us), path + "\\data")


if __name__ == '__main__':
    start = time()
    auto_save_images()
    end = time()
    print(f"use time: {end - start}s")
    # format_file_name()

