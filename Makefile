build_dir = ~/build_dir/invention
project_dir = ./
output_dir = ./output/

srcs = src/impl.cpp src/interface.cpp
objs = ${build_dir}/src/impl.cpp.o \
	   ${build_dir}/src/interface.cpp.o

-include ${build_dir}/header.depend
${build_dir}/header.depend : ${srcs}
	g++ -MM ${srcs} > ${build_dir}/header.depend -I ./

libinvent.a : ${objs}
	ar cr libinvent.a -o ${objs}

${build_dir}/src/impl.cpp.o : src/impl.cpp src/impl.h
	g++ -c src/impl.cpp -o ${build_dir}/src/impl.cpp.o -I ./
${build_dir}/src/interface.cpp.o : src/interface.cpp src/interface.h
	g++ -c src/interface.cpp -o ${build_dir}/src/interface.cpp.o -I ./

.PHONY:clean
clean:
	rm -fr libinvent.a ${objs}
