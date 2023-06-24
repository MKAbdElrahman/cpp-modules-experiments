CXX := clang++
CXXFLAGS := -std=c++20 \
            -stdlib=libc++ \
            -fexperimental-library \
            -fmodules \
            -fprebuilt-implicit-modules \
            -fprebuilt-module-path=./build


MODULES_INTERFACES_DIR := src/modules/interfaces
MODULES_IMPLEMENTATIONS_DIR := src/modules/implements

MODULE_INTERFACES := MK.Welcome MK.Math 
MODULES_IMPLEMENTATIONS := MK.Math-impl

BUILD_DIR := build


PCM_MODULES := $(addsuffix .pcm, $(addprefix $(BUILD_DIR)/, $(MODULE_INTERFACES)))

.PHONY: all clean

# compile the module interfaces
$(BUILD_DIR)/%.pcm: $(MODULES_INTERFACES_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -x c++-module $< --precompile -o $@

# compile the implementations for the interfaces
$(BUILD_DIR)/%.o: $(MODULES_IMPLEMENTATIONS_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# compile main
main: src/main.cpp $(PCM_MODULES) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLEMENTATIONS)))
	$(CXX) $(CXXFLAGS) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLEMENTATIONS))) -o executables/$@ $< $(PCM_MODULES)


all:  main

clean:
	rm -f executables/main $(PCM_MODULES) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLEMENTATIONS)))