#!/bin/bash
# Hello, my name is Siri Anumandla. This file consists of bash code for the Conway's Game of Life. If you do have time please 
# check my github repository - https://github.com/AnumandlaS/Conway-s-Game-of-Life.git. Here I have written some notes on what I 
# have learnt to complete the task, as well as there is a small animation which clearly displays Conway's Game of Life and also
# contains the C++ code which I initially wrote as I didn't know about Conway's Game fo Life before.
ROWS=4
COLS=4

# Flattened 2D array as we cannot have 2d array like in C++
mat=(0 0 0 0
     0 0 1 0
     0 1 1 0
     0 0 0 0)

# As all horizontal, vertical, diagonal boxes are neighbors we have 8 possible directions
dx=(0 1 0 -1 1 -1 1 -1)
dy=(1 0 -1 0 1 -1 -1 1)

# Function to get index in the flattened array
get_index() {
  echo $(($1 * COLS + $2))
}

# Function to compute next state
stateNext() {
  local next=()

  #For every element in the matrix
  for ((i=0; i<ROWS; i++)); do
    for ((j=0; j<COLS; j++)); do

      live=0

      # Count the number of alive neighbors
      for ((k=0; k<8; k++)); do
        x=$((i + dx[k]))
        y=$((j + dy[k]))

        # First check if its a valid (x,y), then check if its alive
        if (( x>=0 && x<ROWS && y>=0 && y<COLS )); then
          idx=$(get_index $x $y)
          if (( ${mat[idx]} == 1 )); then
            ((live++))
          fi
        fi
      done

      idx=$(get_index $i $j)

      #So, if there are less than 2 or greater than 3 alive neighbors the cell dies
      if (( ${mat[idx]} == 1 && (live < 2 || live > 3) )); then
        next[idx]=0
      #If there are exactly 3 neighbors the cell becomes alive
      elif (( ${mat[idx]} == 0 && live == 3 )); then
        next[idx]=1
      #else it just stays the same
      else
        next[idx]=${mat[idx]}
      fi

    done
  done

  mat=("${next[@]}")
}

# Run one iteration
stateNext

# Just to print the matrix
for ((i=0; i<ROWS; i++)); do
  for ((j=0; j<COLS; j++)); do
    idx=$(get_index $i $j)
    echo -n "${mat[idx]} "
  done
  echo
done