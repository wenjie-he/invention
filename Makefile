build_dir = ~/BUILD_OUTPUT/invention/
srcs = src/impl.cpp src/interface.cpp
objs = ~/build_dir/libinvent/src/impl.cpp.o \
	   ~/build_dir/libinvent/src/interface.cpp.o

libinvent.a : ${objs}
	ar cr libinvent.a -o ${objs}

~/build_dir/libinvent/src/impl.cpp.o : src/impl.cpp src/impl.h
	g++ -c src/impl.cpp -o src/impl.cpp.o -I ./
~/build_dir/libinvent/src/interface.cpp.o : src/interface.cpp src/interface.h
	g++ -c src/interface.cpp -o src/interface.cpp.o -I ./
