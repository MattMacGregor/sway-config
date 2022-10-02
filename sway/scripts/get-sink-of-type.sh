#! /usr/bin/env bash
typeString="$1[1-9]*: $1.* \(type: $1"
sedString='/Sink #/{:start /pcm/!{N;b start};/'$typeString'/p}'

sinkInfo=`pactl list sinks | sed -E -n "${sedString}"`
echo $( echo "$sinkInfo" | awk '$1=="Sink"{print substr($2, 2)}' )
