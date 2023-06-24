CXX := clang++
CXXFLAGS := -std=c++20 \
            -stdlib=libc++ \
            -fexperimental-library \
            -fmodules \
            -fprebuilt-implicit-modules \
            -fprebuilt-module-path=./build


BUILD_DIR := build
EXECUTABLE := executables/main


MODULES_INTERFACES_DIR := src/modules/interfaces
MODULES_IMPLS_DIR := src/modules/implements

MODULE_INTERFACES := MK.Welcome MK.Math MK.School
MODULES_IMPLS := MK.Math-impl MK.School-impl
MAIN_SOURCE := src/main.cpp

# ASSUMPTION: all compiled interfaces  will end with pcm extension
PCM_MODULES := $(addsuffix .pcm, $(addprefix $(BUILD_DIR)/, $(MODULE_INTERFACES)))

# compile module interfaces as pcm files
$(BUILD_DIR)/%.pcm: $(MODULES_INTERFACES_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -x c++-module $< --precompile -o $@

# compile module implementations as Object files
$(BUILD_DIR)/%.o: $(MODULES_IMPLS_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@
OBJECT_FILES := $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLS)))

 
# build the main executable
$(EXECUTABLE): $(MAIN_SOURCE) $(PCM_MODULES) $(OBJECT_FILES)
	$(CXX) $(CXXFLAGS) $^ -o $@

all:  $(EXECUTABLE)
clean:
	rm -f $(EXECUTABLE) $(PCM_MODULES) $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(MODULES_IMPLS)))

.PHONY: all clean
