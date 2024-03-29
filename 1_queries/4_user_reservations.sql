-- show all reservations for a user

SELECT reservations.id, properties.id, AVG(property_reviews.rating)
FROM users
JOIN reservations ON reservations.guest_id = users.id
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1 
AND reservations.end_date < now()::date
GROUP BY reservations.id, properties.id
ORDER BY start_date DESC
LIMIT 10;