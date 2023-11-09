# API Routes Documentation

## Users Resource
- **GET /api/v1/users**: Retrieve a list of users (Index).
    - Example Response {
  "users": [
    {
      "id": 1,
      "username": "user1",
      "email": "user1@example.com",
      "created_at": "2023-11-01T12:00:00Z"
    },
    {
      "id": 2,
      "username": "user2",
      "email": "user2@example.com",
      "created_at": "2023-11-02T13:00:00Z"
    }
  ]
}
- **GET /api/v1/users/:id**: Retrieve information about a specific user (Show).
    - Example Response {
  "user": {
    "id": 1,
    "username": "user1",
    "email": "user1@example.com",
    "created_at": "2023-11-01T12:00:00Z"
  }
}

- **POST /api/v1/users**: Create a new user (Create).
    - Example Request Body: 
        Request Body:

            user: {
                "username": "string",
                "email": "string",
                "password": "string"
            }

    - Example Response 
            {
        "user": {
            "id": 3,
            "username": "newuser",
            "email": "newuser@example.com",
            "created_at": "2023-11-03T14:00:00Z"
        }
        }



## Campaigns Resource (Nested under Users)
- **GET /api/v1/users/:user_id/campaigns**: Retrieve a list of campaigns associated with a specific user (Index).
    - Example Response:

            "campaigns": [
                {
                "id": 1,
                "name": "Campaign 1",
                "player_num": 5,
                "themes": ["Fantasy"],
                "created_at": "2023-11-04T15:00:00Z"
                },
                {
                "id": 2,
                "name": "Campaign 2",
                "player_num": 4,
                "themes": ["Sci-Fi"],
                "created_at": "2023-11-05T16:00:00Z"
                }
            ]


- **GET /api/v1/users/:user_id/campaigns/:id**: Retrieve information about a specific campaign associated with a user (Show).
    - Example Response:

            "campaign": {
                "id": 1,
                "name": "Campaign 1",
                "player_num": 5,
                "themes": ["Fantasy"],
                "created_at": "2023-11-04T15:00:00Z"
            }


- **POST /api/v1/users/:user_id/campaigns**: Create a new campaign associated with a user (Create).
    - Example Request 
        Request Body:
        
            "campaign": {
                "name": "string",
                "player_num": integer,
                "themes": text
            }
        
    - Example Response:

            "campaign": {
                "id": 3,
                "name": "New Campaign",
                "player_num": 6,
                "themes": ["Adventure"],
                "created_at": "2023-11-06T17:00:00Z"
            }



## Towns Resource (Nested under Campaigns, which is nested under Users)
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/towns**: Retrieve a list of towns associated with a specific campaign (Index).
    - Example Response:

            "towns": [
                {
                "id": 1,
                "name": "Town 1",
                "description": "A small town in a fantasy world",
                "leadership": "Mayor John",
                "taverns": "The Rusty Mug",
                "shops": "Magic Emporium, Blacksmith",
                "created_at": "2023-11-07T18:00:00Z"
                },
                {
                "id": 2,
                "name": "Town 2",
                "description": "A bustling city with a diverse population",
                "leadership": "Council of Elders",
                "taverns": "The Golden Goblet, The Dancing Dragon",
                "shops": "Market Square, Apothecary",
                "created_at": "2023-11-08T19:00:00Z"
                }
            ]


- **GET /api/v1/users/:user_id/campaigns/:campaign_id/towns/:id**: Retrieve information about a specific town associated with a campaign (Show).
    - Example Response: 

            "town": {
                "id": 1,
                "name": "Town 1",
                "description": "A small town in a fantasy world",
                "leadership": "Mayor John",
                "taverns": "The Rusty Mug",
                "shops": "Magic Emporium, Blacksmith",
                "created_at": "2023-11-07T18:00:00Z"
            }


- **POST /api/v1/users/:user_id/campaigns/:campaign_id/towns**: Create a new town associated with a campaign (Create).
    - Example Request:
        Request Body:

            "town": {
                "name": string,
                "description": string,
                "leadership": string,
                "taverns": string,
                "shops": string }

            
    - Example Response:

            "town": {
                "id": 3,
                "name": "Mysticville",
                "description": "A magical town",
                "leadership": "Elder Willow",
                "taverns": "The Enchanted Grove",
                "shops": "Herb Market, Enchanter's Hut",
                "created_at": "2023-11-09T20:00:00Z"
            }



## NPCs Resource (Nested under Campaigns, which is nested under Users)
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/npcs**: Retrieve a list of NPCs associated with a specific campaign (Index).
    - Example Response

            "id": 1,
            "name": "Gandalf",
            "gender": "Male",
            "race": "Wizard",
            "klass": "Sorcerer",
            "description": "A wise and powerful wizard",
            "attitude": "Friendly",
            "created_at": "2023-11-09T12:00:00Z",
            "updated_at": "2023-11-09T12:00:00Z",
            "campaign_id": 2

- **GET /api/v1/users/:user_id/campaigns/:campaign_id/npcs/:id**: Retrieve information about a specific NPC associated with a campaign (Show).
    - Example Response:

            {
            "id": 1,
            "name": "Gandalf",
            "gender": "Male",
            "race": "Wizard",
            "klass": "Sorcerer",
            "description": "A wise and powerful wizard",
            "attitude": "Friendly",
            "created_at": "2023-11-09T12:00:00Z",
            "updated_at": "2023-11-09T12:00:00Z",
            "campaign_id": 2
            }

- **POST /api/v1/users/:user_id/campaigns/:campaign_id/npcs**: Create a new NPC associated with a campaign (Create).
    - Example Request:
        Request Body:

            "npc": {
                "name": "string",
                "gender": "string",
                "race": "string",
                "klass": "string",
                "description": "string",
                "attitude": "string"
            }


## Quests Resource (Nested under Campaigns, which is nested under Users)
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/quests**: Retrieve a list of quests associated with a specific campaign (Index).
    - Example Response: 

            {
                "id": 1,
                "name": "Retrieve the Lost Artifact",
                "description": "Embark on a journey to retrieve a powerful artifact.",
                "goal": "Find the artifact in the ancient temple.",
                "created_at": "2023-11-09T14:00:00Z",
                "updated_at": "2023-11-09T14:00:00Z",
                "campaign_id": 2
            },
            {
                "id": 2,
                "name": "Defeat the Dragon",
                "description": "Slay the mighty dragon terrorizing the land.",
                "goal": "Confront and defeat the dragon in its lair.",
                "created_at": "2023-11-09T14:30:00Z",
                "updated_at": "2023-11-09T14:30:00Z",
                "campaign_id": 2
            }

    
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/quests/:id**: Retrieve information about a specific quest associated with a campaign (Show).
    - Example Response:

            {
            "id": 1,
            "name": "Retrieve the Lost Artifact",
            "description": "Embark on a journey to retrieve a powerful artifact.",
            "goal": "Find the artifact in the ancient temple.",
            "created_at": "2023-11-09T14:00:00Z",
            "updated_at": "2023-11-09T14:00:00Z",
            "campaign_id": 2
            }

- **POST /api/v1/users/:user_id/campaigns/:campaign_id/quests**: Create a new quest associated with a campaign (Create).
    - Example Request:

            "quest": {
                "name": string,
                "description": string,
                "goal": string
            }



## Additional Routes:
- **GET /api/v1/users/search**: Search for users.
- **POST /api/v1/users/login**: Log in a user.