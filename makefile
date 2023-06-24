CXX := clang++
CXXFLAGS := -std=c++20 \
            -stdlib=libc++ \
            -fexperimental-library \
            -fmodules \
            -fprebuilt-implicit-modules \
            -fprebuilt-module-path=./build

MODULES_DIR := src/modules/interfaces
BUILT_MODULES_DIR := build

MODULES := MK.Welcome MK.Math 
PCM_MODULES := $(addsuffix .pcm, $(addprefix $(BUILT_MODULES_DIR)/, $(MODULES)))

.PHONY: all clean

all:  main

$(BUILT_MODULES_DIR)/%.pcm: $(MODULES_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -x c++-module $< --precompile -o $@


main: src/main.cpp $(PCM_MODULES) impl.o
	$(CXX) $(CXXFLAGS) build/impl.o -o executables/$@ $< $(PCM_MODULES)

impl.o: 
	$(CXX) $(CXXFLAGS) -c src/modules/implements/impl.cpp -o build/impl.o
clean:
	rm -f executables/main  $(PCM_MODULES) build/impl.o