# Conway's Game of Life

## 📌 Overview
- This project demonstrates **John Conway’s Game of Life** using bash script. I have also commented on the sections that are iterative to be clear on what exactly the code does.
---

### 🧠 Rules
- Cell is either on(black)/off(white)
- If a cell has no neighbors alive then it dies
- If a cell has only one neighbor that's alive it dies
- If it has 2 neighbors alive it will stay alive
- Rule for birth - If a cell has exactly 3 alive neighbors it will be born.
- all horizontal, vertical, diagonal are neighbors
---

## 🔁 Iteration
- Nested loops traverse the grid (row × column)
- A loop runs multiple generations (time evolution)
---

## 📂 Project Structure
- Conway.sh - contains the bash script for Conway's Game of Life
- program.cpp - contains the C++ code which I have initially written to understand Conway's Game of Life
---

## 🖥️ Bash Implementation
- Run the script:
```bash
bash game_of_life.sh
```
---

## Demo
![Game of Life](game_of_life1.gif)