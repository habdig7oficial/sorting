module bubble_sort;

import core.memory;

extern (C) float * bubble_sort(float *ptr, int len){
    GC.disable;

    float [] arr = ptr[0..len];

    for(int i = 0; i < arr.length - 1; i++){
        for(int j = 0; j < arr.length - 1 ; j++){
                float aux;
                if (arr[j] > arr[j + 1]){
                    aux = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = aux;
                }
        }
    }
    return arr.ptr;
}