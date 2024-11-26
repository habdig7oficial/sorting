module merge_sort;

import std.stdio;
import std.parallelism;
import core.memory;


float[] split_arr(float[] arr){
    float[] head;
    float[] tail;

    if(arr.length == 1){
        return arr;
    }
    if(arr.length % 2 == 1){
        arr ~= float.max;
    }


    head = arr[0..(arr.length / 2)];
    tail = arr[(arr.length / 2 )..arr.length];

    writeln("head: ", head);
    writeln("tail: ", tail);
    head = split_arr(head);
    tail = split_arr(tail);

    for (int i,j,index = 0; (i < head.length) && (j < tail.length);i++){
        if(head[i] < tail[j]){
            arr[index] = head[i];
            i++;
        }
        else{
            arr[index] = tail[j];
            j++;
        }
        writeln(arr);
    }


    return head ~ tail;
}


extern (C) float * merge_sort(float * ptr, int len){
    float[] arr = ptr[0..len];

    arr = split_arr(arr);
    writeln(arr);
    return arr.ptr;

}