User.delete_all
Game.delete_all
Friendship.delete_all
Tag.delete_all
GameTag.delete_all
Comment.delete_all

users = [
  {username: 'david',
   email: 'david@david.com',
   password: 'david'},

  {username: 'diana',
   email: 'diana@diana.com',
   password: 'diana'},

  {username: 'george',
   email: 'george@george.com',
   password: 'george'},

  {username: 'gregor',
   email: 'gregor@gregor.com',
   password: 'gregor'},

  {username: 'tom',
   email: 'tom@tom.com',
   password: 'tom'},

  {username: 'emma',
   email: 'emma@emma.com',
   password: 'emma'},

  {username: 'bob',
   email: 'bob@bob.com',
   password: 'bob'}
]


games = [
  {name: 'Catan',
   description: 'In Catan (formerly The Settlers of Catan), players try to be the dominant force on the island of Catan by building settlements, cities, and roads. On each turn dice are rolled to determine what resources the island produces. Players collect these resources (cards)—wood, grain, brick, sheep, or stone—to build up their civilizations to get to 10 victory points and win the game.',
   creator_id: 4,
   avg_play_time: 90,
   min_players: 3,
   max_players: 4},

  {name: 'Puerto Rico',
   description: 'In Puerto Rico players assume the roles of colonial governors on the island of Puerto Rico. The aim of the game is to amass victory points by shipping goods to Europe or by constructing buildings.',
   creator_id: 3,
   avg_play_time: 120,
   min_players:2,
   max_players:5},

  {name: 'Monopoly',
   description: 'Players take the part of land owners, attempting to buy and then develop their land. Income is gained by other players visiting their properties and money is spent when they visit properties belonging to other players. When times get tough, players may have to mortgage their properties to raise cash for fines, taxes and other misfortunes.',
   creator_id: 2,
   avg_play_time:180,
   min_players:2,
   max_players:8},

  {name: 'Terra Mystica',
   description: 'In the land of Terra Mystica dwell 14 different peoples in seven landscapes, and each group is bound to its own home environment, so to develop and grow, they must terraform neighboring landscapes into their home environments in competition with the other groups.',
   creator_id: 1,
   avg_play_time: 100,
   min_players:2,
   max_players:5},

  {name: 'Agricola',
   description: "In Agricola, you're a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you'll find on a farm: collecting clay, wood, or stone; building fences; and so on. You might think about having kids in order to get more work accomplished, but first you need to expand your house. And what are you going to feed all the little rugrats?",
   creator_id: 4,
   avg_play_time: 90,
   min_players: 1,
   max_players:6},

  {name: 'The campaign for North Africa',
   description: 'This is a war game like no other. Although the map is big (10 feet / 3.048 m) the game is smaller than other games (Europa for one). There are not as many rules as in ASL. And yet this is the biggest monster game out there for a number of reasons. The game is detailed to a degree no other game has come close to. If using the full rules you keep track of every individual plane and pilot in the three year campaign. Each counter on the board representing a ground unit is composed of many units which are kept track of on logs. Supplies are kept track of and dispersed in a very detailed manner.',
   creator_id: 3,
   avg_play_time:60000,
   min_players:4,
   max_players:10},

  {name: 'Coup',
   description: 'You are head of a family in an Italian city-state, a city run by a weak and corrupt court. You need to manipulate, bluff and bribe your way to power. Your object is to destroy the influence of all the other families, forcing them into exile. Only one family will survive...',
   creator_id: 2,
   avg_play_time: 15,
   min_players:2,
   max_players:6},

  {name: 'Pickomino',
   description: "Two to seven players, try to obtain fried worms for their chickens, so that they don't go hungry. Of course, anyone who doesn't manage to grab a worm off of the grill can help himself to those of his opponents. This fast-paced game by Reiner Knizia is, like Hick Hack im Gackelwack, a gambling game in the finest chicken tradition.",
   creator_id: 1,
   avg_play_time:15,
   min_players:2,
   max_players:5}
]

friends = [
  {user_id:1,
   friend_id:2},
  {user_id:1,
   friend_id:3},
  {user_id:2,
   friend_id:3},
  {user_id:2,
   friend_id:4},
  {user_id:3,
   friend_id:4}
]

tags =[
  {name:"Money"},
  {name:"Fun"},
  {name:"Awesome"},
  {name:"Family"},
  {name:"Strategy"},
  {name:"Adventure"},
  {name:"Complicated"}
]

game_tags=[
  {game_id:1,
   tag_id:2},

  {game_id:1,
   tag_id:4},

  {game_id:2,
   tag_id:2},

  {game_id:2,
   tag_id:3},

  {game_id:2,
   tag_id:5},

  {game_id:3,
   tag_id:1},

  {game_id:3,
   tag_id:4},

  {game_id: 4,
   tag_id:5},

  {game_id: 4,
   tag_id:3},

  {game_id: 5,
   tag_id:2},

  {game_id: 5,
   tag_id:4},

  {game_id: 5,
   tag_id:3},

  {game_id:6,
   tag_id:7},

  {game_id:6,
   tag_id:5},

  {game_id: 7,
   tag_id:2},

  {game_id: 7,
   tag_id:3},

  {game_id: 7,
   tag_id:6},

  {game_id: 8,
   tag_id:2},

  {game_id: 8,
   tag_id:4}
]

comments = [
  {body:"This game is awesome!",
   user_id:1,
   game_id:2},
  {body:"My life is over, my wife and kids left me I only have 650 hours left to play. Best game ever!",
   user_id:4,
   game_id:6},
  {body:"Bit simple but fun",
   user_id:3,
   game_id:7},
  {body:"I want to play this game asap!",
   user_id:2,
   game_id: 2}
]

User.create!(users)
Game.create!(games)
Friendship.create!(friends)
Tag.create!(tags)
GameTag.create!(game_tags)
Comment.create!(comments)

