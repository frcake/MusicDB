class UserProfiler
  def rock_profile
    { metal: (1..2),
      country: (0..1),
      jazz: (1..2),
      reggae: (0..1),
      blues: (2..3),
      pop: (0..0),
      instrumental: (0..1),
      electronica: (0..0),
      techno: (0..0),
      punk: (0..0),
      indie: (1..2),
      alternative: (1..2),
      rock: (4..5),
      hip_hop: (0..0),
      dance: (0..0),
      rnb: (0..0) }
 end

  def hip_hop_profile
    { metal: (0..0),
      country: (0..1),
      jazz: (0..1),
      reggae: (0..1),
      blues: (0..0),
      pop: (0..0),
      instrumental: (1..2),
      electronica: (0..0),
      techno: (0..0),
      punk: (0..0),
      indie: (0..1),
      alternative: (0..0),
      rock: (0..0),
      hip_hop: (4..5),
      dance: (0..0),
      rnb: (4..5) }
   end

  def pop_profile
    { metal: (0..0),
      country: (0..1),
      jazz: (0..0),
      reggae: (0..1),
      blues: (0..0),
      pop: (4..5),
      instrumental: (0..0),
      electronica: (0..0),
      techno: (0..0),
      punk: (0..0),
      indie: (0..1),
      alternative: (0..1),
      rock: (0..1),
      hip_hop: (1..3),
      dance: (2..4),
      rnb: (1..3) }
  end

  def country_profile
    { metal: (0..0),
      country: (4..5),
      jazz: (3..4),
      reggae: (1..3),
      blues: (3..4),
      pop: (0..0),
      instrumental: (0..1),
      electronica: (0..0),
      techno: (0..0),
      punk: (0..0),
      indie: (0..0),
      alternative: (0..0),
      rock: (1..3),
      hip_hop: (0..0),
      dance: (0..0),
      rnb: (0..0) }
   end

  def indie_profile
    { metal: (0..1),
      country: (0..1),
      jazz: (0..0),
      reggae: (1..3),
      blues: (0..0),
      pop: (0..1),
      instrumental: (0..0),
      electronica: (0..0),
      techno: (0..0),
      punk: (1..2),
      indie: (4..5),
      alternative: (4..5),
      rock: (2..4),
      hip_hop: (0..0),
      dance: (0..0),
      rnb: (0..0) }
  end

  def punk_profile
    { metal: (2..3),
      country: (0..0),
      jazz: (0..0),
      reggae: (0..0),
      blues: (0..0),
      pop: (0..0),
      instrumental: (0..0),
      electronica: (0..0),
      techno: (0..0),
      punk: (4..5),
      indie: (1..2),
      alternative: (0..0),
      rock: (1..2),
      hip_hop: (0..0),
      dance: (0..0),
      rnb: (0..0) }
  end

  def dance_profile
    { metal: (0..0),
      country: (0..0),
      jazz: (0..0),
      reggae: (0..0),
      blues: (0..0),
      pop: (3..5),
      instrumental: (2..3),
      electronica: (2..3),
      techno: (1..3),
      punk: (0..0),
      indie: (0..0),
      alternative: (0..0),
      rock: (0..0),
      hip_hop: (0..0),
      dance: (4..5),
      rnb: (0..1) }
  end

  def jazz_profile
    { metal: (0..0),
      country: (2..4),
      jazz: (4..5),
      reggae: (0..1),
      blues: (3..5),
      pop: (0..0),
      instrumental: (3..4),
      electronica: (0..0),
      techno: (0..0),
      punk: (0..0),
      indie: (0..0),
      alternative: (0..0),
      rock: (2..3),
      hip_hop: (0..0),
      dance: (0..0),
      rnb: (0..0) }
  end
end
