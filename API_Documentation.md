# API Routes Documentation

## Users Resource
- **GET /api/v1/users**: Retrieve a list of users (Index).
- **GET /api/v1/users/:id**: Retrieve information about a specific user (Show).
- **POST /api/v1/users**: Create a new user (Create).

## Campaigns Resource (Nested under Users)
- **GET /api/v1/users/:user_id/campaigns**: Retrieve a list of campaigns associated with a specific user (Index).
- **GET /api/v1/users/:user_id/campaigns/:id**: Retrieve information about a specific campaign associated with a user (Show).
- **POST /api/v1/users/:user_id/campaigns**: Create a new campaign associated with a user (Create).

## Towns Resource (Nested under Campaigns, which is nested under Users)
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/towns**: Retrieve a list of towns associated with a specific campaign (Index).
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/towns/:id**: Retrieve information about a specific town associated with a campaign (Show).
- **POST /api/v1/users/:user_id/campaigns/:campaign_id/towns**: Create a new town associated with a campaign (Create).

## NPCs Resource (Nested under Campaigns, which is nested under Users)
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/npcs**: Retrieve a list of NPCs associated with a specific campaign (Index).
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/npcs/:id**: Retrieve information about a specific NPC associated with a campaign (Show).
- **POST /api/v1/users/:user_id/campaigns/:campaign_id/npcs**: Create a new NPC associated with a campaign (Create).

## Quests Resource (Nested under Campaigns, which is nested under Users)
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/quests**: Retrieve a list of quests associated with a specific campaign (Index).
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/quests/:id**: Retrieve information about a specific quest associated with a campaign (Show).
- **POST /api/v1/users/:user_id/campaigns/:campaign_id/quests**: Create a new quest associated with a campaign (Create).

## Additional Routes:
- **GET /api/v1/users/search**: Search for users.
- **POST /api/v1/users/login**: Log in a user.