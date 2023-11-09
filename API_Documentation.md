# API Routes Documentation
The following documentation outlines the API routes defined in this Ruby on Rails application.
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
- **GET /api/v1/users/:user_id/campaigns/:campaign_id/towns/:id**: Retrieve information about a specific town associated with a campaign