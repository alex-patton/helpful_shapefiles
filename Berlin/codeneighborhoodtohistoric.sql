CASE 
  -- 1. THE SPLIT DISTRICTS (Explicitly by Name to bypass any ID bugs)
  -- Mitte Splits
  WHEN "name" = 'Mitte' THEN 'Russian'
  WHEN "name" IN ('Wedding', 'Gesundbrunnen') THEN 'French'
  WHEN "name" IN ('Moabit', 'Tiergarten', 'Hansaviertel') THEN 'British'
  
  -- Friedrichshain-Kreuzberg Splits
  WHEN "name" = 'Friedrichshain' THEN 'Russian'
  WHEN "name" = 'Kreuzberg' THEN 'US'
  
  -- Charlottenburg-Wilmersdorf Splits
  WHEN "name" IN ('Charlottenburg', 'Charlottenburg-Nord', 'Westend') THEN 'British'
  WHEN "name" IN ('Wilmersdorf', 'Schmargendorf', 'Grunewald', 'Halensee') THEN 'US'

  -- 2. THE HOMOGENEOUS DISTRICTS (Safe to use the 2-digit prefix for the rest)
  WHEN substr("schlüssel", 7, 2) = '12' THEN 'French'         -- Reinickendorf
  WHEN substr("schlüssel", 7, 2) IN ('06', '07', '08') THEN 'US' -- Steglitz-Zehlendorf, Tempelhof-Schöneberg, Neukölln
  WHEN substr("schlüssel", 7, 2) = '05' THEN 'British'        -- Spandau
  WHEN substr("schlüssel", 7, 2) IN ('03', '09', '10', '11') THEN 'Russian' -- Pankow, Treptow-Köpenick, Marzahn-Hellersdorf, Lichtenberg

  ELSE 'Unknown'
END