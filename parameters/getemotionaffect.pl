open(FILE,$ARGV[0]);
while($line = <FILE>)
{
    chomp($line);
    @list = ();
    @list = split ",",$line;
    #print $list[0]."\n";
    $affect{$list[0]}=$line;
}
close(FILE);

open(FILE,$ARGV[1]);

open(HAPPY,">happy.csv");
open(SAD,">sadness.csv");
open(ANGRY,">angry.csv");
open(SURPRISE,">surprise.csv");

while($line = <FILE>)
{
  @list = ();
  @list = split ",",$line;
  print $list[0]."\n";
  $affvec = $affect{$list[0]};
  $affvec = substr($affvec,index($affvec,",")+1);

  if(index($line,"happy")>0){print HAPPY $affvec."\n";}
  if(index($line,"sadness")>0){print SAD $affvec."\n";}
  if(index($line,"angry")>0){print ANGRY $affvec."\n";}
  if(index($line,"surprise")>0){print SURPRISE $affvec."\n";}

}
close(FILE);
close(HAPPY);
close(SAD);
close(ANGRY);
close(SURPRISE);