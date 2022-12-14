# brief: detects system's core count for ideal compilation
# in variables: None
# out variables:
#     CORE_COUNT - CACHED  the amount of cores to be used in the build process

if(NOT DEFINED CORE_COUNT)
    include(ProcessorCount)
    # get core count
    ProcessorCount(CPU_CORES)

    # set the total cores as 1 less than the actual cores avaible
    if(CPU_CORES GREATER 1)
        math(EXPR N "${CPU_CORES} - 1" OUTPUT_FORMAT DECIMAL)
    else()
        # if geting the total cpu cores failes, default to 1
        set(N 1)
    endif()
    set(CORE_COUNT ${N} CACHE STRING "total cpu treads to use")
endif()
