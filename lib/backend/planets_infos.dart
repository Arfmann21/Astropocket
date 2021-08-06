class PlanetsInfos {
  final List<String> planetsName = [
    'Mercury',
    'Venus',
    'Earth',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune'
  ];

  List<String> planetsSubtitle = [
    'The smallest',
    'Earth\'s twin',
    'Home',
    'The red planet',
    'The giant',
    'Glorious rings',
    'Sideways planet',
    'Faint rings'
  ];

  List<String> infosTitle = ['Type: ', 'From Sun: ', 'Year: ', 'Day: '];

// index % 2 == 0 && index > 3, then marsInfos[index] == Title of the section

  List<String> mercuryInfos = [
    'Terrestrial',
    '32966848',
    '88 Earth days',
    '58.646 Earth Days',
  ];

  List<String> venusInfos = [
    'Terrestrial',
    '67226149',
    '255 Earth days',
    '117 Earth Days',
  ];

  List<String> earthInfos = [
    'Terrestrial',
    '94280650',
    '365 days',
    '24.6 hours',
  ];

  List<String> marsInfos = [
    'Terrestrial',
    '155504354',
    '687 Earth days',
    '25 hours',
  ];

  List<String> jupiterInfos = [
    'Gas giant',
    '467687455',
    '4333 Earh days',
    '10 hours'
  ];

  List<String> saturnInfos = [
    'Gas giant',
    '923233317',
    '29 Earh years',
    '11 hours'
  ];

  List<String> uranusInfos = [
    'Gas giant',
    '1834909130',
    '84 Earth years',
    '17 hours'
  ];

  List<String> neptuneInfos = [
    'Gas giant',
    '2780760359',
    '165 Earth years',
    '16 hours'
  ];

  List<String> getInfos(String requestedInfo) {
    switch (requestedInfo) {
      case 'Mercury':
        return mercuryInfos;

      case 'Venus':
        return venusInfos;

      case 'Earth':
        return earthInfos;

      case 'Mars':
        return marsInfos;

      case 'Jupiter':
        return jupiterInfos;

      case 'Uranus':
        return uranusInfos;
        break;

      case 'Neptune':
        return neptuneInfos;

      default:
        return ['Error'];
    }
  }

  List<String> getMajorMoons(int index) {
    switch (index) {
      case 0:
        return null;
        break;

      case 1:
        return null;
        break;

      case 2:
        return ['Moon'];
        break;

      case 3:
        return ['Deimos', 'Phobos'];
        break;

      case 4:
        return ['Ganymede', 'Io', 'Europa', 'Callisto'];
        break;

      case 5:
        return ['Titan', 'Rhea', 'Iapetus', 'Tethys', 'Enceladus'];
        break;

      case 6:
        return [
          'Oberon',
          'Umbriel',
          'Ariel',
          'Miranda',
        ];
        break;

      case 7:
        return ['Proteus', 'Triton', 'Titania'];
        break;

      default:
        return null;
    }
  }

  List<String> getPlanetFacts(int index) {
    switch (index) {
      case 0:
        return [
          'Mercury is the smallest planet in our solar system—only slightly larger than Earth\'s Moon. ',
          'It is the closest planet to the Sun at a distance of about 36 million miles (58 million kilometers) or 0.39 AU.',
          'One day on Mercury (the time it takes for Mercury to rotate or spin once with respect to the stars) takes 59 Earth days. One day-night cycle on Mercury takes 175.97 Earth days. Mercury makes a complete orbit around the Sun (a year in Mercury time) in just 88 Earth days.',
          'Mercury is a rocky planet, also known as a terrestrial planet. Mercury has a solid, cratered surface, much like the Earth\'s moon.',
          'Mercury\'s thin atmosphere, or exosphere, is composed mostly of oxygen (O2), sodium (Na), hydrogen (H2), helium (He), and potassium (K). Atoms that are blasted off the surface by the solar wind and micrometeoroid impacts create Mercury\'s exosphere.',
          'Mercury has no moons.',
          'There are no rings around Mercury',
          'No evidence for life has been found on Mercury. Daytime Temperatures can reach 430 degrees Celsius (800 degrees Fahrenheit) and drop to -180 degrees Celsius (-290 degrees Fahrenheit) at night. It is unlikely life (as we know it) could survive on this planet.',
          'tanding on Mercury\'s surface at its closest approach to the Sun, our star would appear more than three times larger than it does on Earth.',
          'The two spacecraft of ESA-JAXA\'s BepiColombo are en route to Mercury. NASA\'s Mariner 10 was the first mission to explore Mercury. NASA\'s MESSENGER was the first to orbit the innermost planet.'
        ];
        break;

      case 1:
        return [
          'Venus is often called "Earth’s twin" because they’re similar in size and structure, but Venus has extreme surface heat and a dense, toxic atmosphere. If the Sun were as tall as a typical front door, Earth and Venus would each be about the size of a nickel.',
          'Venus is the second closest planet to the Sun, orbiting at a distance of about 67 million miles (108 million kilometers)',
          'Venus rotates very slowly on its axis – one day on Venus lasts 243 Earth days. The planet orbits the Sun faster than Earth, however, so one year on Venus takes only about 225 Earth days, making a Venusian day longer than its year!',
          'Venus has a solid surface covered in dome-like volcanoes, rifts, and mountains, with expansive volcanic plains and vast, ridged plateaus.',
          'The average surface of Venus is less than a billion years old, and possibly as young as 150 million years old – which is relatively young from a geological perspective. This is a major conundrum for scientists – they don’t know exactly what happened that made Venus completely resurface itself.',
          'Venus’ thick atmosphere traps heat creating a runaway greenhouse effect – making it the hottest planet in our solar system with surface temperatures hot enough to melt lead. The greenhouse effect makes Venus roughly 700°F (390°C) hotter than it would be without a greenhouse effect.',
          'Venus is permanently shrouded in thick, toxic clouds of sulfuric acid that start at an altitude of 28 to 43 miles (45 to 70 kilometers). The clouds smell like rotten eggs!',
          'Venus was the first planet explored by a spacecraft and was intensely studied early in the history of space exploration. Venus was also the first planet whose surface was reached by a spacecraft from Earth. The intense heat means landers have only survived for a couple of hours.',
          'Venus is an unlikely place for life as we know it, but some scientists theorize microbes might exist high in the clouds where it’s cooler and the pressure is similar to Earth’s surface. Phosphine, a possible indicator of microbial life, has been observed in the clouds.',
          'Venus rotates backward on its axis compared to most planets in our solar system. This means the Sun rises in the west and sets in the east, opposite of what we see on Earth.',
        ];
        break;

      case 2:
        return [
          'If the Sun were as tall as a typical front door, Earth would be the size of a nickel.',
          'Earth orbits our Sun, a star. Earth is the third planet from the Sun at a distance of about 93 million miles (150 million km). ',
          'A day on Earth is 24 hours. Earth makes a complete orbit around the sun (a year in Earth time) in about 365 days.',
          'Earth is a rocky planet with a solid and dynamic surface of mountains, canyons, plains and more. Most of our planet is covered in water.',
          'Earth\'s atmosphere is 78 percent nitrogen, 21 percent oxygen and 1 percent other ingredients—the perfect balance to breathe and live. ',
          'Earth has one moon. ',
          'Earth has no rings.',
          'Many orbiting spacecraft study the Earth from above as a whole system—observing the atmosphere, ocean, glaciers, and the solid earth.',
          'Earth is the perfect place for life as we know it.',
          'Our atmosphere protects us from incoming meteoroids, most of which break up in our atmosphere before they can strike the surface.'
        ];
        break;

      case 3:
        return [
          'If the Sun were as tall as a typical front door, Earth would be the size of a dime, and Mars would be about as big as an aspirin tablet.',
          'Mars orbits our Sun, a star. Mars is the fourth planet from the Sun at an average distance of about 228 million km (142 million miles) or 1.52 AU.',
          'One day on Mars takes a little over 24 hours. Mars makes a complete orbit around the Sun (a year in Martian time) in 687 Earth days.',
          'Mars is a rocky planet. Its solid surface has been altered by volcanoes, impacts, winds, crustal movement and chemical reactions.',
          'Mars has a thin atmosphere made up mostly of carbon dioxide (CO2), argon (Ar), nitrogen (N2), and a small amount of oxygen and water vapor.',
          'Mars has two moons named Phobos and Deimos.',
          'There are no rings around Mars.',
          'Several missions have visited this planet, from flybys and orbiters to rovers on the surface.The first true Mars mission success was the Mariner 4 flyby in 1965.',
          'At this time, Mars\' surface cannot support life as we know it. Current missions are determining Mars\' past and future potential for life.',
          'Mars is known as the Red Planet because iron minerals in the Martian soil oxidize, or rust, causing the soil and atmosphere to look red.'
        ];
        break;

      case 4:
        return [
          'Eleven Earths could fit across Jupiter’s equator. If Earth were the size of a grape, Jupiter would be the size of a basketball.',
          'Jupiter orbits about 484 million miles (778 million kilometers) or 5.2 Astronomical Units (AU) from our Sun (Earth is one AU from the Sun).',
          'Jupiter rotates once about every 10 hours (a Jovian day), but takes about 12 Earth years to complete one orbit of the Sun (a Jovian year).',
          'Jupiter is a gas giant and so lacks an Earth-like surface. If it has a solid inner core at all, it’s likely only about the size of Earth.',
          'Jupiter\'s atmosphere is made up mostly of hydrogen (H2) and helium (He).',
          'Jupiter has more than 75 moons.',
          'In 1979 the Voyager mission discovered Jupiter’s faint ring system. All four giant planets in our solar system have ring systems.',
          'Nine spacecraft have visited Jupiter. Seven flew by and two have orbited the gas giant. Juno, the most recent, arrived at Jupiter in 2016.',
          'Jupiter cannot support life as we know it. But some of Jupite\'s moons have oceans beneath their crusts that might support life.',
          'Jupiter\'s Great Red Spot is a gigantic storm that’s about twice the size of Earth and has raged for over a century.'
        ];
        break;

      case 5:
        return [
          'Nine Earths side by side would almost span Saturn’s diameter. That doesn’t include Saturn’s rings.',
          'Saturn is the sixth planet from our Sun (a star) and orbits at a distance of about 886 million miles (1.4 billion kilometers) from the Sun.',
          'Saturn takes about 10.7 hours (no one knows precisely) to rotate on its axis once—a Saturn “day”—and 29 Earth years to orbit the sun.',
          'Saturn is a gas-giant planet and therefore does not have a solid surface like Earth’s. But it might have a solid core somewhere in there.',
          'Saturn\'s atmosphere is made up mostly of hydrogen (H2) and helium (He).',
          'Saturn has 53 known moons with an additional 29 moons awaiting confirmation of their discovery—that is a total of 82 moons.',
          'Saturn has the most spectacular ring system, with seven rings and several gaps and divisions between them.',
          'Few missions have visited Saturn: Pioneer 11 and Voyagers 1 and 2 flew by; But Cassini orbited Saturn 294 times from 2004 to 2017.',
          'Saturn cannot support life as we know it, but some of Saturn\'s moons have conditions that might support life.',
          'About two tons of Saturn’s mass came from Earth—the Cassini spacecraft was intentionally vaporized in Saturn’s atmosphere in 2017.'
        ];
        break;

      case 6:
        return [
          'Uranus is about four times wider than Earth. If Earth were a large apple, Uranus would be the size of a basketball.',
          'Uranus orbits our Sun, a star, and is the seventh planet from the Sun at a distance of about 1.8 billion miles (2.9 billion kilometers).',
          'Uranus takes about 17 hours to rotate once (a Uranian day), and about 84 Earth years to complete an orbit of the Sun (a Uranian year).',
          'Uranus is an ice giant. Most of its mass is a hot, dense fluid of "icy" materials – water, methane and ammonia – above a small rocky core.',
          'Uranus has an atmosphere made mostly of molecular hydrogen and atomic helium, with a small amount of methane.',
          'Uranus has 27 known moons, and they are named after characters from the works of William Shakespeare and Alexander Pope.',
          'Uranus has 13 known rings. The inner rings are narrow and dark and the outer rings are brightly colored.',
          'Voyager 2 is the only spacecraft to fly by Uranus. No spacecraft has orbited this distant planet to study it at length and up close.',
          'Uranus cannot support life as we know it.',
          'Like Venus, Uranus rotates east to west. But Uranus is unique in that it rotates on its side.'
        ];
        break;

      case 7:
        return [
          'Neptune is about four times wider than Earth. If Earth were a large apple, Neptune would be the size of a basketball.',
          'Neptune orbits our Sun, a star, and is the eighth planet from the Sun at a distance of about 2.8 billion miles (4.5 billion kilometers).',
          'Neptune takes about 16 hours to rotate once (a Neptunian day), and about 165 Earth years to orbit the sun (a Neptunian year).',
          'Neptune is an ice giant. Most of its mass is a hot, dense fluid of "icy" materials – water, methane and ammonia – above a small rocky core.',
          'Neptune\'s atmosphere is made up mostly of molecular hydrogen, atomic helium and methane.',
          'Neptune has 14 known moons which are named after sea gods and nymphs in Greek mythology.',
          'Neptune has at least five main rings and four more ring arcs, which are clumps of dust and debris likely formed by the gravity of a nearby moon.',
          'Voyager 2 is the only spacecraft to have visited Neptune. No spacecraft has orbited this distant planet to study it at length and up close.',
          'Neptune cannot support life as we know it.',
          'Because of dwarf planet Pluto’s elliptical orbit, Pluto is sometimes closer to the Sun (and us) than Neptune is.'
        ];
        break;

      default:
        return null;
        break;
    }
  }

  List<String> getPlanetFactsTitle(int index) {
    switch (index) {
      case 0:
        return [
          'Smallest',
          'Insider',
          'Long days, short years',
          'Rough Surface',
          'Can\'t breath in it',
          'Moonless',
          'Ringless',
          'Tough Place to Live ',
          'Big Sun',
          'Robotic visitors',
        ];
        break;

      case 1:
        return [
          'Toxc twin',
          'Second rock',
          'Long days, short years',
          'Diverse terrain',
          'Youthful surface',
          'Runaway greenhouse',
          'Stinky clouds',
          'Spacecraft magnet',
          'Life on Venus',
          'Backward sunrise'
        ];
        break;

      case 2:
        return [
          'Measuring up',
          'Third rock',
          'As the World turns',
          'Wer\'re on it',
          'Breath easy',
          'Our cosmic companion',
          'Ringless',
          'Orbital science',
          'Home, sweet home',
          'Protective shield'
        ];
        break;

      case 3:
        return [
          'Small planet',
          'Fourth rock',
          'Longer days',
          'Rugged terrain',
          'Bring a spacesuit',
          'Two Moons',
          'Ringless',
          'Many missions',
          'Tough place for life',
          'Rusty planet'
        ];
        break;

      case 4:
        return [
          'The Grandest Planet ',
          'Fifth Planet from Our Star',
          'Short Day/Long Year ',
          'What\'s inside',
          'Massive World, light elements',
          'Worlds galore',
          'Ringed World',
          'Exploring Jupiter',
          'Ingredients for life?',
          'Super storm'
        ];
        break;

      case 5:
        return [
          'A colossal planet',
          'In dim light',
          'Short day, long year',
          'Gas giant',
          'Hot air',
          'Mini solar system',
          'Glorious rings',
          'Rare destination',
          'Lifeless behemoth',
          'Add a dash of Earth'
        ];
        break;

      case 6:
        return [
          'Huge',
          'Seventh wanderer',
          'Short-ish day, longish year',
          'Ice giant',
          'Gassy',
          'Many Moons',
          'The other ringed World',
          'A bit lonely',
          'Lifeless',
          'One cool fact'
        ];
        break;

      case 7:
        return [
          'Giant',
          'Eighth wanderer',
          'Short day, long year',
          'Ice giant',
          'Gassy',
          'Moons',
          'Faint rings',
          'One voyage there',
          'Lifeless',
          'One cool fact'
        ];
        break;

      default:
        return null;
    }
  }
}
