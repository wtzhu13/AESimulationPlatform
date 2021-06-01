# !/usr/bin/python3
# -*- coding: utf-8 -*-

"""
@Author:    wtzhu
@Project:   AESimulationPlatform
@File:      testAutoGui.py
@Describe:  test pyautogui func
@Date:      20210601
@E-mail:    wtzhu_13@163.com
@Version:
@Copyright: All rights reserved wtzhu
------------------------------------------
author      |   Date    |   Describe
------------------------------------------
wtzhu       |  20210601 |   test file
------------------------------------------    
"""
import pyautogui as pag


def touch_txt():
    """

    :return:
    """
    pag.PAUSE = 1.5
    # close cmd window
    pag.click(1385, 239)
    # click right buttom
    pag.click(431, 585, button='right')
    # click new
    pag.click(512, 918)
    # click txt file
    pag.click(695, 865)
    # rename
    pag.write('testAutoGui')
    pag.press('enter')
    # open the testTxt file
    pag.click(201, 61, clicks=2, interval=0.2)
    # change Chinese input to English
    pag.press('shift')
    for i in range(10):
        # input str into test txt file
        pag.typewrite(f"hello world {i} \n", interval=0.1)
    # save info
    pag.hotkey('ctrl', 's')


if __name__ == '__main__':
    touch_txt()
