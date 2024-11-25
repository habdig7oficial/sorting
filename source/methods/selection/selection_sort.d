module selection_sort;

import std.stdio;
import core.memory;


struct Min{
    float value;
    int index;
}

Min min(float[] arr){
    GC.disable;
    Min min_value = {
        value: arr[0],
        index:  0
    };
    for(int i = 0; i < arr.length; i++){
        if(arr[i] < min_value.value){
           min_value.value = arr[i];
           min_value.index = i;
        }
    }
    writeln(min_value);
    return min_value;
}

extern (C) float * selection_sort(float * ptr, int len){
    GC.disable;

    float[] arr = ptr[0..len];

    for(int i = 0; i < arr.length - 2; i++){
        Min min_value = min(arr[i..(arr.length)]);
        arr[min_value.index + i] = arr[i];
        arr[i] = min_value.value;
        
        writeln(arr);
    }

    return arr.ptr;

}