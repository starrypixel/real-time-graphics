
#include "Engine.h"

void initEngine(){
    VkInstance instance;
    VkInstanceCreateInfo createInfo = {};

    const char* validationLayers[] = {
        "VK_LAYER_KHRONOS_validation"
    };

    VkResult result = vkCreateInstance(&createInfo, NULL, &instance);
    createInfo.enabledExtensionCount = 1;
    createInfo.ppEnabledLayerNames = validationLayers;
    if (result == VK_SUCCESS) {
        printf("Vulkan Instance created successfully!\n");
    } else {
        printf("Create info: %d \n", createInfo);
        printf("Failed to create Vulkan Instance: %d\n", result);
    }
}

void shutdownEngine(){
    printf("Engine shutting down...");
}

void printSystemDetails(){
    // Implementation of this function depends on the operating system and Vulkan SDK
    // For example, using Vulkan C++ wrapper libraries like vulkan-hpp or vulkan-loader can be used
    printf("..printing system details...\n");

}