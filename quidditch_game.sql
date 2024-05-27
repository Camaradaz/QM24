-- Borrar la base de datos si existe y crear una nueva para el proyecto
DROP DATABASE IF EXISTS quidditch_game;

CREATE DATABASE quidditch_game;

-- Mostrar todas las bases de datos y usar la nueva
SHOW DATABASES;

USE quidditch_game;

-- Borrar la tabla positions si existe
DROP TABLE IF EXISTS positions;

-- Crear la tabla positions
CREATE TABLE positions (
    position_id INT NOT NULL AUTO_INCREMENT,
    position_name VARCHAR(50) NOT NULL UNIQUE,
    position_description VARCHAR(500) NOT NULL UNIQUE,
    position_count_players INT NOT NULL,
    PRIMARY KEY (position_id)
);

-- Añadir los datos de las posiciones 
INSERT INTO positions (position_name, position_description, position_count_players)
VALUES ('Keeper', 'The keeper is responsible for blocking shots from the opposing Chasers and keeping the goal secure. They prevent opponents from scoring points.', 1),
       ('Beater', 'Their main role is to defend their team and hinder the progress of the opposing team. They use bats to hit the Bludgers. The goal of the Beaters is to hit the Bludgers towards players of the opposing team to distract them, unbalance them, or even knock them off their brooms.', 1),
       ('Chaser', 'Their main role is to score points. Chasers attempt to throw the Quaffle through one of the opposing teams three hoops to score goals. In addition to scoring, Chasers also participate in defense by trying to prevent the opposing teams Chasers from scoring. They are versatile players who need both offensive and defensive skills to be effective in the game.', 1),
       ('Seeker', 'He is the player responsible for catching the Golden Snitch. Catching the Golden Snitch awards his team 150 points and ends the game. The Seeker must be agile, fast, and have sharp reflexes to be able to track and catch the Golden Snitch before the opposing Seeker.', 1);

-- Borrar la tabla RANK si existe
DROP TABLE IF EXISTS rank;

-- Crear la tabla RANK
CREATE TABLE rank (
    rank_id INT NOT NULL AUTO_INCREMENT,
    rank_name VARCHAR(50) NOT NULL UNIQUE,
    symbol_rank VARCHAR(1) NOT NULL UNIQUE,
    rank_description VARCHAR(500) NOT NULL UNIQUE,
    PRIMARY KEY (rank_id)
);

-- Añadir los datos de los rangos
INSERT INTO rank (rank_name, symbol_rank, rank_description)
VALUES ('Amateur', 'D', 'Perhaps you are just starting out in Quidditch, playing in minor leagues, or maybe you have not taken the sport seriously'),
       ('Skilled', 'C', 'Represents an intermediate level in Quidditch, indicating significant progress but still with room for improvement. Players in this rank may have developed basic skills and have experience in the game, but are still working to reach their full potential.'),
       ('Profesional','B', 'Reserved for players with superior skills and a deep understanding of the game. These players have demonstrated a high level of competence and mastery on the field, capable of executing more complex and strategic plays. It is the most common level in the British league.'),
       ('Prominent', 'A', 'This slot is reserved for standout players in their national teams or possibly figures in their country. They typically have a high level and are known to be versatile and significant figures in their club.'),
       ('Worldwide Stars', 'S', 'This rank represents the stars of the teams, the best players in the world, and those who stand out globally. These players epitomize the elite of Quidditch, possessing exceptional skills, outstanding abilities, and a significant impact both on their teams and on the international sports scene.');

-- Borrar la tabla region si existe
DROP TABLE IF EXISTS region;

-- Crear la tabla region
CREATE TABLE region (
    region_id INT NOT NULL AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL UNIQUE,
    region_count_teams INT NOT NULL,
    PRIMARY KEY (region_id)
);

-- Añadir los datos de los continentes 
INSERT INTO regions (region_name, region_count_teams)
VALUES ('Europe', 29),
       ('America', 29),
       ('Asia', 29),
       ('Africa', 29),
       ('Oceania', 20),
       ('Free Agent', 1);

-- Crear la tabla colours
CREATE TABLE colours (
    colours_id INT NOT NULL AUTO_INCREMENT,
    colours_name VARCHAR(50) NOT NULL,
    count_colors_uniform INT NOT NULL,
    PRIMARY KEY (colours_id)
);

