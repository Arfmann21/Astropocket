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
  List<String> marsInfos = [
    'Terrestrial',
    '149,600,000km',
    '687 Earth days',
    '24.6 hours',
    'Description',
    'The fourth planet from the Sun, Mars is a dusty, cold, desert world with a very thin atmosphere.\n\nThis dynamic planet has seasons, polar ice caps, canyons, extinct volcanoes, and evidence that it was even more active in the past\n\nMars is one of the most explored bodies in our solar system, and it\'s the only planet where we\'ve sent rovers to roam the alien landscape. NASA currently has three spacecraft in orbit, and it has one rover and one lander on the surface. NASA launched the next-generation Perseverance rover to Mars on July 30, 2020. India and ESA have spacecraft in orbit above Mars. These robotic explorers have found lots of evidence that Mars was much wetter and warmer, with a thicker atmosphere, billions of years ago.',
    'Exploration',
    'No planet beyond Earth has been studied as intensely as Mars. Recorded observations of Mars date as far back as the era of ancient Egypt over 4,000 years ago, when they charted the planet\'s movements in the sky. Today, a science fleet of robotic spacecraft study Mars from all angles.\n\nSix spacecraft are in orbit at Mars. NASA\'s scient trio are Mars Reconnaissance Orbiter, Mars Odyssey and MAVEN. ESA managed the ExoMars Trace Gas Orbiter and Mars Express missions. India\'s first Red Planet spacecraft — the Mars Orbiter Mission (MOM) — since 2014.\n\nTwo robotic spacecraft are at work on the surface. NASA\'s Curiosity rover is exploring Mount Sharp in Gale Crater. NASA\'s InSight, a stationary lander, is probing Mars\' interior from a site on a flat smooth plain called Elysium Planitia.\n\nBoth NASA and ESA have plans to send new rovers to Mars in 2020.',
    'Size and Distance',
    'With a radius of 2,106 miles (3,390 kilometers), Mars is about half the size of Earth. If Earth were the size of a nickel, Mars would be about as big as a raspberry.\n\nFrom an average distance of 142 million miles (228 million kilometers), Mars is 1.5 astronomical units away from the Sun. One astronomical unit (abbreviated as AU), is the distance from the Sun to Earth. From this distance, it takes sunlight 13 minutes to travel from the Sun to Mars.',
    'Orbit and Rotation',
    'As Mars orbits the Sun, it completes one rotation every 24.6 hours, which is very similar to one day on Earth (23.9 hours). Martian days are called sols—short for "solar day." A year on Mars lasts 669.6 sols, which is the same as 687 Earth days.\n\nMars\' axis of rotation is tilted 25 degrees with respect to the plane of its orbit around the Sun. This is another similarity with Earth, which has an axial tilt of 23.4 degrees. Like Earth, Mars has distinct seasons, but they last longer than seasons here on Earth since Mars takes longer to orbit the Sun (because it\'s farther away). And while here on Earth the seasons are evenly spread over the year, lasting 3 months (or one quarter of a year), on Mars the seasons vary in length because of Mars\' elliptical, egg-shaped orbit around the Sun.\n\nSpring in the northern hemisphere (autumn in the southern) is the longest season at 194 sols. Autumn in the northern hemisphere (spring in the southern) is the shortest at 142 days. Northern winter/southern summer is 154 sols, and northern summer/southern winter is 178 sols.',
    'Structure',
    'Mars has a dense core at its center between 930 and 1,300 miles (1,500 to 2,100 kilometers) in radius. It\'s made of iron, nickel and sulfur. Surrounding the core is a rocky mantle between 770 and 1,170 miles (1,240 to 1,880 kilometers) thick, and above that, a crust made of iron, magnesium, aluminum, calcium and potassium. This crust is between 6 and 30 miles (10 to 50 kilometers) deep.',
    'Formation',
    'When the solar system settled into its current layout about 4.5 billion years ago, Mars formed when gravity pulled swirling gas and dust in to become the fourth planet from the Sun. Mars is about half the size of Earth, and like its fellow terrestrial planets, it has a central core, a rocky mantle and a solid crust.',
    'Surface',
    'The Red Planet is actually many colors. At the surface we see colors such as brown, gold and tan. The reason Mars looks reddish is due to oxidization—or rusting—of iron in the rocks, regolith (Martian “soil”), and dust of Mars. This dust gets kicked up into the atmosphere and from a distance makes the planet appear mostly red.\n\nInterestingly, while Mars is about half the diameter of Earth, its surface has nearly the same area as Earth’s dry land. Its volcanoes, impact craters, crustal movement, and atmospheric conditions such as dust storms have altered the landscape of Mars over many years, creating some of the solar system\'s most interesting topographical features.\n\nA large canyon system called Valles Marineris is long enough to stretch from California to New York—more than 3,000 miles (4,800 kilometers). This Martian canyon is 200 miles (320 kilometers) at its widest and 4.3 miles (7 kilometers) at its deepest. That\'s about 10 times the size of Earth\'s Grand Canyon.\n\nMars is home to the largest volcano in the solar system, Olympus Mons. It\'s three times taller than Earth\'s Mt. Everest with a base the size of the state of New Mexico.\n\nMars appears to have had a watery past, with ancient river valley networks, deltas and lakebeds, as well as rocks and minerals on the surface that could only have formed in liquid water. Some features suggest that Mars experienced huge floods about 3.5 billion years ago.\n\nThere is water on Mars today, but the Martian atmosphere is too thin for liquid water to exist for long on the surface. Today, water on Mars is found in the form of water-ice just under the surface in the polar regions as well as in briny (salty) water, which seasonally flows down some hillsides and crater walls.',
    'Atmosphere',
    'Mars has a thin atmosphere made up mostly of carbon dioxide, nitrogen and argon gases. To our eyes, the sky would be hazy and red because of suspended dust instead of the familiar blue tint we see on Earth. Mars\' sparse atmosphere doesn\'t offer much protection from impacts by such objects as meteorites, asteroids and comets\n\nThe temperature on Mars can be as high as 70 degrees Fahrenheit (20 degrees Celsius) or as low as about -225 degrees Fahrenheit (-153 degrees Celsius). And because the atmosphere is so thin, heat from the Sun easily escapes this planet. If you were to stand on the surface of Mars on the equator at noon, it would feel like spring at your feet (75 degrees Fahrenheit or 24 degrees Celsius) and winter at your head (32 degrees Fahrenheit or 0 degrees Celsius)\n\nOccasionally, winds on Mars are strong enough to create dust storms that cover much of the planet. After such storms, it can be months before all of the dust settles.',
    'Magnetosphere',
    'Mars has no global magnetic field today, but areas of the Martian crust in the southern hemisphere are highly magnetized, indicating traces of a magnetic field from 4 billion years ago.​',
    'Rings',
    'Mars has no rings. However, in 50 million years when Phobos crashes into Mars or breaks apart, it could create a dusty ring around the Red Planet.',
    'Moons',
    'Mars has two small moons, Phobos and Deimos, that may be captured asteroids. They\'re potato-shaped because they have too little mass for gravity to make them spherical\n\n.The moons get their names from the horses that pulled the chariot of the Greek god of war, Ares.\n\nPhobos, the innermost and larger moon, is heavily cratered, with deep grooves on its surface. It is slowly moving towards Mars and will crash into the planet or break apart in about 50 million years.\n\nDeimos is about half as big as Phobos and orbits two and a half times farther away from Mars. Oddly-shaped Deimos is covered in loose dirt that often fills the craters on its surface, making it appear smoother than pockmarked Phobos.',
    'Potential for Life',
    'Scientists don\'t expect to find living things currently thriving on Mars. Instead, they\'re looking for signs of life that existed long ago, when Mars was warmer and covered with water.'
  ];

  List<String> mercuryInfos = [
    'Terrestrial',
    '58,000,000km',
    '88 Earth days',
    '176 Earth Days',
    'Description',
    'The smallest planet in our solar system and nearest to the Sun, Mercury is only slightly larger than Earth\'s Moon. From the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter. Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system – that title belongs to nearby Venus, thanks to its dense atmosphere. But Mercury is the fastest planet, zipping around the Sun every 88 Earth days.\n\nMercury is appropriately named for the swiftest of the ancient Roman gods.',
    'Exploration',
    'Because Mercury is so close to the Sun, it is hard to directly observe from Earth except during dawn or twilight, when the Sun\'s brightness doesn\'t outshine little Mercury. However, 13 times each century, observers on Earth can watch Mercury pass across the face of the Sun, an event called a transit. These rare transits fall within several days of 8 May and 10 November. The first transits of Mercury in the 21st century occurred May 7, 2003, Nov. 8, 2006, and May 9, 2016. The next one will be Nov. 11, 2019.\n\nThe first spacecraft to visit Mercury was Mariner 10, which imaged about 45 percent of the surface. And the MESSENGER spacecraft flew by Mercury three times and orbited the planet for four years before crashing on its surface. The European Space Agency launched their first mission to explore Mercury—BepiColombo—in 2018.',
    'Size and Distance',
    'With a radius of 1,516 miles (2,440 kilometers), Mercury is a little more than 1/3 the width of Earth. If Earth were the size of a nickel, Mercury would be about as big as a blueberry.\n\nFrom an average distance of 36 million miles (58 million kilometers), Mercury is 0.4 astronomical units away from the Sun. One astronomical unit (abbreviated as AU), is the distance from the Sun to Earth. From this distance, it takes sunlight 3.2 minutes to travel from the Sun to Mercury.',
    'Orbit and Rotation',
    'Mercury\'s highly eccentric, egg-shaped orbit takes the planet as close as 29 million miles (47 million kilometers) and as far as 43 million miles (70 million kilometers) from the Sun. It speeds around the Sun every 88 days, traveling through space at nearly 29 miles (47 kilometers) per second, faster than any other planet.\n\nMercury spins slowly on its axis and completes one rotation every 59 Earth days. But when Mercury is moving fastest in its elliptical orbit around the Sun (and it is closest to the Sun), each rotation is not accompanied by a sunrise and sunset like it is on most other planets. The morning Sun appears to rise briefly, set and rise again from some parts of the planet\'s surface. The same thing happens in reverse at sunset for other parts of the surface. One Mercury solar day (one full day-night cycle) equals 176 Earth days—just over two years on Mercury.\n\nMercury\'s axis of rotation is tilted just 2 degrees with respect to the plane of its orbit around the Sun. That means it spins nearly perfectly upright and so does not experience seasons like many other planets do.',
    'Structure',
    'Mercury is the second densest planet, after Earth. It has a large metallic core with a radius of about 1,289 miles (2,074 kilometers), about 85 percent of the planet\'s radius. There is evidence that it is partly molten, or liquid. Mercury\'s outer shell, comparable to Earth\'s outer shell (called the mantle and crust), is only about 400 kilometers (250 miles) thick.',
    'Formation',
    'Mercury formed about 4.5 billion years ago when gravity pulled swirling gas and dust together to form this small planet nearest the Sun. Like its fellow terrestrial planets, Mercury has a central core, a rocky mantle and a solid crust.',
    'Surface',
    'Mercury\'s surface resembles that of Earth\'s moon, scarred by many impact craters resulting from collisions with meteoroids and comets. Craters and features on Mercury are named after famous deceased artists, musicians or authors, including children\'s author Dr. Seuss and dance pioneer Alvin Ailey.\n\nVery large impact basins, including Caloris (960 miles or 1,550 kilometers in diameter) and Rachmaninoff (190 miles, or 306 kilometers in diameter), were created by asteroid impacts on the planet\'s surface early in the solar system\'s history. While there are large areas of smooth terrain, there are also cliffs, some hundreds of miles long and soaring up to a mile high. They rose as the planet\'s interior cooled and contracted over the billions of years since Mercury formed.\n\nMost of Mercury\'s surface would appear greyish-brown to the human eye. The bright streaks are called "crater rays." They are formed when an asteroid or comet strikes the surface. The tremendous amount of energy that is released in such an impact digs a big hole in the ground, and also crushes a huge amount of rock under the point of impact. Some of this crushed material is thrown far from the crater and then falls to the surface, forming the rays. Fine particles of crushed rock are more reflective than large pieces, so the rays look brighter. The space environment—dust impacts and solar-wind particles—causes the rays to darken with time.\n\nTemperatures on the surface of Mercury are extreme, both hot and cold. During the day, temperatures on Mercury\'s surface can reach 800 degrees Fahrenheit (430 degrees Celsius). Because the planet has no atmosphere to retain that heat, nighttime temperatures on the surface can drop to minus 290 degrees Fahrenheit (minus 180 degrees Celsius)\n\nMercury may have water ice at its north and south poles inside deep craters, but only in regions of permanent shadow. There it could be cold enough to preserve water ice despite the high temperatures on sunlit parts of the planet.',
    'Atmosphere',
    'Instead of an atmosphere, Mercury possesses a thin exosphere made up of atoms blasted off the surface by the solar wind and striking meteoroids. Mercury\'s exosphere is composed mostly of oxygen, sodium, hydrogen, helium and potassium.',
    'Magnetosphere',
    'Mercury\'s magnetic field is offset relative to the planet\'s equator. Though Mercury\'s magnetic field at the surface has just one percent the strength of Earth\'s, it interacts with the magnetic field of the solar wind to sometimes create intense magnetic tornadoes that funnel the fast, hot solar wind plasma down to the surface of the planet. When the ions strike the surface, they knock off neutrally charged atoms and send them on a loop high into the sky.',
    'Rings',
    'Mars has no rings',
    'Moons',
    'Mercury has no moon.',
    'Potential for Life',
    'Mercury\'s environment is not conducive to life as we know it. The temperatures and solar radiation that characterize this planet are most likely too extreme for organisms to adapt to.'
  ];

  List<String> venusInfos = [
    'Terrestrial',
    '108,000,000km',
    '88 Earth days',
    '176 Earth Days',

    'Description',
    'Venus is the second planet from the Sun and our closest planetary neighbor. Similar in structure and size to Earth, Venus spins slowly in the opposite direction from most planets. Its thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system with surface temperatures hot enough to melt lead. Glimpses below the clouds reveal volcanoes and deformed mountains.\n\nVenus is named for the ancient Roman goddess of love and beauty, who was known as Aphrodite to the Ancient Greeks.',
    'Exploration',
    'The brightest object in the night sky on Earth (besides our moon), Venus has been observed for millennia. And as one of just two bodies between Earth and the Sun, Venus periodically passes across the face of the sun—a phenomenon called a transit. Observing transits of Venus has helped astronomers study the nearby planet and better understand the solar system and our place in it. Transits of Venus occur in pairs with more than a century separating each pair, occurring in 1631 and 1639; 1761, 1769; 1874, 1882; and 2004, 2012. The next transit isn\'t until December 2117. Such long gaps occur between transits because Earth\'s and Venus\' orbits around the sun are inclined differently, so Venus much more often passes between Earth and the sun without crossing the face of the sun from our perspective.\n\nSpacecraft from several nations have visited Venus, including the Soviet Union’s successful Venera series made the first landings on the surface of Venus. NASA’s Magellan mission, which studied Venus from 1990 to 1994, used radar to map 98 percent of the planet’s surface. Currently, Japan’s Akatsuki is studying Venus from orbit.​',
    'Size and Distance',
    "With a radius of 3,760 miles (6,052 kilometers), Venus is roughly the same size as Earth — just slightly smaller.\n\nFrom an average distance of 67 million miles (108 million kilometers), Venus is 0.7 astronomical units away from the Sun. One astronomical unit (abbreviated as AU), is the distance from the Sun to Earth. It takes sunlight 6 minutes to travel from the Sun to Venus.",
    'Orbit and Rotation',
    'Venus\' rotation and orbit are unusual in several ways. Venus is one of just two planets that rotate from east to west. Only Venus and Uranus have this "backwards" rotation. It completes one rotation in 243 Earth days — the longest day of any planet in our solar system, even longer than a whole year on Venus. But the Sun doesn\'t rise and set each "day" on Venus like it does on most other planets. On Venus, one day-night cycle takes 117 Earth days because Venus rotates in the direction opposite of its orbital revolution around the Sun.\n\nVenus makes a complete orbit around the Sun (a year in Venusian time) in 225 Earth days or slightly less than two Venusian day-night cycles. Its orbit around the Sun is the most circular of any planet — nearly a perfect circle. Other planet\'s orbits are more elliptical, or oval-shaped.\n\nWith an axial tilt of just 3 degrees, Venus spins nearly upright, and so does not experience noticeable seasons.',
    'Structure',
    'Venus is in many ways similar to Earth in its structure. It has an iron core that is approximately 2,000 miles (3,200 kilometers) in radius. Above that is a mantle made of hot rock slowly churning due to the planet\'s interior heat. The surface is a thin crust of rock that bulges and moves as Venus\' mantle shifts and creates volcanoes.',
    'Formation',
    'When the solar system settled into its current layout about 4.5 billion years ago, Venus formed when gravity pulled swirling gas and dust together to form the second planet from the Sun. Like its fellow terrestrial planets, Venus has a central core, a rocky mantle and a solid crust.',
    'Surface',
    'From space, Venus is bright white because it is covered with clouds that reflect and scatter sunlight. At the surface, the rocks are different shades of grey, like rocks on Earth, but the thick atmosphere filters the sunlight so that everything would look orange if you were standing on Venus.\n\nVenus has mountains, valleys, and tens of thousands of volcanoes. The highest mountain on Venus, Maxwell Montes, is 20,000 feet high (8.8 kilometers), similar to the highest mountain on Earth, Mount Everest. The landscape is dusty, and surface temperatures reach a scalding 880 degrees Fahrenheit (471 degrees Celsius).\n\nIt is thought that Venus was completely resurfaced by volcanic activity 300 to 500 million years ago. Venus has two large highland areas: Ishtar Terra, about the size of Australia, in the north polar region; and Aphrodite Terra, about the size of South America, straddling the equator and extending for almost 6,000 miles (10,000 kilometers).\n\nVenus is covered in craters, but none are smaller than 0.9 to 1.2 miles (1.5 to 2 kilometers) across. Small meteoroids burn up in the dense atmosphere, so only large meteoroids reach the surface and create impact craters.\n\nAlmost all the surface features of Venus are named for noteworthy Earth women — both mythological and real. A volcanic crater is named for Sacajawea, the Native American woman who guided Lewis and Clark\'s exploration. A deep canyon is named for Diana, Roman goddess of the hunt.',
    'Atmosphere',
    'Venus\' atmosphere consists mainly of carbon dioxide, with clouds of sulfuric acid droplets. The thick atmosphere traps the Sun\'s heat, resulting in surface temperatures higher than 880 degrees Fahrenheit (470 degrees Celsius). The atmosphere has many layers with different temperatures. At the level where the clouds are, about 30 miles up from the surface, it\'s about the same temperature as on the surface of the Earth.\n\nAs Venus moves forward in its solar orbit while slowly rotating backwards on its axis, the top level of clouds zips around the planet every four Earth days, driven by hurricane-force winds traveling at about 224 miles (360 kilometers) per hour. Atmospheric lightning bursts light up these quick-moving clouds. Speeds within the clouds decrease with cloud height, and at the surface are estimated to be just a few miles per hour.\n\nOn the ground, it would look like a very hazy, overcast day on Earth. And the atmosphere is so heavy it would feel like you were 1 mile (1.6 kilometers) deep underwater.',
    'Magnetosphere',
    'Even though Venus is similar in size to the Earth and has a similarly-sized iron core, Venus\' magnetic field is much weaker than the Earth\'s due to Venus\' slow rotation. ​',
    'Rings',
    'Venus has no rings',
    'Moons',
    'Venus has no Moons',
    'Potential for Life',
    'No human has visited Venus, but the spacecraft that have been sent to the surface of Venus do not last very long there. Venus\' high surface temperatures overheat electronics in spacecraft in a short time, so it seems unlikely that a person could survive for long on the Venusian surface. \n\nThere is speculation about life existing in Venus\' distant past, as well as questions about the possibility of life in the top cloud layers of Venus\' atmosphere, where the temperatures are less extreme.'
  ];

  List<String> getInfos(String requestedInfo) {
    switch (requestedInfo) {
      case 'Mercury':
        return mercuryInfos;
      case 'Mars':
        return marsInfos;
      case 'Venus':
        return venusInfos;
      default:
        return ['Error'];
    }
  }
}
