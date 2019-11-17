def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  hash = game_hash
  hash.each do |team, info|
    info.each do |attribute, list|
      if list.include?(player_name)
       player = hash[team][attribute][player_name]
       return player[:points]
      end
    end
  end
end

def shoe_size(player_name)
  hash = game_hash
  hash.each do |team, info|
    info.each do |attribute, list|
      if list.include?(player_name)
       player = hash[team][attribute][player_name]
       return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  hash = game_hash
  hash.each do |team, attributes|
    if hash[team].values.include?(team_name)
      attributes.each do |attribute, info|
        if attribute == :colors
          return info
        end
      end
    end
  end
end

def team_names
  game_hash.map do |team, team_info|
    team_info[:team_name]
  end
end

def player_numbers(team_name)
  hash = game_hash
  jersey_numbers = []
    hash.each do |team, attributes|
      if hash[team].values.include?(team_name)
        attributes.each do |attribute, info|
          if info.class == Hash
            info.each do |player, stats|
              stats.each do |stat, int|
                if stat == :number
                  jersey_numbers << int.to_i
                end
              end
            end
          end
        end
      end
    end
    return jersey_numbers
end

def player_stats(player_name)
  hash = game_hash
  hash.each do |team, info|
    info.each do |attribute, list|
      if list.include?(player_name)
       player = hash[team][attribute][player_name]
       return player
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
    player_name = ""
    shoe_size = 0
    hash.each do |team, attributes|
      attributes.each do |attribute, info|
        if info.class == Hash
          info.each do |player, stats|
              stats.each do |stat, int|
                if stat == :shoe
                  if int > shoe_size
                    shoe_size = int
                    player_name = player
                  end
                end
              end
            end
          return hash[team][attribute][player_name][:rebounds]
        end
      end
    end
end

def most_points_scored
  most_points = 0
  points_owner = ""
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        points_owner = player[:player_name]
      end
    end
  end
  return points_owner
end

def winning_team
  away_total = 0
  home_total = 0
    game_hash[:away][:players].each do |name, stats|
      away_total += stats[:points]
    end
    game_hash[:home][:players].each do |name, stats|
      home_total += stats[:points]
    end
    if away_total > home_total
       game_hash[:away][:team_name]
    elsif away_total < home_total
       game_hash[:home][:team_name]
    else
      "It's a tie!"
    end
end

def player_with_longest_name

end

def long_name_steals_a_ton?

end
