build_dir = ~/build_dir/invention
project_dir = ./
output_dir = ./output/

srcs = src/impl.cpp src/interface.cpp
objs = $(foreach n, $(srcs), $(n).o)
deps = $(foreach n, $(srcs), $(n).d)

.PHONY : target_all init_dir
target_all : init_dir output/lib/libinvent.a
init_dir : 

output/lib/libinvent.a : ${objs} init_dir
	echo "hello"

$(objs):%.o:%
	g++ -c $< -o $@ -I ./

$(deps):%.d:%
	g++ -MM $< -I ./ | sed -r "s#(^.*.o):()#$@ $<.o:#g" > $@;

include $(deps)

clean:
	rm $(objs) $(deps)