-- Añadir los datos de los colores
INSERT INTO colours (colours_name, count_colors_uniform)
VALUES ('Black', 1),
       ('Black and White', 1)
       ('Black and Red', 1),
       ('Black and Blue', 1),
       ('Black and Lightblue', 1),
       ('Black and Green', 1),
       ('Black and Pink', 1),
       ('Black and Yellow', 1),
       ('Black, White and Red', 1),
       ('Black, White and Green', 1),
       ('Black, Green and Red', 1)
       ('Black, Yellow and Red', 1)
       ('Black, Yellow, Green and Red', 1)
       ('White', 1),
       ('White and Grey', 1),
       ('White and Red', 1),
       ('White and Blue', 1),
       ('White and Green', 1),
       ('White and Lightblue', 1),
       ('White, Green and Red', 1)
       ('Red', 1),
       ('Red and Yellow', 1),
       ('Red and Blue', 1),
       ('Red and Green', 1),
       ('Red and Lightblue', 1),
       ('Blue', 1),
       ('Blue and Yellow', 1),
       ('Blue, White and Red', 1),
       ('Yellow', 1),
       ('Yellow and Green', 1),
       ('Yellow and Lightblue', 1),
       ('Yellow, Red and Blue', 1),
       ('Yellow, Black and Green', 1)
       ('Green', 1),
       ('Green, White and Orange', 1)
       ('Purple', 1),
       ('Orange', 1),
       ('Orange and Yellow', 1),
       ('Orange and Green', 1),
       ('Lightblue', 1),
       ('Lightblue, White and Orange', 1),
       ('Vine', 1),
       ('Grey', 1),


-- Borrar la tabla countries si existe
DROP TABLE IF EXISTS countries;

-- Crear la tabla countries
CREATE TABLE countries (
    country_id INT NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL UNIQUE,
    country_capital VARCHAR(50) NOT NULL UNIQUE,
    region_id INT NOT NULL,
    country_stadium VARCHAR(250) NOT NULL,
    country_color VARCHAR (50) NOT NULL,
    count_cups INT,
    PRIMARY KEY (country_id),
    FOREIGN KEY (region_id) REFERENCES region (region_id),
    FOREIGN KEY (country_color) REFERENCES colours (colours_id),
    FOREIGN KEY (country_stadium) REFERENCES stadiums (stadium_id)
);

