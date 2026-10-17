%Basic Satellite Scenario 
%------------------------
% 1. Time
startTime = datetime(2026, 10, 17, 12, 0, 0, 'TimeZone', 'UTC');
stopTime = startTime + hours(12);
sampleTime = 60; % Campionamento ogni 60 secondi

% 2. Object in a 3-dimensional arena
sc = satelliteScenario(startTime, stopTime, sampleTime);

% 3. Station of reference
gs = groundStation(sc, 41.9028, 12.4964, 'Name', 'Stazione Terra Roma');

% 4. satellite kleperian characterization 
% [semimajorAxis (m), eccentricity, inclination (deg), RAAN (deg), argPeriapsis (deg), trueAnomaly (deg)]
sma = 7000e3; % ~620 km (height)
ecc = 0.001;
inc = 51.6;   % Orbital inclination
raan = 0;
argp = 0;
ta = 0;

sat = satellite(sc, sma, ecc, inc, raan, argp, ta, 'Name', 'MioSatellite', 'OrbitPropagator', 'two-body-keplerian');

% 5. Access between satellite and station
ac = access(sat, gs);

% 6. viewer
viewer = satelliteScenarioViewer(sc);

% 7. start the simulation
play(sc);