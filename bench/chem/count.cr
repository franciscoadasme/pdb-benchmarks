require "chem"

pdbfile = ARGV[0]
repeats = ARGV[1].to_i

struc = Chem::Structure.read pdbfile

total_elapsed = (0...repeats).sum do
  Time.measure do
    struc.residues.count &.matches?("ALA")
  end
end

puts total_elapsed.total_seconds / repeats
