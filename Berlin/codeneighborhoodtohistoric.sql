CASE 
  -- 1. FIX THE CENTER NEIGHBORHOODS BY EXACT NAME
  WHEN "name" IN ('Wedding', 'Gesundbrunnen') THEN 'French'
  WHEN "name" IN ('Moabit', 'Tiergarten', 'Hansaviertel') THEN 'British'
  WHEN "name" = 'Mitte' THEN 'Russian'

  -- 2. RUN THE REST OF THE AUTOMATIC DISTRICT CODE LOGIC
  WHEN substr("schlüssel", 7, 2) = '12' THEN 'French'
  WHEN substr("schlüssel", 7, 2) IN ('06', '07', '08') THEN 'US'
  WHEN substr("schlüssel", 7, 4) = '0202' THEN 'US'
  WHEN substr("schlüssel", 7, 2) IN ('04', '05') THEN 'British'
  WHEN substr("schlüssel", 7, 2) IN ('03', '09', '10', '11') THEN 'Russian'
  WHEN substr("schlüssel", 7, 4) = '0201' THEN 'Russian'
  
  ELSE 'Unknown'
END