# Database

## Users:
Accounts are for senseis only. They will have access to controls based on their privilege level.
- Admin
  - Is the only account that can delete a sensei account
- Senseis
### Columns
  - ids (uuid)
  - username
  - password
  - privlege level

## Ninjas:
Ninjas are added and removed by higher level senseis or the admin account. They have notes and many other points of data attributed to each ninja.
### Columns
- full name (First name then last name)
- belt
- latest note (time_stamp)
- notes

### Notes Columns
- id (int auto increment)
- timestamp
- text
- sensei
- activity start
- activity end