-- Añadir los países existentes de la liga
INSERT INTO countries (country_name, country_capital, region_id, country_stadium, country_color, count_cups)
VALUES ('Albania', 'Tirana', 1, 'Enver Hoxha Revolution Stadium', 3, NULL),
       ('Andorra', 'Andorra la Vella', 1, 'Estadi Nacional d`Andorra', 32, NULL),
       ('Austria', 'Vienna', 1, 'Ernst-Happel-Stadion', 16, NULL),
       ('Belgium', 'Brussels', 1, 'Jan Breydel Stadium', 3, NULL),
       ('Bulgaria', 'Sofia', 1, 'Queen Sofia Stadium', 20, 7),
       ('Croatia', 'Zagreb', 1, 'Stadion Gradski VRT', 16, NULL),
       ('Denmark', 'Copenhagen', 1, 'Parken Stadion Indre Østerbro', 16, 2),
       ('Englad', 'London', 1, 'Wembley Stadium', 14, 15),
       ('Finland', 'Helsinki', 1, 'Helsingin Olympiastadion', 17, 1),
       ('France', 'Paris', 1, 'Stade des Trois Mousquetaires', 26, 5),
       ('Germany', 'Berlin', 1, 'Berliner Olympiastadion', 2, 9),
       ('Greece', 'Athens', 1, 'Πάνθεον των Θεών Στάδιο', 17, 1),
       ('Hungary', 'Budapest', 1, 'Puskás Aréna', 16, NULL),
       ('Iceland', 'Reykjavik', 1, 'Móðir Norðurlanda allra Víkinga Arena', 23, NULL),
       ('Ireland', 'Dublin', 1, 'William Brown Stadium', 35, 10),
       ('Italy', 'Rome', 1, 'Stadio Olimpico di Roma', 26, 2),
       ('Liechtenstein', 'Vaduz', 1, 'Rheinpark Stadion', 23, 1),
       ('Luxembourg', 'Luxembourg City', 1, 'Stade de Luxembourg', 25, NULL),
       ('Netherlands', 'Amsterdan', 1, 'De Grolsch Veste', 37, 3),
       ('Norway', 'Oslo', 1, 'Bjørnstjerne Bjørnson Olympik', 21, NULL),
       ('Romania', 'Bucarest', 1, 'Arena Națională', 32, NULL),
       ('Russia', 'Moscow', 1, 'Ленинский стадион', 21, 1),
       ('San Marino', 'San Marino', 1, 'Stadio Olimpico di Roma', 19, NULL),
       ('Scotland', 'Edinburgh', 1, 'William J. Wallace Stadium', 17, 8),
       ('Spain', 'Madrid', 1, 'Estadio Santiago Bernabeu', 22, 2),
       ('Sweden', 'Stockholm', 1, 'Friends Arena', 27, 1),
       ('Ukraine', 'Kyiv', 1, 'Національний спортивний комплекс', 31, NULL),
       ('Wales', 'Cardiff', 1, 'Stadiwm Mileniwm', 20, 6),
       ('Anguilla', 'The Valley', 2, 'Ronald Webster Park', 41, NULL),
       ('Antigua and Barbuda', 'Saint John', 2, 'Sir Vivian Richards Stadium', 3, NULL),
       ('Argentina', 'Buenos Aires', 2, 'Estadio Monumental', 19, 19),
       ('Bahamas', 'Nassau', 2, 'Thomas Robinson Stadium', 31, 1),
       ('Barbados', 'Bridgetown', 2, 'Barbados National Stadium', 27, NULL),
       ('Belize', 'Belmopan', 2, 'FFB Field', 29, NULL),
       ('Bolivia', 'La Paz', 2, 'Estadio Hernando Siles Reyes', 34, NULL),
       ('Brazil', 'Brasilia', 2, 'Estadio Nacional Mané Garrincha', 29, 15),
       ('Canada', 'Ottawa', 2, 'BMO Field', 21, 3),
       ('Chile', 'Santiago', 2, 'Estadio Monumental', 21, 1),
       ('Colombia', 'Bogota', 2, 'Pablo Escobar', 32, NULL),
       ('Cuba', 'La Havana', 2, 'Estadio Revolucionario Che Guevara', 21, NULL),
       ('Curaçao', 'Willemstad', 2, 'Sentro Deportivo Korsou SDK', 27, NULL),
       ('Ecuador', 'Quito', 2, 'Estadio Monumental', 32, 1),
       ('El Salvador', 'San Salvador', 2, 'Estadio Nayib Bukele', 17, NULL),
       ('Guatemala', 'Guatemala', 2, 'Estadio Nacional Doroteo Guamuch Flores', 40, NULL),
       ('Guyana', 'Georgetown', 2, 'Georgetown Stadium', 30, NULL),
       ('Haiti', 'Puerto Principe', 2, 'Estad Sylvio Cator', 23, NULL),
       ('Jamaica', 'Kingston', 2, 'Oxlade Kingston Road', 33, NULL),
       ('Mexico', 'Mexico D.F', 2, 'Estadio Azteca', 20, 15),
       ('Nicaragua', 'Managua', 2, 'Estadio Nacional', 17, NULL),
       ('Panama', 'Panama', 2, 'Estadio Revolucion', 28, NULL),
       ('Paraguay', 'Asuncion', 2, 'Estadio Revolucion del Chaco', 16, 2),
       ('Peru', 'Lima', 2, 'Estadio Nacional', 16, 1),
       ('Suriname', 'Paramaribo', 2, 'Estadio André Kamperveen', 24, NULL),
       ('Trinidad and Tobago', 'Port Spain', 2, 'Estadio Nacional Hasely Crawford', 3, NULL),
       ('United States', 'Washington D.C', 2, 'Stadium Memorial Robert F. Kennedy', 28, 12),
       ('Uruguay', 'Montevideo', 2, 'Estadio Centenario', 40, 14),
       ('Venezuela', 'Caracas', 2, 'Estadio Olimpico', 42, NULL),
       ('Afghanistan', 'Kabul', 3, 'Estadio Ghazi', 11, 1),
       ('Armenia', 'Erevan', 3, 'Վազգեն Սարգսյանի', 37, NULL),
       ('Bahrain', 'Manama', 3, 'إستاد البحرين الوطني', 21, 1),
       ('Bangladesh', 'Daca', 3, 'Lionel Messi', 24, NULL),
       ('Bhutan', 'Timbu', 3, 'Estadio Changlimithang', 38, NULL),
       ('China', 'Pekin', 3, 'Estadio de los Trabajadores', 21, 3),
       ('North Korea', 'Pyongyang', 3, 'Estadio Kim Il-sung', 21, 1),
       ('South Korea', 'Seoul', 3, '서울월드컵경기장', 'White', 2),
       ('India', 'Nueva Delhi', 3, 'Jawaharlal Nehru', 26, 1),
       ('Iran', 'Teheran', 3, 'Estadio Azadi', 20, 3),
       ('Japan', 'Tokio', 3, 'Nuevo Estadio Nacional', 26, 9),
       ('Kazakhstan', 'Astana', 3, 'Astana Arena', 31, NULL),
       ('Kuwait', 'Kuwait City', 3, 'Jaber Al-Ahmad', 24, NULL),
       ('Kyrgystan', 'Biskek', 3, 'Estadio Spartak', 22, NULL),
       ('Laos', 'Vientian', 3, 'Nuevo Estadio Nacional', 23, NULL),
       ('Mongola', 'Ulan Bator', 3, 'Estadio Nacional', 21, NULL),
       ('Myanmar', 'Naypyidaw', 3, 'Estadio Thuwunna', 30, NULL),
       ('Nepal', 'Katmandu', 3, 'Dasarath Rangasala', 17, 1),
       ('Oman', 'Mascate', 3, 'Sultan Qaboos Sports Complex', 24, NULL),
       ('Pakistan', 'Islamabad', 3, 'Punjab Stadium', 18, NULL),
       ('Palestine', 'Ramala', 3, 'Estadio Internacional de Jerico', 11, NULL),
       ('Philippines', 'Manila', 3, 'Philippine Sports Stadium', 23, NULL),
       ('Qatar', 'Doha', 3, 'Khalifa International Stadium', 42, 4),
       ('Sri Lanka', 'Sri Jayawardenepura Kotte', 3, 'Estadio Sugathadasa', 39, NULL),
       ('Tajikistan', 'Dusambe', 3, 'Estadio Central Republicano', 24, NULL),
       ('Thailand', 'Bangkok', 3, 'Estadio Rajamangala', 23, 1),
       ('United Arab States', 'Abu Dabi', 3, 'Heshmat Mohajerani Stadium', 10, 2),
       ('Uzbekistan', 'Taskent', 3, 'Pakhtakor Markaziy', 40, NULL),
       ('Vietnam', 'Hanoi', 3, 'Ho Chi Minh Arena', 21, 1),
       ('Algeria', 'Argel', 4, 'Mustapha Tchaker', 18, 3),
       ('Angola', 'Luanda', 4, 'Estadio 11 de Noviembre', 3, NULL),
       ('Benin', 'Porto Novo', 4, 'Stade de la Amitie', 30, NULL),
       ('Botswana', 'Gaborone', 4, 'Estadio Nacional', 5, NULL),
       ('Burkina Faso', 'Uagadugu', 4, 'Estadio del 4 de Agosto', 24, 1),
       ('Burundi', 'Gitega', 4, 'Stade de la Amitie', 24, NULL),
       ('Chad', 'Yamena', 4, 'Stade Omnisports Idriss-Mahamat-Ouya', 32, NULL),
       ('Congo', 'Brazzaville', 4, 'Stade Kamanyola', 25, NULL),
       ('Ivory Coast', 'Yamusukro', 4, 'Didier Drogba', 39, NULL),
       ('Djibouti', 'Djibouti', 4, 'Estadio Nacional', 19, NULL),
       ('Egypt', 'El Cairo', 4, 'Estadio Internacional', 9, 8),
       ('Ethiopia', 'Adis Abeba', 4, 'Bahir Dar', 30, NULL),
       ('Gambia', 'Banjul', 4, 'Estadio Independencia', 24, 2),
       ('Ghana', 'Acra', 4, 'Ohene Djan', 2, 6),
       ('Kenya', 'Nairobi', 4, 'Estadio Nacional', 9, NULL),
       ('Lebanon', 'Beirut', 4, 'Cite Sportive Camille Chamoun', 16, NULL),
       ('Libya', 'Tripoli', 4, 'Al-Khadafi Stadium', 'Green', 5),
       ('Madagascar', 'Antananarivo', 4, 'Estadio Municipal', 35, NULL),
       ('Malawi', 'Lilongue', 4, 'Estadio Kamuzu', 11, 2),
       ('Mali', 'Bamako', 4, 'Estadio del 26 de Marzo', 30, 1),
       ('Morocco', 'Rabat', 4, 'Mohammed V', 24, 1),
       ('Nigeria', 'Abuya', 4, 'Estadio Nacional', 18, 2),
       ('Saudi Arabia', 'Riad', 4, 'Rey Fahd Stadium', 34, 4),
       ('Senegal', 'Dakar', 4, 'Abdoulaye Wade', 24, 1),
       ('South Africa', 'Ciudad del Cabo', 4, 'FNB Stadium', 30, NULL),
       ('Togo', 'Lome', 4, 'Stade de Kegue', 30, 3),
       ('Tunisia', 'Tunisia', 4, 'Hammadi Agrebi', 16, NULL),
       ('Uganda', 'Kampala', 4, 'Idi Amin Dada Stadium', 12, 1),
       ('Zambia', 'Lusaka', 4, 'Heroes National Stadium', 6, NULL),
       ('Australia', 'Canberra', 5, 'Grand Sydney Stadium', 30, 18),
       ('Cook Islands', 'Avarua', 5, 'Estadio Nacional', 26, NULL),
       ('Fiji', 'Suva', 5, 'Estadio Nacional', 40, NULL),
       ('Guam', 'Hagatña', 5, 'Estadio Nacional', 17, NULL),
       ('Kiribati', 'Tarawa del Sur', 5, 'Bairiki', 16, NULL),
       ('Marshall Islands', 'Majuro', 5, 'Sports Stadium', 26, NULL),
       ('Micronesia', 'Palikir', 5, 'Yap Sports Complex', 40, NULL),
       ('Nauru', 'Yaren', 5, 'Estadio de los Refugiados', 36, NULL),
       ('New Caledonia', 'Noumea', 5, 'Numa-Daly Magenta', 15, 2),
       ('New Zealand', 'Wellington', 5, 'North Harbour', 2, 7),
       ('Palau', 'Ngerulmud', 5, 'Estadio Nacional', 31, NULL),
       ('Papua New Guinea', 'Port Moresby', 5, 'Estadio de los Refugiados', 3, NULL),
       ('Samoa', 'Apia', 5, 'Estadio Nacional', 21, NULL),
       ('American Samoa', 'Pago Pago', 5, 'Veterans Memorial', 21, NULL),
       ('Solomon Islands', 'Honiara', 5, 'Lawson Tama Stadium', 26, NULL),
       ('Tahiti', 'Papeete', 5, 'Pater Te Hono Nui', 16, 1),
       ('Tonga', 'Nukualofa', 5, 'Loto-Tonga Soka Center', 21, 1),
       ('Tuvalu', 'Funafuti', 5, 'Tuvalu Sports Ground', 40, NULL),
       ('Vanuatu', 'Port Vila', 5, 'Korman Stadium', 8, NULL),
       ('Wallis and Futuna', 'Mata-Utu', 5, 'Atoloto Kolokilagi Stadium', 23, NULL),
       ('Free Agent', 'Free Agent', 6, 'Quidditch International Association', 43, NULL);

