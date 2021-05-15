build_dir = ~/build_dir/invention
project_dir = ./
output_dir = ./output/

srcs = src/impl.cpp src/interface.cpp
objs = ${build_dir}/src/impl.o \
	   ${build_dir}/src/interface.o
.PHONY : target_all init_dir
target_all : init_dir libinvent.a
init_dir : 
	-mkdir -p ${build_dir}
	-mkdir -p ${build_dir}/src

libinvent.a : ${objs} init_dir
	ar cr libinvent.a -o ${objs}

${build_dir}/src/impl.o : src/impl.cpp src/impl.h
	g++ -c src/impl.cpp -o ${build_dir}/src/impl.o -I ./
${build_dir}/src/interface.o : src/interface.cpp src/interface.h
	g++ -c src/interface.cpp -o ${build_dir}/src/interface.o -I ./

-include ${build_dir}/header.depend
${build_dir}/header.depend : ${srcs}
	g++ -MM ${srcs} > ${build_dir}/header.depend -I ./

.PHONY:clean
clean:
	rm -fr libinvent.a ${objs}
