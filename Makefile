build_dir = /home/hewenjie/build_dir/invention/
project_dir = ./
output_dir = ./output/
srcs = src/impl.cpp src/interface.cpp

objs = $(foreach n, $(srcs), $(build_dir)$(n).o)
deps = $(foreach n, $(srcs), $(build_dir)$(n).d)

.PHONY : target_all init_dir
target_all : init_dir output/lib/libinvent.a
init_dir : 

output/lib/libinvent.a : ${objs} init_dir
	ar rcs output/lib/libinvent.a $(objs)

$(objs):$(build_dir)%.o:%
	g++ -c $< -o $@ -I ./

$(deps):$(build_dir)%.d:%
	g++ -MM $< -I ./ | sed -r "s#(^.*.o):()#$@ $(build_dir)$<.o:#g" > $@;

-include $(deps)

clean:
	rm $(objs) $(deps)
