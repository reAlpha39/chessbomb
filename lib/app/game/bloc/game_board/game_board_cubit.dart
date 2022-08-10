import 'package:bloc/bloc.dart';
import 'package:bombernyaa/app/game/models/board_state.dart';
import 'package:flutter/material.dart';
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
  List<String> initialBoardState = boardStateDummy;
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

  List<int> upMove = [];
  List<int> downMove = [];
  List<int> leftMove = [];
  List<int> rightMove = [];

  void resetAll() {
    initialBoardState = boardStateDummy;
    _resetMovement();
    emit(const GameBoardState.initial());
  }

  void resetTempPoint() {
    tempPoint = 0;
  }

  void createBoardIndex() {
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
    // add point +1 for every end turn
    tempPoint += 1;
    if (playerId == '1') {
      playerId = '2';
      enemyId = '1';
    } else {
      playerId = '1';
      enemyId = '2';
    }
    emit(GameBoardState.playerTurn(playerId));
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

  void selectSkillIndex(int index) {
    emit(const GameBoardState.loading());
    skillIndex = index;
    emit(const GameBoardState.selectedSkill());
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

  void activateSkill() {
    switch (skillIndex) {
      case 0:
        _useBomb(bombId: 1);
        changePlayerId();
        break;
      case 1:
        _useBomb(bombId: 2);
        changePlayerId();
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
      } else if (initialBoardState[selectedTiles] == '7.1') {
        initialBoardState[selectedTiles] = '7.0';
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[selectedTiles])) {
        initialBoardState[selectedTiles] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
      }
      //bombId = 1 -> bomb vertical
    } else if (bombId == 1) {
      if (playerPion.contains(tempTile)) {
        _bombVertical(currentIndex: currentIndex);
      }
      //bombId = 2 -> bomb horizontal
    } else if (bombId == 2) {
      if (playerPion.contains(tempTile)) {
        _bombHorizontal(currentIndex: currentIndex);
      }
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
    }
    _resetMovement();
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
    for (int i = 1; i <= 1; i++) {
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
      } else if (initialBoardState[bombIndex[i]] == '7.1') {
        initialBoardState[bombIndex[i]] = '7.0';
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[bombIndex[i]])) {
        initialBoardState[bombIndex[i]] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
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
      } else if (initialBoardState[bombIndex[i]] == '7.1') {
        initialBoardState[bombIndex[i]] = '7.0';
      } else if (pionMapId
          .map((e) => enemyId + e)
          .toList()
          .contains(initialBoardState[bombIndex[i]])) {
        initialBoardState[bombIndex[i]] = '0.0';
        // add point +3 when kill enemy pion
        tempPoint += 3;
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
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isALineBlocked = true;
          } else if (!isALineBlocked) {
            movement.add(index);
          }
        }
      }
      if ((x + i) <= 10) {
        ab = (x + i).toString() + " " + y;
        index = tilesIndex.indexOf(ab);
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isBLineBlocked = true;
          } else if (!isBLineBlocked) {
            movement.add(index);
          }
        }
      }
      if ((yIndex - i) >= 0) {
        ab = x.toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isCLineBlocked = true;
          } else if (!isCLineBlocked) {
            movement.add(index);
          }
        }
      }
      if ((yIndex + i) <= 6) {
        ab = x.toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isDLineBlocked = true;
          } else if (!isDLineBlocked) {
            movement.add(index);
          }
        }
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
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isALineBlocked = true;
          } else if (!isALineBlocked) {
            movement.add(index);
          }
        }
      }
      if ((x - i) >= 1 && (yIndex + i) <= 6) {
        ab = (x - i).toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isBLineBlocked = true;
          } else if (!isBLineBlocked) {
            movement.add(index);
          }
        }
      }
      if ((x + i) <= 10 && (yIndex - i) >= 0) {
        ab = (x + i).toString() + " " + alphabets[(yIndex - i)];
        index = tilesIndex.indexOf(ab);
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isCLineBlocked = true;
          } else if (!isCLineBlocked) {
            movement.add(index);
          }
        }
      }
      if ((x + i) <= 10 && (yIndex + i) <= 6) {
        ab = (x + i).toString() + " " + alphabets[(yIndex + i)];
        index = tilesIndex.indexOf(ab);
        if (isBomb) {
          movement.add(index);
        } else {
          if (initialBoardState[index] == '7.0' ||
              initialBoardState[index] == '7.1') {
            isDLineBlocked = true;
          } else if (!isDLineBlocked) {
            movement.add(index);
          }
        }
      }
    }
  }

  void _lShapeMove(String currentIndex) {
    String ab = '';
    int index = 0;
    int yIndex = 0;
    List<String> xy = currentIndex.split(' ');
    int x = int.parse(xy[0]);
    String y = xy[1];
    yIndex = alphabets.indexOf(y);
    if ((x - 2) >= 1 && (yIndex - 1) >= 0) {
      ab = (x - 2).toString() + " " + alphabets[(yIndex - 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x - 2) >= 1 && (yIndex + 1) <= 6) {
      ab = (x - 2).toString() + " " + alphabets[(yIndex + 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 2) <= 10 && (yIndex - 1) >= 0) {
      ab = (x + 2).toString() + " " + alphabets[(yIndex - 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 2) <= 10 && (yIndex + 1) <= 6) {
      ab = (x + 2).toString() + " " + alphabets[(yIndex + 1)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x - 1) >= 1 && (yIndex - 2) >= 0) {
      ab = (x - 1).toString() + " " + alphabets[(yIndex - 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 1) <= 10 && (yIndex - 2) >= 0) {
      ab = (x + 1).toString() + " " + alphabets[(yIndex - 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x - 1) >= 1 && (yIndex + 2) <= 6) {
      ab = (x - 1).toString() + " " + alphabets[(yIndex + 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
    if ((x + 1) <= 10 && (yIndex + 2) <= 6) {
      ab = (x + 1).toString() + " " + alphabets[(yIndex + 2)];
      index = tilesIndex.indexOf(ab);
      movement.add(index);
    }
  }

  Color boardState(int index) {
    Color colorTile;
    String state = initialBoardState[index];
    switch (state) {
      case '1.0':
        colorTile = Colors.red.shade900;
        break;
      case '1.1':
        colorTile = Colors.red;
        break;
      case '1.2':
        colorTile = Colors.red;
        break;
      case '1.3':
        colorTile = Colors.red;
        break;
      case '1.4':
        colorTile = Colors.red;
        break;
      case '1.5':
        colorTile = Colors.red;
        break;
      case '2.0':
        colorTile = Colors.yellow.shade900;
        break;
      case '2.1':
        colorTile = Colors.yellow;
        break;
      case '2.2':
        colorTile = Colors.yellow;
        break;
      case '2.3':
        colorTile = Colors.yellow;
        break;
      case '2.4':
        colorTile = Colors.yellow;
        break;
      case '2.5':
        colorTile = Colors.yellow;
        break;
      case '3.0':
        colorTile = Colors.white;
        break;
      case '4.0':
        colorTile = Colors.white;
        break;
      case '5.0':
        colorTile = Colors.white;
        break;
      case '6.0':
        colorTile = Colors.white;
        break;
      case '7.0':
        colorTile = Colors.brown;
        break;
      case '7.1':
        colorTile = Colors.brown.shade700;
        break;
      case '8.0':
        colorTile = Colors.white;
        break;
      default:
        colorTile = Colors.white;
    }
    return colorTile;
  }
}
