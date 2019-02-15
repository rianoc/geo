F=s2latlng s2cellid s2regionintersection s2 s2edgeutil s2r2rect s1angle s2edgeindex \
  util/math/mathutil util/math/exactfloat/exactfloat s2regionunion s2polygon s2regioncoverer \
  s2polyline s2polygonbuilder s2loop s2cell s2cellunion s2cap base/logging s1interval \
  s2pointregion s2region s2latlngrect strings/split strings/stringprintf strings/strtoint strings/strutil k

CXXFLAGS=-I. -O2 -std=c++11 -DNDEBUG -DS2_USE_EXACTFLOAT -fPIC 

ifeq ($(shell uname),Linux)
 LDFLAGS=-fPIC -shared
else ifeq ($(shell uname),Darwin)
 LDFLAGS=-bundle -undefined dynamic_lookup
endif

s2.so: $(F:%=%.o)
	$(CXX) $(LDFLAGS) -o $@ $^ -lcrypto
	
clean:
	rm -f s2.so $(F:%=%.o)
