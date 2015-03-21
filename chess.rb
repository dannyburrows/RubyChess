#!/usr/bin/env ruby

# Chess

class Board
  # board is 8 x 8
  # letters are horizontal
  # numbers are vertical
  # properties
  #occupied
  @board = nil

  def initialize
      @board = Hash.new(0)
      ("a".."h").to_a.each do |letter|
        (1..8).to_a.each do |num|
          @board[letter+num.to_s] = nil
      end
    end
  end

  # displays board
  # TODO | Make pretty
  def display
    @board.each do |key, value|
      puts "#{key} - #{value}"
    end
  end

  # returns if a specific coordinate has a piece
  def is_coordinate_occupied(coordinate)
    @board[coordinate].nil?
  end

  # assign coordinate to a specifc piece class
  def set_coordinate_piece(coordinate, piece)
    @board[coordinate] = piece
  end

  def get_coordinate_piece(coordinate)
    @board[coordinate]
  end
end

class Game
  # get / set
  attr_accessor :board

  # Board
  def initialize
    @board = Board.new
      # Two players
    @player1 = Player.new("black")
    @player2 = Player.new("white")
  end

  # check win conditions
  def is_check
  end

  def is_checkmate
  end
end

# player objcet
class Player
  attr_accessor :color, :player_piece_set

  # list of pieces still on board
  # list of pieces that have been taken
  def initialize(color)
    @color = color
    # hash of all pieces and their current positions
    @player_piece_set = Hash.new(0)
    @pieces = Hash.new

    # assign each player a full set of pieces
  end

  def assign_pieces(color)
    piece_names = ['King', 'Queen', 'Bishop', 'Knight', 'Rook', 'Pawn']
    # assign pawns
    ('@a'..'h').to_a.each do |letter|
      color == 'black' ? start_position_number = 7 : start_position_number = 2
      @player_piece_set['Pawn'] = [letter+start_position.to_s, Pawn.new]
    end
    # assign king
    color == 'black' ? @player_piece_set['King'] = ['e8',King.new] : @player_piece_set['King'] = ['e1',King.new]
    # assign queen
    color == 'black' ? @player_piece_set['Queen'] = ['d8',Queen.new] : @player_piece_set['Queen'] = ['d1',Queen.new]
    # assign bishop
    @color == 'black' ? @player_piece_set['Bishop'] = ['c8',Bishop.new] : @player_piece_set['Bishop'] = ['c1',Bishop.new]
    color == 'black' ? @player_piece_set['Bishop'] = ['f8',Bishop.new] : @player_piece_set['Bishop'] = ['f1',Bishop.new]
    # assign knight
    @color == 'black' ? @player_piece_set['Knight'] = ['b8',Knight.new] : @player_piece_set['Knight'] = ['b1',Knight.new]
    color == 'black' ? @player_piece_set['Knight'] = ['g8',Knight.new] : @player_piece_set['Knight'] = ['g1',Knight.new]
    # assign rook
    @color == 'black' ? @player_piece_set['Rook'] = ['a8',Rook.new] : @player_piece_set['Rook'] = ['a1',Rook.new]
    @color == 'black' ? @player_piece_set['Rook'] = ['h8',Rook.new] : @player_piece_set['Rook'] = ['h1',Rook.new]
  end
end

class Piece
  attr_accessor :taken,
                :has_moved,
                :can_move_vertical,
                :can_move_horizontal,
                :can_move_diagonol,
                :num_spaces_move_horizontal,
                :num_spaces_move_vertical,
                :num_spaces_move_diagonal
  # A piece can move and it can attack


  @taken = false
  @has_moved = false

  @can_move_vertical = false
  @can_move_horizontal = false
  @can_move_diagonol = false
  @num_spaces_move_horizontal = 0
  @num_spaces_move_vertical = 0
  @num_spaces_move_diagonal = 0

  @start_position = nil
  # ever piece will belong to a player color
  def initialize
  end

  # to be overriden by the inherting class  end
  def moves_available
    # return what moves are available to this piec
  end

  def moved?
    @has_moved
  end

  def taken?
    @taken
  end
end

class King < Piece
  # movement patter for each piece
  def movment_pattern
  end
end

class Queen < Piece
end

class Bishop < Piece
end

class Knight < Piece
end

class Rook < Piece
end

class Pawn < Piece
end
