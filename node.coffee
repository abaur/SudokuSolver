connect = require('connect')
server = connect()


sudoku = [[".",".",4,2,".",".",9,".",5],
          [".",3,".",".",".",9,8,7,2],
          [".",".",".",".",".",7,3,4,"."],
          [".",8,3,9,7,".",".",".","."],
          [".",6,".",".",".",".",".",3,"."],
          [".",".",".",".",1,3,2,9,"."],
          [".",7,9,5,".",".",".",".","."],
          [3,2,6,7,".",".",".",5,"."],
          [4,".",8,".",".",1,6,".","."]]


callback = () ->
  console.log('Server running at http://127.0.0.1:8000/')
  console.log(sudoku)
  solveSudoku(sudoku)
  console.log("Sudoku solved \n", sudoku)


server.listen(8000, callback)

solveSudoku = (sudoku) ->
  nodesNotYetAssignedColors = []
  nodesAssignedColors = []
  colorsPresentAmongNeighbours = {}

  for x in [0..8]
    for y in [0..8]
      if sudoku[x][y] != "."
        nodesNotYetAssignedColors.push [x,y]
        colorsPresentAmongNeighbours[[x,y]] = {value : [1..9]}
      else
        nodesAssignedColors.push [x, y]
  
  for node in nodesAssignedColors




  console.log(nodesAssignedColors)
  console.log(nodesNotYetAssignedColors)
  console.log(colorsPresentAmongNeighbours)

getNeighbours = (x,y, sudoky) ->
  for coordinateY in [0..8]
    if sudoku[x][coordinateY] is color
      
      
  for coordinateX in [0..8]
    if sudoku[coordinateX][y] is color
      return false
  startX = Math.floor(x / 3)*3
  startY = Math.floor(y / 3)*3
  console.log("x,y",startX,startY)

  for coordinateX in [0..2]
    for coordinateY in [0..2]
      if sudoku[startX + coordinateX][startY + coordinateY] is color
        return false

  return true
          
colorIsOk = (sudoku, color, x, y) ->  
  for neighbour in getNeighbours(x,y)
    if sudoku[neighbour[0]][neighbour[1]] is color
      return false
  return true