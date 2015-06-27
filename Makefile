CC = gcc 
CFLAGS = -fopenmp 
HWLOCFLAGS = `pkg-config --cflags hwloc`
LDLIBSH = `pkg-config --libs hwloc`
LDLIBSL = -lnuma


all: stream-hwloc stream-libnuma stream-hwloc-alloc stream-libnuma-alloc 

stream-hwloc: stream-hwloc.c 
		$(CC)   $< $(CFLAGS) $(HWLOCFLAGS) -o $@ $(LDLIBSH)

stream-libnuma: stream-libnuma.c 
		$(CC)   $< $(CFLAGS) -o $@ $(LDLIBSL)


stream-hwloc-alloc: stream-hwloc-alloc.c
	$(CC)   $< $(CFLAGS) $(HWLOCFLAGS) -o $@ $(LDLIBSH)

stream-libnuma-alloc: stream-libnuma-alloc.c
	$(CC)   $< $(CFLAGS) -o $@ $(LDLIBSL)

clean:
		rm -rf stream-hwloc stream-libnuma stream-hwloc-alloc stream-libnuma-alloc
