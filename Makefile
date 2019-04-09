F=k \
  s2/base/stringprintf \
  s2/r2rect \
  s2/s1angle \
  s2/s1chord_angle \
  s2/s1interval \
  s2/s2cap \
  s2/s2cell \
  s2/s2cell_id \
  s2/s2cell_union \
  s2/s2cell_union \
  s2/s2coords \
  s2/s2debug \
  s2/s2edge_clipping \
  s2/s2edge_crosser \
  s2/s2edge_crosser \
  s2/s2edge_crossings \
  s2/s2edge_distances \
  s2/s2furthest_edge_query \
  s2/s2latlng \
  s2/s2latlng_rect \
  s2/s2max_distance_targets \
  s2/s2measures \
  s2/s2metrics \
  s2/s2pointutil \
  s2/s2predicates \
  s2/s2r2rect \
  s2/s2region \
  s2/s2region_coverer \
  s2/third_party/absl/base/internal/raw_logging \
  s2/third_party/absl/base/internal/throw_delegate \
  s2/third_party/absl/strings/ascii \
  s2/third_party/absl/strings/internal/memutil \
  s2/third_party/absl/strings/numbers \
  s2/third_party/absl/strings/str_cat \
  s2/util/coding/coder \
  s2/util/math/exactfloat/exactfloat

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
