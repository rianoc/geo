#include"s2latlng.h"
#include"s2latlngrect.h"
#include"s2cap.h"
#include"s2cellid.h"
#include"s2regioncoverer.h"
using std::vector;
#define LVL 14
#define KXVER 3
#include"k.h"
#define EXP extern "C" __attribute((externally_visible))
Z S2LatLng ll(F x,F y){R S2LatLng::FromDegrees(x,y);}
Z S2CellId id(F x,F y){R S2CellId::FromLatLng(ll(x,y));}
Z I toI(S2CellId s){R s.id()>>32;}
EXP K ids(K x,K y){K r=ktn(KI,xn);DO(xn,kI(r)[i]=toI(id(kF(x)[i],kF(y)[i]).parent(LVL)));R r;}
EXP K rect(K x,K y){S2RegionCoverer c;c.set_max_level(LVL);vector<S2CellId>v;
 c.GetCovering(S2LatLngRect::FromPointPair(ll(kF(x)[0],kF(y)[0]),ll(kF(x)[1],kF(y)[1])),&v);
 J n=v.size();K a=ktn(KI,n),b=ktn(KI,n);DO(n,kI(a)[i]=toI(v[i].child_begin(LVL));kI(b)[i]=toI(v[i].child_end(LVL)))
 R knk(2,a,b);}
