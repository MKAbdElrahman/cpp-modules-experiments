CXX := clang++
CXXFLAGS := -std=c++20 \
            -stdlib=libc++ \
            -fexperimental-library \
            -fmodules \
            -fprebuilt-implicit-modules \
            -fprebuilt-module-path=./build

MODULES_INTERFACES_DIR := src/modules/interfaces
BUILD_DIR := build

MODULE_INTERFACES := MK.Welcome MK.Math 
PCM_MODULES := $(addsuffix .pcm, $(addprefix $(BUILD_DIR)/, $(MODULE_INTERFACES)))

.PHONY: all clean

all:  main

$(BUILD_DIR)/%.pcm: $(MODULES_INTERFACES_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -x c++-module $< --precompile -o $@

main: src/main.cpp $(PCM_MODULES) MK.Math-impl.o
	$(CXX) $(CXXFLAGS) $(BUILD_DIR)/MK.Math-impl.o -o executables/$@ $< $(PCM_MODULES)

MK.Math-impl.o: 
	$(CXX) $(CXXFLAGS) -c src/modules/implements/MK.Math-impl.cpp -o $(BUILD_DIR)/MK.Math-impl.o

clean:
	rm -f executables/main $(PCM_MODULES) $(BUILD_DIR)/MK.Math-impl.o