-- Borrar la tabla stadiums si existe
DROP TABLE IF EXISTS stadiums;

-- Crear la tabla stadiums
CREATE TABLE stadiums (
    stadium_id INT NOT NULL AUTO_INCREMENT,
    stadium_name VARCHAR(50) NOT NULL UNIQUE,
    stadium_region INT NOT NULL,
    stadium_country INT NOT NULL,
    stadium_description VARCHAR(500) NOT NULL UNIQUE,
    stadium_capacity INT NOT NULL,
    PRIMARY KEY (stadium_id),
    FOREIGN KEY (stadium_region) REFERENCES region (region_id),
    FOREIGN KEY (stadium_country) REFERENCES countries (country_id)
);

-- Añadir los datos de los estadios
INSERT INTO positions (stadium_name, stadium_region, stadium_country, stadium_description, stadium_capacity)
VALUES ('Enver Hoxha Revolution Stadium', 1, 1, 'It is the largest stadium in Albania and where the Albanian national quidditch team played its matches.', 19700),
       ('Estadi Nacional d`Andorra', 1, 2, 'The stadium was built on the former grounds of the Camp de Esports del M.I. Consell General.', 3347),
       ('Ernst-Happel-Stadion', 1, 3, 'Also known as the Prater Stadium (Praterstadion) until 1992 when it was renamed in honor of former quidditch player and coach Ernst Happel, it is the largest stadium in Austria.', 50865),
       ('Jan Breydel Stadium', 1, 4, 'It is a stadium located in the city of Bruges, Belgium. The stadium was inaugurated in 1975 under the name Olympia Stadium.', 30000),
       ('Vasil Levski Stadium', 1, 5, 'Situated in the city center, it bears the name of Vasil Levski, a revolutionary considered a national hero of Bulgaria.', 43230),
       ('Stadion Gradski VRT', 1, 6, 'The stadium was built in the 1980s, although its construction began in 1949 and had to be stopped numerous times. In fact, even today, it is not considered complete.', 22050),
       ('Parken Stadion Indre Østerbro', 1, 7, 'It is a Quidditch stadium located in the district of Indre Østerbro in the city of Copenhagen, the capital of Denmark.', 42305),
       ('Wembley Stadium', 1, 8, 'The Wembley Stadium is a football stadium located in the city of London, England. Here, the most important matches of the British Quidditch League and the Quidditch World Cup are played.', 105000),
       ('Helsingin Olympiastadion', 1, 9, 'The Olympic Stadium of Helsinki (in Finnish Helsingin Olympiastadion) is a multipurpose stadium located in the city of the same name, notable for being the largest stadium in Finland. Nowadays, the stadium is used for concerts and some sports activities.', 39784),
       ('Stade des Trois Mousquetaires', 1, 10, 'It is a sports venue located in Saint-Denis, a municipality bordering the northern part of the French capital. Inaugurated on January 28, 1698, it is the national stadium of reference for French sports, hosting home matches for the French national teams in Quidditch, football, and rugby.', 81338),
       ('Berliner Olympiastadion', 1, 11, 'It was designed by the German architect Werner March and was built between 1934 and 1936 for the 1936 Olympic Games, replacing the German Stadium (originally called Grünewald Stadium).', 74475),
       ('Πάνθεον των Θεών Στάδιο', 1, 12, 'The Olympic Stadium of Athens Spyros Louis (in Greek: Πάνθεον των Θεών Στάδιο, Olympiako Stadio Athinas Spyros Louis) is the main stadium of the Athens Olympic Sports Complex (OAKA), located in the city of Maroussi, Greece. It has a maximum capacity of 75,263 spectators. It was the main venue for the 2004 Athens Olympic Games.', 75263),
       ('Puskás Aréna', 1, 13, 'The Puskás Aréna is a football stadium located in the 14th district of Zugló in Budapest, Hungary.', 67215),
       ('Móðir Norðurlanda allra Víkinga Arena', 1, 14, 'The field was inaugurated in 1957 as Iceland main sports facility, with a football match against Norway on July 8th of that year.', 9800),
       ('William Brown Stadium', 1, 15, 'The stadium has five levels, with the lower and upper levels for general access, the second and third levels for premium seating, and the fourth level for VIP and corporate areas. However, the north stand has only one level due to its proximity to local residences. This stand is reserved for visiting fans during international Quidditch matches.', 51711),
       ('Stadio Olimpico di Roma', 1, 16, 'The Olympic Stadium of Rome (Stadio Olimpico di Roma in Italian) is a multipurpose stadium, primarily dedicated to Quidditch, located in the city of Rome, the capital of the Lazio region and Italy.', 72700),
       ('Rheinpark Stadion', 1, 17, 'The stadium was funded by the principality and belongs to the municipality of Vaduz. It borders the right bank of the Rhine River and, therefore, the border of Liechtenstein with Switzerland.', 7838),
       ('Stade de Luxembourg', 1, 18, 'The stadiums design was developed by the Luxembourgish architectural firm Beng Architectes Associés together with the German firm Gerkan, Marg und Partner, based in Hamburg. The model presented by both companies was selected by the Minister of Sports of Luxembourg and the Mayor of Luxembourg City.', 9386),
       ('De Grolsch Veste', 1, 19, 'The Grolsch Veste is a football stadium located in Enschede, Netherlands.', 30205),
       ('Bjørnstjerne Bjørnson Olympik', 1, 20, 'The Ullevaal Stadion is an all-seater stadium located in Oslo, Norway. In the same area as the stadium, you can find the headquarters of many sports federations, a bandy field, and commercial properties including a conference center, a hotel, and a shopping center. The stadium is adjacent to the Ullevål Stadion metro station in Oslo and the city Ring 3 road.', 25572),
       ('Arena Națională', 1, 21, 'The National Arena (in Romanian: Arena Națională) is a football stadium located in the Lia Manoliu Sports Complex in Bucharest, Romania.', 55634),
       ('Ленинский стадион', 1, 22, 'The stadium is part of the Luzhniki Olympic Complex and is located in the Luzhniki district, about 5 km southwest of the Kremlin. The name Luzhniki derives from the flood meadows in the bend of the Moskva River, where the stadium was built.', 81500),
       ('William J. Wallace Stadium', 1, 24, 'It is a football stadium in Glasgow, Scotland. It has a seating capacity for 52,500 spectators and serves as the national stadium of Quidditch in Scotland.', 52500),
       ('Estadio Santiago Bernabeu', 1, 25, 'The Santiago Bernabéu Stadium is a sports venue owned by the Spanish Quidditch team, located on the Paseo de la Castellana in the Chamartín district of Madrid, Spain.', 80000),
       ('Friends Arena', 1, 26, 'The Friends Arena is a multi-purpose stadium with a retractable roof, located in Stockholm, Sweden, within the municipality of Solna.', 50622),
       ('Національний спортивний комплекс', 1, 27, 'It is a multi-purpose stadium located in Kiev, the capital of Ukraine. Built by the Soviet Union to be the Red Stadium.', 70050),
       ('Stadiwm Mileniwm', 1, 28, 'The Millennium Stadium (in Welsh, Stadiwm Mileniwm; in Spanish, Estadio del Milenio), known since 2016 for sponsorship reasons as the Principality Stadium (in Welsh, Stadiwm Principality), is a multi-purpose stadium in the city of Cardiff, the capital of Wales.', 74500),
       ('Ronald Webster Park', 2, 29, 'Es un estadio de usos múltiples ubicado en The Valley, la capital del territorio británico de ultramar de Anguila.', 4000),
       ('Sir Vivian Richards Stadium', 2, 30, 'The Sir Vivian Richards Stadium is a stadium located in North Sound, on the island of Antigua, in the country of the Lesser Antilles of Antigua and Barbuda.', 10000),
       ('Estadio Monumental', 2, 31, 'It is a sports venue located at the intersection of Figueroa Alcorta and Udaondo avenues in the Belgrano neighborhood, Buenos Aires, Argentina. It is the football stadium with the highest capacity in Argentina and in the Americas. It is the venue where Argentina plays its home matches.', 84567),
       ('Thomas Robinson Stadium', 2, 32, 'It is a multi-purpose stadium in Nassau, Bahamas.', 15023),
       ('Barbados National Stadium', 2, 33, 'It was officially inaugurated on October 23, 1970. It is a multi-purpose open-air stadium in Waterford, St. Michael, on the Caribbean island of Barbados. Located approximately 4.3 km northeast of Bridgetown, it is adjacent to Highway 3.', 15000),
       ('FFB Field', 2, 34, 'It is a Quidditch stadium located in the city of Belmopan, Belize. It is used as the home venue for the national Quidditch team of this country.', 5000),
       ('Hernando Siles Reyes', 2, 35, 'The stadium is located in the Miraflores neighborhood, at an altitude of 3,581.3 meters above sea level, making it one of the highest professional stadiums in the world.', 41143),
       ('', 2, 1, '', 1),
       ('', 2, 1, '', 1),
       ('', 2, 1, '', 1),
       ('', 2, 1, '', 1), 
       ('', 2, 1, '', 1),
       ('', 2, 1, '', 1),

