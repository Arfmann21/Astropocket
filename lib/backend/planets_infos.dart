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
    'The fourth planet from the Sun, Mars is a dusty, cold, desert world with a very thin atmosphere.\n\nThis dynamic planet has seasons, polar ice caps, canyons, extinct volcanoes, and evidence that it was even more active in the past\n\nMars is one of the most explored bodies in our solar system, and it\'s the only planet where we\'ve sent rovers to roam the alien landscape. NASA currently has three spacecraft in orbit, and it has one rover and one lander on the surface. NASA launched the next-generation Perseverance rover to Mars on July 30, 2020. India and ESA have spacecraft in orbit above Mars. These robotic explorers have found lots of evidence that Mars was much wetter and warmer, with a thicker atmosphere, billions of years ago.',
   // 'Size and distance',
    'With a radius of 2,106 miles (3,390 kilometers), Mars is about half the size of Earth. If Earth were the size of a nickel, Mars would be about as big as a raspberry.\n\nFrom an average distance of 142 million miles (228 million kilometers), Mars is 1.5 astronomical units away from the Sun. One astronomical unit (abbreviated as AU), is the distance from the Sun to Earth. From this distance, it takes sunlight 13 minutes to travel from the Sun to Mars',
    //'Orbit and Rotation',
    'As Mars orbits the Sun, it completes one rotation every 24.6 hours, which is very similar to one day on Earth (23.9 hours). Martian days are called sols—short for "solar day." A year on Mars lasts 669.6 sols, which is the same as 687 Earth days.\n\nMars\' axis of rotation is tilted 25 degrees with respect to the plane of its orbit around the Sun. This is another similarity with Earth, which has an axial tilt of 23.4 degrees. Like Earth, Mars has distinct seasons, but they last longer than seasons here on Earth since Mars takes longer to orbit the Sun (because it\'s farther away). And while here on Earth the seasons are evenly spread over the year, lasting 3 months (or one quarter of a year), on Mars the seasons vary in length because of Mars\' elliptical, egg-shaped orbit around the Sun.\n\nSpring in the northern hemisphere (autumn in the southern) is the longest season at 194 sols. Autumn in the northern hemisphere (spring in the southern) is the shortest at 142 days. Northern winter/southern summer is 154 sols, and northern summer/southern winter is 178 sols.',
   // 'Structure',
    'Mars has a dense core at its center between 930 and 1,300 miles (1,500 to 2,100 kilometers) in radius. It\'s made of iron, nickel and sulfur. Surrounding the core is a rocky mantle between 770 and 1,170 miles (1,240 to 1,880 kilometers) thick, and above that, a crust made of iron, magnesium, aluminum, calcium and potassium. This crust is between 6 and 30 miles (10 to 50 kilometers) deep.',
    //'Formation',
    'When the solar system settled into its current layout about 4.5 billion years ago, Mars formed when gravity pulled swirling gas and dust in to become the fourth planet from the Sun. Mars is about half the size of Earth, and like its fellow terrestrial planets, it has a central core, a rocky mantle and a solid crust.',
    //'Surface',
    'The Red Planet is actually many colors. At the surface we see colors such as brown, gold and tan. The reason Mars looks reddish is due to oxidization—or rusting—of iron in the rocks, regolith (Martian “soil”), and dust of Mars. This dust gets kicked up into the atmosphere and from a distance makes the planet appear mostly red.\n\nInterestingly, while Mars is about half the diameter of Earth, its surface has nearly the same area as Earth’s dry land. Its volcanoes, impact craters, crustal movement, and atmospheric conditions such as dust storms have altered the landscape of Mars over many years, creating some of the solar system\'s most interesting topographical features.\n\nA large canyon system called Valles Marineris is long enough to stretch from California to New York—more than 3,000 miles (4,800 kilometers). This Martian canyon is 200 miles (320 kilometers) at its widest and 4.3 miles (7 kilometers) at its deepest. That\'s about 10 times the size of Earth\'s Grand Canyon.\n\nMars is home to the largest volcano in the solar system, Olympus Mons. It\'s three times taller than Earth\'s Mt. Everest with a base the size of the state of New Mexico.\n\nMars appears to have had a watery past, with ancient river valley networks, deltas and lakebeds, as well as rocks and minerals on the surface that could only have formed in liquid water. Some features suggest that Mars experienced huge floods about 3.5 billion years ago.\n\nThere is water on Mars today, but the Martian atmosphere is too thin for liquid water to exist for long on the surface. Today, water on Mars is found in the form of water-ice just under the surface in the polar regions as well as in briny (salty) water, which seasonally flows down some hillsides and crater walls.',
   // 'Atmosphere',
    'Mars has a thin atmosphere made up mostly of carbon dioxide, nitrogen and argon gases. To our eyes, the sky would be hazy and red because of suspended dust instead of the familiar blue tint we see on Earth. Mars\' sparse atmosphere doesn\'t offer much protection from impacts by such objects as meteorites, asteroids and comets\n\nThe temperature on Mars can be as high as 70 degrees Fahrenheit (20 degrees Celsius) or as low as about -225 degrees Fahrenheit (-153 degrees Celsius). And because the atmosphere is so thin, heat from the Sun easily escapes this planet. If you were to stand on the surface of Mars on the equator at noon, it would feel like spring at your feet (75 degrees Fahrenheit or 24 degrees Celsius) and winter at your head (32 degrees Fahrenheit or 0 degrees Celsius)\n\nOccasionally, winds on Mars are strong enough to create dust storms that cover much of the planet. After such storms, it can be months before all of the dust settles.'
  ];

  List<String> mercuryInfos = [
    'Terrestrial',
    '58,000,000km',
    '88 Earth days',
    '176 Earth Days',
  ];

  List<String> getInfos(String requestedInfo) {
    switch (requestedInfo) {
      case 'Mercury':
        return mercuryInfos;
      case 'Mars':
        return marsInfos;
    }
  }
}
