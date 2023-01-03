import 'package:bloc/bloc.dart';
import 'package:bombernyaa/app/game/models/board_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'game_board_state.dart';
part 'game_board_cubit.freezed.dart';

@injectable
class GameBoardCubit extends Cubit<GameBoardState> {
  GameBoardCubit() : super(const GameBoardState.initial());

  String playerId = '1';
  String enemyId = '2';
  static const String flagMapId = '.0';
  static const List<String> pionMapId = ['.1', '.2', '.3', '.4', '.5'];

  static const List<String> alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  List<String> initialBoardState = [];
  int tempTile = -1;
  int selectedTiles = -1;
  int lastIndex = -1;
  List<String> tilesIndex = [];
  List<int> movement = [];
  List<int> playerPion = [];
  List<int> enemyPion = [];
  List<int> selectableBuildWall = [];
  int rolledNumber = 0;
  bool isPickPion = false;
  bool isBomb = false;
  bool buildWall = false;
  int skillIndex = -1;
  bool haveChooseStrategy = false;

  int tempPoint = 0;
  int tempScore = 0;

  // Skill price
  // Vertical & horizontal bomb = 10
  // Free move = 15
  // Free space = 5
  List<int> skillPrices = [10, 10, 15, 5];

  List<int> upMove = [];
  List<int> downMove = [];
  List<int> leftMove = [];
  List<int> rightMove = [];

  void resetTempPointAndScore() {
    tempPoint = 0;
    tempScore = 0;
  }

  void forceEndGame() {
    emit(const GameBoardState.loading());
    _resetMovement();
    emit(const GameBoardState.gameFinished());
  }

  void createBoardIndex({bool debugModelA = false, bool debugModelB = false}) {
    // Initial Board State
    if (debugModelA) {
      initialBoardState.addAll(boardStateDebugModelA);
    } else if (debugModelB) {
      initialBoardState.addAll(boardStateDebugModelB);
    } else {
      initialBoardState.addAll(boardStateDummy);
    }

    List<String> temp = [];
    for (int i = 1; i <= 10; i++) {
      for (int j = 0; j <= 6; j++) {
        String index = i.toString() + " " + alphabets[j];
        temp.add(index);
      }
    }
    tilesIndex.addAll(temp);
  }

  void changePlayerId() {
    if (_isEnemiesNotExist()) {
      // finished the game if no enemy exist
      emit(const GameBoardState.gameFinished());
      return;
    }
    // add point +1 for every end turn
    tempPoint += 1;
    tempScore += 1;
    if (playerId == '1') {
      playerId = '2';
      enemyId = '1';
    } else {
      playerId = '1';
      enemyId = '2';
    }
    _resetMovement();
    emit(GameBoardState.playerTurn(playerId));
  }

  // check if no enemy exist
  bool _isEnemiesNotExist() {
    var isEnemyNotExist = true;
    for (var i = 0; i < initialBoardState.length; i++) {
      if (initialBoardState[i]
          .contains(RegExp(r'^(' + enemyId + r'*\.[1-5]+)?$'))) {
        isEnemyNotExist = false;
        break;
      }
    }
    return isEnemyNotExist;
  }

  void _resetMovement() {
    emit(const GameBoardState.loading());
    movement = [];
    playerPion = [];
    enemyPion = [];
    selectedTiles = -1;
    lastIndex = -1;
    haveChooseStrategy = false;
    buildWall = false;
    rolledNumber = 0;
    skillIndex = -1;
    upMove = [];
    downMove = [];
    leftMove = [];
    rightMove = [];
    emit(const GameBoardState.initial());
  }

  void rollNumber(int number) {
    rolledNumber = number;
  }

  void selectTile(int index) {
    tempTile = index;
  }

  void chooseStrategy({bool isMovePlayer = false}) {
    emit(const GameBoardState.loading());
    haveChooseStrategy = true;
    if (isMovePlayer) {
      isBomb = false;
    } else {
      isBomb = true;
    }

    _playerMovement();

    if (movement.isEmpty) {
      emit(const GameBoardState.error());
    } else {
      emit(const GameBoardState.selectedStrategy());
    }
  }

  void definePlayerIndex() {
    playerPion = [];
    enemyPion = [];
    for (int i = 0; i < initialBoardState.length; i++) {
      List<String> id = initialBoardState[i].split('.');
      if (id[0] == playerId && id[1] != '0') {
        playerPion.add(i);
      } else if (id[0] == enemyId && id[1] != '0') {
        enemyPion.add(i);
      }
    }
  }

