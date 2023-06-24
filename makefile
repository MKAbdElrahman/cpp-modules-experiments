CXX := clang++
CXXFLAGS := -std=c++20 \
            -stdlib=libc++ \
            -fexperimental-library \
            -fmodules \
            -fprebuilt-implicit-modules \
            -fprebuilt-module-path=./build


SOURCE_DIR :=  src 
BUILD_DIR := build

MODULES_INTERFACES_DIR := src/modules/interfaces
MODULES_IMPLS_DIR := src/modules/implements


MODULE_INTERFACES := MK.Welcome MK.Math MK.School
PCM_MODULES := $(addsuffix .pcm, $(addprefix $(BUILD_DIR)/, $(MODULE_INTERFACES)))

MODULES_IMPLS := MK.Math-impl MK.School-impl

.PHONY: all clean


# compile module interfaces
$(BUILD_DIR)/%.pcm: $(MODULES_INTERFACES_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -x c++-module $< --precompile -o $@
# compile module implementations
$(BUILD_DIR)/%.o: $(MODULES_IMPLS_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@


main: src/main.cpp $(PCM_MODULES) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLS)))
	$(CXX) $(CXXFLAGS) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLS))) -o executables/$@ $< $(PCM_MODULES)
all:  main
clean:
	rm -f executables/main $(PCM_MODULES) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLS)))