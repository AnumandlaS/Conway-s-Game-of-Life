#include <iostream>
#include <vector>
using namespace std;

vector<vector<int>> stateNext(vector<vector<int>> &mat)
{
    int m = mat.size(); //rows
    int n = mat[0].size(); //cols

    // initializing an array of same size as input with all 0's
    vector<vector<int>> nextstate(m, vector<int>(n, 0));

    // As all horizontal, vertical, diagonal boxes are neighbors we have 8 possible directions
    vector<vector<int>> directions =
        {{0, 1}, {1, 0}, {0, -1}, {-1, 0}, {1, 1}, {-1, -1}, {1, -1}, {-1, 1}};

    //For every element in the matrix
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {

            // Count the number of alive neighbors
            int live = 0;
            for (auto dir : directions)
            {
                int x = i + dir[0];
                int y = j + dir[1];

                // First check if its a valid (x,y), then check if its alive
                if (x >= 0 && x < m && y >= 0 && y < n && (mat[x][y] == 1))
                {
                    live++;
                }
            }

            // So, if there are less than 2 or greater than 3 alive neighbors the cell dies
            if (mat[i][j] == 1 && (live < 2 || live > 3))
            {
                nextstate[i][j] = 0;
            }
	        //If there are exactly 3 neighbors the cell becomes alive
            else if (mat[i][j] == 0 && live == 3)
            {
                nextstate[i][j] = 1;
            }
            //else it just stays the same
            else
            {
                nextstate[i][j] = mat[i][j];
            }
        }
    }

    return nextstate;
}

int main() 
{
    vector<vector<int>> mat = {{0, 0, 0, 0}, {0, 0, 1, 0}, {0, 1, 1, 0}, {0, 0, 0, 0}}; // some input
    vector<vector<int>> res = stateNext(mat); //calling the function for the next state of the matrix

    //just printing it
    for (int i = 0; i < res.size(); i++)
    {
        for (int j = 0; j < res[0].size(); j++)
        {
            cout << res[i][j] << " ";
        }
        cout << endl;
    }
    return 0;
} 
