Rails app for technical test - En Voiture Simone

This Rails application provides an API to retrieve potato prices and calculate the best daily gain possible on a given past day.

The two routes available are:

1. GET /api/potato_price_times?day=YYYY-MM-DD
   - Retrieves all potato prices for the specified day.
   - Example response:
     ```json
     [
       { "time": "2023-10-01T08:00:00Z", "value": 1.20 },
       { "time": "2023-10-01T12:00:00Z", "value": 1.50 },
       ...
     ]
     ```
2. GET /api/best_daily_gain_possible?day=YYYY-MM-DD
   - Calculates the best possible gain from buying and selling potatoes on the specified day.
   - Example response:
     ```json
     { "best_gain_possible": 30.0 }
     ```

To test it I created a seed.rb file that populates the database with random potato prices for two dates 2025-01-01 and 2026-01-01.
