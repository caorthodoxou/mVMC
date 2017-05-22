# for Intel Compiler
set(CMAKE_C_COMPILER "icc" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE "-O3 -DNDEBUG -xCORE-AVX2 -mcmodel=large -shared-intel -Wno-unknown-pragmas" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_DEBUG "-g -O0 -Wall  -Wformat -Werror=format-security")

set(CMAKE_Fortran_COMPILER "ifort" CACHE STRING "" FORCE)
set(CMAKE_Fortran_FLAGS "-O3 -DNDEBUG -xCORE-AVX2 -mcmodel=large -shared-intel" CACHE STRING "" FORCE)

if(USE_SCALAPACK)
  if(SCALAPACK_LIBRARY_DIR MATCHES "")
    set(SCALAPACK_LIBRARY_DIR "$ENV{MKLROOT}/lib/intel64")
  endif(SCALAPACK_LIBRARY_DIR MATCHES "")
  if(SCALAPACK_LIBRARIES MATCHES "")
    set(SCALAPACK_LIBRARIES "-lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_blacs_sgimpt_lp64")
  endif(SCALAPACK_LIBRARIES MATCHES "")

  message(STATUS "SCALAPACK_LIBRARY_DIR is ${SCALAPACK_LIBRARY_DIR}")
  message(STATUS "SCALAPACK_LIBRARIES is ${SCALAPACK_LIBRARIES}")
endif(USE_SCALAPACK)

# for Intel MKL
set(BLA_VENDOR "Intel10_64lp" CACHE STRING "" FORCE)
