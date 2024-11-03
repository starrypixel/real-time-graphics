APP_NAME = myApp
BUILD_DIR = ./bin

LIB_NAME:= engine
LIB_DEFINES:= -dynamiclib -fvisibility=hidden
LIB_INCLUDES:= -I./customLibrary/src -I/Users/thytran/VulkanSDK/1.3.296.0/macOS/include
LIB_LINKERS:= -L/Users/thytran/VulkanSDK/1.3.296/macOS/lib -lvulkan

LIB_C_FILES:= ./customLibrary/src/*.c

APP_DEFINES:= 
APP_INCLUDES:= -I./ClientApp/src -I./customLibrary/src
APP_LINKERS:= -L$(BUILD_DIR) -lengine

APP_C_FILES = ./ClientApp/src/*.c

all: buildLibrary buildClient run

buildLibrary:
	clang $(LIB_C_FILES) $(LIB_DEFINES) -o $(BUILD_DIR) -o $(BUILD_DIR)/libs$(LIB_NAME).dylib $(LIB_LINKERS) $(LIB_INCLUDES)

buildClient:
	clang $(APP_C_FILES) -o $(BUILD_DIR)/$(APP_NAME) $(APP_LINKERS) $(APP_INCLUDES)

run:
	$(BUILD_DIR)/$(APP_NAME)
