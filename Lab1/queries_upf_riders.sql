USE upf_riders;

# 1. 
SELECT DISTINCT b.name 
FROM business b JOIN category c 
WHERE c.description LIKE 'Farmacia' AND c.category_id = b.category_id 
ORDER BY NAME ASC
;

# 2. 
SELECT c.description 
FROM category c 
WHERE c.description LIKE 'Perruqueria%' 
ORDER BY description ASC
; 

# 3.
SELECT b.name, s.distance 
FROM serve s 
JOIN business b ON s.business_id = b.id 
WHERE s.distance > 1000 AND s.headquarters_code = 10 
ORDER BY distance ASC
;

# 4.
SELECT vt.description, COUNT(vehicle_type_id) 
FROM vehicle_type vt 
JOIN vehicle v ON vt.type_id = v.vehicle_type_id 
GROUP BY vt.description 
ORDER BY COUNT(vehicle_type_id) DESC
;

# 5. 
SELECT b.name 
FROM business b 
JOIN serve s 
NATURAL JOIN rider r ON b.id = s.business_id 
WHERE r.rider_id = 10 
ORDER BY NAME DESC
;

# 6.
SELECT DISTINCT h.code, h.postal_address, s.distance, b.name
FROM headquarters h
JOIN serve s ON s.headquarters_code = h.code
JOIN business b ON b.id = s.business_id
JOIN category c ON c.parent_category_id = b.category_id
WHERE c.description REGEXP 'Restaurant'
ORDER BY s.distance ASC LIMIT 1
;
# 7.
SELECT c.description, cc.description
FROM category c
JOIN category cc ON cc.category_id = c.parent_category_id
WHERE cc.description REGEXP 'Tecnologia|Llibreria'
ORDER BY c.description DESC
;
# 8.
SELECT r.rider_id, r.name, COUNT(l.vehicle_type_id) AS num_vehicles 
FROM rider r 
NATURAL JOIN licensed l 
GROUP BY r.rider_id 
HAVING COUNT(l.vehicle_type_id)>3
;
# 9.
SELECT DISTINCT b.name, b.latitude, b.longitude,  vt.description
FROM business b
JOIN serve s ON s.business_id = b.id
JOIN headquarters h ON h.code = s.headquarters_code
JOIN uses u ON u.headquarters_code = h.code
JOIN vehicle v ON v.ref_number = u.vehicle_ref_number
JOIN vehicle_type vt ON vt.type_id = v.vehicle_type_id
WHERE h.code NOT IN (
SELECT  h.code
from headquarters h
JOIN uses u ON u.headquarters_code = h.code
JOIN vehicle v ON v.ref_number = u.vehicle_ref_number 
JOIN vehicle_type vt ON vt.type_id = v.vehicle_type_id
WHERE number_of_wheels > 5
)
ORDER BY NAME ASC
;
# 10.
SELECT DISTINCT b.name, c.description, v.brand, vt.description, vt.number_of_wheels
FROM business b
JOIN category c ON c.category_id = b.category_id
JOIN serve s ON s.business_id = b.id
JOIN headquarters h ON h.code = s.headquarters_code
JOIN uses u ON u.headquarters_code = h.code
JOIN vehicle v ON v.ref_number = u.vehicle_ref_number
JOIN vehicle_type vt ON vt.type_id = v.vehicle_type_id
WHERE c.description REGEXP 'Dentista|Farmacia'
AND v.brand REGEXP 'Mitsubishi|Volkswagen' 
ORDER BY c.description ASC, vt.number_of_wheels DESC, name ASC, vt.description ASC;
