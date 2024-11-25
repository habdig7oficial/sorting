from ctypes import *

import pathlib

root = pathlib.Path(__file__).parent.resolve()
bubble_sort = CDLL(f"{root}/libsorting.dylib").bubble_sort

bubble_sort.argtypes = [POINTER(c_int), c_int]
bubble_sort.restype = POINTER(c_int)

def to_c_array(arr):
    return (c_int * len(arr))(*arr)
