from ctypes import *

import pathlib

root = pathlib.Path(__file__).parent.resolve()
methods = CDLL(f"{root}/libsorting.dylib")

bubble_sort = methods.bubble_sort

bubble_sort.argtypes = [POINTER(c_float), c_int]
bubble_sort.restype = POINTER(c_float)

def to_c_array(arr):
    return (c_float * len(arr))(*arr)

teste = [10,154,8,0,9,48,7,55,5]

p_teste = to_c_array(teste)

x = bubble_sort(p_teste, c_int(len(teste)))

pylist = [None] * len(teste)
for i in range(len(teste)):
   pylist[i] = x[i]
print(pylist)