  void pickPion() {
    emit(const GameBoardState.loading());
    if (playerPion.contains(tempTile)) {
      lastIndex = selectedTiles;
      selectedTiles = tempTile;
      emit(const GameBoardState.selectedTiles());
    }
  }

  void pickTileDest() {
    if (movement.contains(tempTile)) {
      emit(const GameBoardState.loading());
      lastIndex = selectedTiles;
      selectedTiles = tempTile;

      if (isBomb) {
        _useBomb(bombId: 0);
        changePlayerId();
        _resetMovement();
      } else if (!isBomb) {
        _movePion();
      }

      emit(const GameBoardState.updateBoard());
    }
  }

  void activateSkill(int index) {
    skillIndex = index;
    tempPoint -= skillPrices[skillIndex];
    switch (skillIndex) {
      case 0:
        if (playerPion.contains(tempTile)) {
          _useBomb(bombId: 1);
          changePlayerId();
        }

        break;
      case 1:
        if (playerPion.contains(tempTile)) {
          _useBomb(bombId: 2);
          changePlayerId();
        }
        break;
      case 2:
        _freeSpaceMove();
        break;
      case 3:
        _createWallBang();
        break;
      default:
    }
  }

  void _movePion() {
    if (!playerPion.contains(selectedTiles)) {
      emit(const GameBoardState.loading());
      String pion = initialBoardState[lastIndex];
      if (initialBoardState[selectedTiles] == '7.0' ||
          initialBoardState[selectedTiles] == '7.1') {
        selectedTiles = lastIndex;
        emit(const GameBoardState.error());
      } else if (initialBoardState[selectedTiles] == enemyId + flagMapId) {
        initialBoardState[selectedTiles] = pion;
        initialBoardState[lastIndex] = '0.0';
        emit(const GameBoardState.gameFinished());
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[selectedTiles])) {
        initialBoardState[selectedTiles] = pion;
        initialBoardState[lastIndex] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
        tempScore += 3;
        changePlayerId();
        _resetMovement();
      } else {
        initialBoardState[selectedTiles] = pion;
        initialBoardState[lastIndex] = '0.0';
        changePlayerId();
        _resetMovement();
      }
    }
  }

  void _useBomb({required int bombId}) {
    String currentIndex = tilesIndex[tempTile];
    //bombId = 0 -> bomb normal
    if (bombId == 0) {
      if (initialBoardState[selectedTiles] == '7.0') {
        initialBoardState[selectedTiles] = '0.0';
        // add point +2 when wall destroyed
        tempPoint += 2;
        tempScore += 2;
      } else if (initialBoardState[selectedTiles] == '7.1') {
        initialBoardState[selectedTiles] = '7.0';
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[selectedTiles])) {
        initialBoardState[selectedTiles] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
        tempScore += 3;
      }
      //bombId = 1 -> bomb vertical
    } else if (bombId == 1) {
      _bombVertical(currentIndex: currentIndex);

      //bombId = 2 -> bomb horizontal
    } else if (bombId == 2) {
      _bombHorizontal(currentIndex: currentIndex);
    } else {
      isBomb = false;
      bombId = 0;
    }
  }

  void _playerMovement() {
    movement = [];
    String currentIndex = tilesIndex[selectedTiles];
    switch (rolledNumber) {
      case 1:
        _straightMove(currentIndex, 1);
        break;
      case 2:
        _straightMove(currentIndex, 2);
        break;
      case 3:
        _straightMove(currentIndex, 3);
        break;
      case 4:
        _diagonalMove(currentIndex, 1);
        break;
      case 5:
        _diagonalMove(currentIndex, 2);
        break;
      case 6:
        _diagonalMove(currentIndex, 3);
        break;
      case 7:
        _lShapeMove(currentIndex);
        break;
      default:
    }
    movement.removeWhere((element) =>
        playerPion.contains(element) ||
        initialBoardState[element] == playerId + flagMapId);
  }

  void _createWallBang() {
    if (playerPion.contains(tempTile)) {
      selectedTiles = tempTile;
      String currentIndex = tilesIndex[selectedTiles];

      _wallBang(currentIndex: currentIndex);

      emit(const GameBoardState.updateBoard());
      changePlayerId();
      _resetMovement();
    }
  }

  void _freeSpaceMove() {
    if (playerPion.contains(tempTile)) {
      emit(const GameBoardState.loading());
      isBomb = false;
      movement = [];
      lastIndex = selectedTiles;
      selectedTiles = tempTile;
      String currentIndex = tilesIndex[selectedTiles];
      _straightMove(currentIndex, 1);
      _diagonalMove(currentIndex, 1);
      movement.removeWhere((element) =>
          playerPion.contains(element) ||
          initialBoardState[element] == playerId + flagMapId);

      emit(const GameBoardState.selectedStrategy());
    }
  }

  void _wallBang({required String currentIndex}) {
    String playerId = initialBoardState[selectedTiles].split('.')[0];
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    List<int> wallIndex = [];
    int i = 1;

    yIndex = alphabets.indexOf(y);
    if (playerId == '2' && (x + i) <= 10) {
      ab = (x + i).toString() + " " + y;
      index = tilesIndex.indexOf(ab);
      wallIndex.add(index);
    }
    if (playerId == '1' && (x - i) >= 1) {
      ab = (x - i).toString() + " " + y;
      index = tilesIndex.indexOf(ab);
      wallIndex.add(index);
    }

    xy = ab.split(' ');
    x = int.parse(xy[0]);
    if ((x - i) >= 1) {
      ab = x.toString() + " " + alphabets[(yIndex + i)];
      index = tilesIndex.indexOf(ab);
      wallIndex.add(index);
    }
    if ((x + i) <= 10) {
      ab = x.toString() + " " + alphabets[(yIndex - i)];
      index = tilesIndex.indexOf(ab);
      wallIndex.add(index);
    }

    wallIndex.removeWhere((element) =>
        playerPion.contains(element) ||
        enemyPion.contains(element) ||
        initialBoardState[element] == playerId + flagMapId ||
        initialBoardState[element] == enemyId + flagMapId);

    for (int i = 0; i < wallIndex.length; i++) {
      initialBoardState[wallIndex[i]] = '7.1';
    }
  }

  void _bombVertical({required String currentIndex}) {
    String ab = '';
    int index = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    List<int> bombIndex = [];
    for (int i = 1; i <= 2; i++) {
      if ((x - i) >= 1) {
        ab = (x - i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        bombIndex.add(index);
      }
      if ((x + i) <= 10) {
        ab = (x + i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        bombIndex.add(index);
      }
    }
    for (int i = 0; i < bombIndex.length; i++) {
      if (initialBoardState[bombIndex[i]] == '7.0') {
        initialBoardState[bombIndex[i]] = '0.0';
        // add point +2 when wall destroyed
        tempPoint += 2;
        tempScore += 2;
      } else if (initialBoardState[bombIndex[i]] == '7.1') {
        initialBoardState[bombIndex[i]] = '7.0';
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[bombIndex[i]])) {
        initialBoardState[bombIndex[i]] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
        tempScore += 3;
      }
    }
  }

  void _bombHorizontal({required String currentIndex}) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    List<int> bombIndex = [];
    for (int i = 1; i <= 2; i++) {
      yIndex = alphabets.indexOf(y);
      if ((yIndex - i) >= 0) {
        ab = x.toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        bombIndex.add(index);
      }
      if ((yIndex + i) <= 6) {
        ab = x.toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        bombIndex.add(index);
      }
    }
    for (int i = 0; i < bombIndex.length; i++) {
      if (initialBoardState[bombIndex[i]] == '7.0') {
        initialBoardState[bombIndex[i]] = '0.0';
        // add point +2 when wall destroyed
        tempPoint += 2;
        tempScore += 2;
      } else if (initialBoardState[bombIndex[i]] == '7.1') {
        initialBoardState[bombIndex[i]] = '7.0';
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[bombIndex[i]])) {
        initialBoardState[bombIndex[i]] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
        tempScore += 3;
      }
    }
  }

  _straightMove(String currentIndex, int jumpedTile) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];

    bool isALineBlocked = false;
    bool isBLineBlocked = false;
    bool isCLineBlocked = false;
    bool isDLineBlocked = false;

    for (int i = 1; i <= jumpedTile; i++) {
      yIndex = alphabets.indexOf(y);
      if ((x - i) >= 1) {
        ab = (x - i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        isALineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isALineBlocked,
        );
      }
      if ((x + i) <= 10) {
        ab = (x + i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        isBLineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isBLineBlocked,
        );
      }
      if ((yIndex - i) >= 0) {
        ab = x.toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        isCLineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isCLineBlocked,
        );
      }
      if ((yIndex + i) <= 6) {
        ab = x.toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        isDLineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isDLineBlocked,
        );
      }
    }
  }

  _diagonalMove(String currentIndex, int jumpedTile) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];

    bool isALineBlocked = false;
    bool isBLineBlocked = false;
    bool isCLineBlocked = false;
    bool isDLineBlocked = false;

    for (int i = 1; i <= jumpedTile; i++) {
      yIndex = alphabets.indexOf(y);
      if ((x - i) >= 1 && (yIndex - i) >= 0) {
        ab = (x - i).toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        isALineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isALineBlocked,
        );
      }
      if ((x - i) >= 1 && (yIndex + i) <= 6) {
        ab = (x - i).toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        isBLineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isBLineBlocked,
        );
      }
      if ((x + i) <= 10 && (yIndex - i) >= 0) {
        ab = (x + i).toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        isCLineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isCLineBlocked,
        );
      }
      if ((x + i) <= 10 && (yIndex + i) <= 6) {
        ab = (x + i).toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        isDLineBlocked = _removeMovement(
          index: index,
          isLineBlocked: isDLineBlocked,
        );
      }
    }
  }

  void _lShapeMove(String currentIndex) {
    String ab = '';
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];

    List<bool> isLinesBlocked = List.generate(4, (index) => false);
    List<int> listIndex = List.generate(4, (index) => 0);

    // validate movement (1/2)
    for (int i = 1; i <= 2; i++) {
      yIndex = alphabets.indexOf(y);
      if ((x - i) >= 1) {
        ab = (x - i).toString() + " " + y;
        listIndex[0] = tilesIndex.indexOf(ab);
        isLinesBlocked[0] = _removeMovement(
          forceRemoveMovement: true,
          index: listIndex[0],
          isLineBlocked: isLinesBlocked[0],
        );
      } else {
        listIndex[0] = 0;
      }
      if ((x + i) <= 10) {
        ab = (x + i).toString() + " " + y;
        listIndex[1] = tilesIndex.indexOf(ab);
        isLinesBlocked[1] = _removeMovement(
          forceRemoveMovement: true,
          index: listIndex[1],
          isLineBlocked: isLinesBlocked[1],
        );
      } else {
        listIndex[1] = 0;
      }
      if ((yIndex - i) >= 0) {
        ab = x.toString() + " " + alphabets[(yIndex - i)];
        listIndex[2] = tilesIndex.indexOf(ab);
        isLinesBlocked[2] = _removeMovement(
          forceRemoveMovement: true,
          index: listIndex[2],
          isLineBlocked: isLinesBlocked[2],
        );
      } else {
        listIndex[2] = 0;
      }
      if ((yIndex + i) <= 6) {
        ab = x.toString() + " " + alphabets[(yIndex + i)];
        listIndex[3] = tilesIndex.indexOf(ab);
        isLinesBlocked[3] = _removeMovement(
          forceRemoveMovement: true,
          index: listIndex[3],
          isLineBlocked: isLinesBlocked[3],
        );
      } else {
        listIndex[3] = 0;
      }
    }

    // reset dummy movement
    movement = [];

    for (int i = 0; i <= 3; i++) {
      if (listIndex[i] > 0) {
        int index = 0;
        String newIndex = tilesIndex[listIndex[i]];
        List<String> xyB = newIndex.split(" ");
        int xB = int.parse(xyB[0]);
        String yB = xyB[1];
        int yBIndex = alphabets.indexOf(yB);
        if (xB == x && (xB - 1) >= 1 && i >= 1) {
          ab = (xB - 1).toString() + " " + yB;
          index = tilesIndex.indexOf(ab);
          _removeMovement(
            index: index,
            isLineBlocked: isLinesBlocked[i],
          );
        }
        if (xB == x && (xB + 1) <= 10 && i >= 1) {
          ab = (xB + 1).toString() + " " + yB;
          index = tilesIndex.indexOf(ab);
          _removeMovement(
            index: index,
            isLineBlocked: isLinesBlocked[i],
          );
        }
        if (yB == y && (yBIndex - 1) >= 0 && i <= 1) {
          ab = xB.toString() + " " + alphabets[(yBIndex - 1)];
          index = tilesIndex.indexOf(ab);
          _removeMovement(
            index: index,
            isLineBlocked: isLinesBlocked[i],
          );
        }
        if (yB == y && (yBIndex + 1) <= 6 && i <= 1) {
          ab = xB.toString() + " " + alphabets[(yBIndex + 1)];
          index = tilesIndex.indexOf(ab);
          _removeMovement(
            index: index,
            isLineBlocked: isLinesBlocked[i],
          );
        }
      }
    }

    List<int> placeHolderMovement = movement;
    movement = [];

    _straightMove(currentIndex, 1);
    _diagonalMove(currentIndex, 1);

    List<int> tempMovement = movement;
    movement = [];

    // validate movement (2/2)
    if (x > 1 && yIndex > 0) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex - 1)])) &&
          yIndex >= 2) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex - 2)]),
          isLineBlocked: false,
        );
      }
    }

    if (x > 1 && yIndex < 6) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex + 1)])) &&
          yIndex <= 3) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex + 2)]),
          isLineBlocked: false,
        );
      }
    }

    if (x < 10 && yIndex > 0) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex - 1)])) &&
          yIndex >= 2) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex - 2)]),
          isLineBlocked: false,
        );
      }
    }

    if (x < 10 && yIndex < 6) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex + 1)])) &&
          yIndex <= 3) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex + 2)]),
          isLineBlocked: false,
        );
      }
    }

    if (x > 1 && yIndex > 0) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x).toString() + " " + alphabets[(yIndex - 1)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex - 1)])) &&
          x >= 3) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x - 2).toString() + " " + alphabets[(yIndex - 1)]),
          isLineBlocked: false,
        );
      }
    }

    if (x < 10 && yIndex > 0) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x).toString() + " " + alphabets[(yIndex - 1)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex - 1)])) &&
          x <= 8) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x + 2).toString() + " " + alphabets[(yIndex - 1)]),
          isLineBlocked: false,
        );
      }
    }

    if (x > 1 && yIndex < 6) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x).toString() + " " + alphabets[(yIndex + 1)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x - 1).toString() + " " + alphabets[(yIndex + 1)])) &&
          x >= 3) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x - 2).toString() + " " + alphabets[(yIndex + 1)]),
          isLineBlocked: false,
        );
      }
    }

    if (x < 10 && yIndex < 6) {
      if (tempMovement.contains(tilesIndex
              .indexOf((x).toString() + " " + alphabets[(yIndex + 1)])) &&
          tempMovement.contains(tilesIndex
              .indexOf((x + 1).toString() + " " + alphabets[(yIndex + 1)])) &&
          x <= 8) {
        _removeMovement(
          index: tilesIndex
              .indexOf((x + 2).toString() + " " + alphabets[(yIndex + 1)]),
          isLineBlocked: false,
        );
      }
    }

    // remove duplicate
    movement.addAll(placeHolderMovement);
    movement = movement.toSet().toList();
  }

  /// Remove selectable tile if it blocked by wall
  bool _removeMovement({
    required int index,
    required bool isLineBlocked,
    bool forceRemoveMovement = false,
  }) {
    if (isBomb) {
      movement.add(index);
    } else {
      if (initialBoardState[index] == '7.0' ||
          initialBoardState[index] == '7.1') {
        isLineBlocked = true;
      } else if (!isLineBlocked && !forceRemoveMovement) {
        movement.add(index);
      }
    }
    return isLineBlocked;
  }

  String boardState(int index) {
    String imagePath = '';
    String state = initialBoardState[index];
    switch (state) {
      case '1.0':
        imagePath = 'assets/images/pion/king_player_1.png';
        break;
      case '1.1':
        imagePath = 'assets/images/pion/pion_player_1.png';
        break;
      case '1.2':
        imagePath = 'assets/images/pion/pion_player_1.png';
        break;
      case '1.3':
        imagePath = 'assets/images/pion/pion_player_1.png';
        break;
      case '1.4':
        imagePath = 'assets/images/pion/pion_player_1.png';
        break;
      case '1.5':
        imagePath = 'assets/images/pion/pion_player_1.png';
        break;
      case '2.0':
        imagePath = 'assets/images/pion/king_player_2.png';
        break;
      case '2.1':
        imagePath = 'assets/images/pion/pion_player_2.png';
        break;
      case '2.2':
        imagePath = 'assets/images/pion/pion_player_2.png';
        break;
      case '2.3':
        imagePath = 'assets/images/pion/pion_player_2.png';
        break;
      case '2.4':
        imagePath = 'assets/images/pion/pion_player_2.png';
        break;
      case '2.5':
        imagePath = 'assets/images/pion/pion_player_2.png';
        break;
      case '3.0':
        imagePath = '';
        break;
      case '4.0':
        imagePath = '';
        break;
      case '5.0':
        imagePath = '';
        break;
      case '6.0':
        imagePath = '';
        break;
      case '7.0':
        imagePath = 'assets/images/pion/wall_tipis.png';
        break;
      case '7.1':
        imagePath = 'assets/images/pion/wall_tebal.png';
        break;
      case '8.0':
        imagePath = '';
        break;
      default:
        imagePath = '';
    }
    return imagePath;
  }
}
