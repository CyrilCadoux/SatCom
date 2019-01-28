function area = small_spot_beam(range,beam_angle)
%area = small_spot_beam(range,beam_angle)
%area is the covered area by a spot beam km^2
%range is the longest distance from sat to earth
%beam_angle is the angle of the spot beam (must me under 10 degrees)

if(beam_angle/2 > 10)
    error('beam_angle is too big (must be smaller than 5 degrees)')
end

area = range^2*sind(beam_angle)^2*pi;

end