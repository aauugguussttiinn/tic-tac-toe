Welcome to THE FINAL TIC-TAC-TOE!

It is a really fun and famous game. It is very funny and easy to play. You just need someone to play with you.

..............................................START A GAME ..............................................

To start a game, you have to open your Terminal and run the "game.rb" file, using the "ruby game.rb" command.

Once launched, the program will ask each player, the name they want to be called.

Then you will have a grid with 9 boxes, each one associated to a code ("A1", "A2", etc ... until "C3") such as below :

|--------------|
| A1 | A2 | A3 |
|--------------|
| B1 | B2 | B3 |
|--------------|
| C1 | C2 | C3 |
|--------------|

............................................... PLAYING ...............................................

Player 1, will play first.
Player 1 will have to choose one of the previously mentionned codes to select the box he wants to tick (ex : A1)
Once selected, a "X" will appear in the corresponding box which will then be unavailable for the rest of the game.

Then player 2 will do the exact same thing.
On a box selected by Player 2, a "O" will appear in the corresponding box which will then be unavailable for the rest of the game.

Here is an exemple of what the board may look like after a first round :

|-------------|
| O | A2 | A3 |
|-------------|
| B1 | X | B3 |
|-------------|
| C1 | C2 | C3 |
|-------------|

Then the game goes on : player 1 plays again, then player 2 etc.

............................................... WINNING ...............................................

The objective is to complete a 3-box line for each player such as in the exemples below :

|-----------|
| O | X | O |
|-----------|
| X | O | X |
|-----------|
| O | C2 | X |
|-----------|

> > Here making a line through A3, B2 and C1, player 2 wins.

|------------|
| X | O | A3 |
|------------|
| X | X | X |
|------------|
| O | C2 | O |
|------------|

> > Here making a line through B1, B2 and B3, player 1 wins.

A draw game is possible, if the board is full and no player achieved a 3-box line such as below

|-----------|
| X | X | O |
|-----------|
| O | 0 | X |
|-----------|
| X | X | O |
|-----------|

............................................. LOVING IT .............................................

When the game ends, you can play again, answering "Yes" to the final question

Have fun !
