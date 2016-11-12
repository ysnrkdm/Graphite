import Graphene
#if os(Linux)
import Glibc
#else
import Darwin
#endif
setbuf(stdout, nil)

var think = SearchEvalThink(searcher: NegaAlphaSearch(), zones: ZonesFactory.createZoneTypical8(99, bVal: 1.6, cVal: -5, dVal: 7.5, eVal: 6.1, fVal: 4.3, gVal: 4.8, hVal: 5), pnsLessThan: 10, searchDepth: 9, wPossibleMoves: [20.0, 15, 3.2, 1.1], wEdge: [1.0, 1.0], wFixedPieces: [2.0, 200.0], wOpenness: [2.5, 3.5], wBoardEvaluation: [2.5, 5.0])

var board: Board = SimpleBitBoard()

var cont = true

var info = NullInfo()

var color = Pieces.black
while(cont) {
    if let rin = readLine(strippingNewline: true) {
        switch processSfen(playerName: "Graphite", sfen: rin, think: think, board: board, color: color, info: info) {
        case .Quit:
            cont = false
            break
        case let .Game(newBoard):
            board = newBoard
        case let .Moved(newBoard):
            board = newBoard
            color = nextTurn(color)
        }
    } else {
        break
    }
}
