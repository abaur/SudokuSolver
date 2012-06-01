connect = require('connect')
server = connect()

server.listen(8000, ()-> console.log('Server running at http://127.0.0.1:8000/'))

sudoku = [[],[],[],[],[],[],[],[],[]]

