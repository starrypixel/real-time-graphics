#ifndef ENGINE_H
#define ENGINE_H

#ifdef __cplusplus
extern "C" {
#endif

#pragma once

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <vulkan/vulkan.h>

#define API __attribute__((visibility("default")))

API void initEngine();

API void shutdownEngine();

API void printSystemDetails();

#endif //ENGINE_H

#ifdef __cplusplus

}
#endif