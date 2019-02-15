ids:`:s2/s2 2:(`ids;2);
rect:`:s2/s2 2:(`rect;2);

london:51.5 -0.1;
n:floor 1e6;
r:2000

nor:{
 $[x=2*n:x div 2;
  raze sqrt[-2*log n?1f]*/:(sin;cos)@\:(2*acos -1)*n?1f;
  -1_.z.s 1+x]
 };

nf:{
 raze flip x+\0.00015*nor each r#count x
 };

geo:flip`time`trk`lat`lon!((n?10D)+.z.d-10;where (n div r)#r),(nf each .3-(n div r)?'2#.6)+london;
geo:update `p#cid from `cid`time xasc update cid:ids[lat;lon] from geo;

pl:{
 raze{select[x]lat,lon,trk,time from geo}each flip deltas geo.cid binr/:x
 };

lu:{[x;y]
 select from pl rect . x where all(lat;lon;time)within'(x,enlist y)
 };

.z.ws:{
 r:.j.k x;
 p:(neg[d];d:r[4])+/:2#r;
 t:"D"$r 2 3;
 neg[.z.w].j.j flip lu[p;t]
 };

\p 54321
