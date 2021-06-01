# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import pyautogui as pag
import os


def print_current_pos():
    """
    print current pos
    :return:
    """
    try:
        while True:
            os.system("cls")
            a = "%4d, %4d" % pag.position()
            print(a)
    except Exception as e:
        print(e)


if __name__ == '__main__':
    print_current_pos()

