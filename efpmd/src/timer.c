/*
 * Wall clock time for the timing printouts. The library is compiled as strict
 * C99, where the POSIX clock_gettime() is not declared unless requested, so
 * this file requests it before any header (and uses omp_get_wtime() with
 * OpenMP, QueryPerformanceCounter() on Windows).
 */

#if !defined(_OPENMP) && !defined(_WIN32) && !defined(_POSIX_C_SOURCE)
#define _POSIX_C_SOURCE 200809L
#endif

#if defined(_OPENMP)
#include <omp.h>
#elif defined(_WIN32)
#include <windows.h>
#else
#include <time.h>
#endif

double
efpmd_wall_time(void)
{
#if defined(_OPENMP)
	return omp_get_wtime();
#elif defined(_WIN32)
	LARGE_INTEGER freq, count;

	QueryPerformanceFrequency(&freq);
	QueryPerformanceCounter(&count);
	return (double)count.QuadPart / (double)freq.QuadPart;
#else
	struct timespec ts;

	clock_gettime(CLOCK_MONOTONIC, &ts);
	return (double)ts.tv_sec + 1.0e-9 * (double)ts.tv_nsec;
#endif
}
