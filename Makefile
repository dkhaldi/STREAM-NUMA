CC = gcc 
#gcc -fopenmp -lnuma stream-libnuma.c -o stream-libnuma
#gcc -fopenmp stream-hwloc-eureka.c -I/opt/hwloc/1.10.0/include/ -o stream-hwloc -L/opt/hwloc/1.10.0/lib64/ -lhwloc
CFLAGS = -fopenmp 
HWLOCFLAGS = `pkg-config --cflags hwloc`
LDLIBSH = `pkg-config --libs hwloc`
LDLIBSL = -lnuma

#cc hwloc-hello.c $(CFLAGS) -o hwloc-hello $(LDLIBS)

all: stream-hwloc stream-libnuma

stream-hwloc: stream-hwloc.c 
		$(CC)   $< $(CFLAGS) $(HWLOCFLAGS) -o $@ $(LDLIBSH)

stream-libnuma: stream-libnuma.c 
		$(CC)   $< $(CFLAGS) -o $@ $(LDLIBSL)

clean:
		rm -rf stream-hwloc stream-libnuma
