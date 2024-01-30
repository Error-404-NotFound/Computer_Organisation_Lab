#include<iostream>
#include<vector>
#include<nmmintrin.h>
#include<chrono>
#include<random>

uint32_t function_x(uint32_t i) {
  i = i - (( i >> 1) & 0x5555555555555555 ) ;
  i = ( i & 0x3333333333333333 ) + (( i >> 2) & 0x3333333333333333 ) ;
  i = ( i + ( i >> 4) ) & 0x0f0f0f0f0f0f0f0f ;
  i = i + ( i >> 8) ;
  i = i + ( i >> 16) ;
  i = i + ( i >> 32) ;
  return ( uint32_t ) i ;
}

uint32_t hw_popcount(uint32_t i) {
  return _mm_popcnt_u32(i);
}

int main() {
  std::vector<uint32_t> numbers(100000);
  std::mt19937 rng;
  rng.seed(std::random_device()());
  std::uniform_int_distribution<uint32_t> dist;
  
  for ( auto & num : numbers ) {
    num = dist(rng);
  }
  
  auto start = std :: chrono :: high_resolution_clock::now();
  for ( uint32_t num : numbers ) {
    hw_popcount (num) ;
  }
  auto end = std :: chrono :: high_resolution_clock::now() ;
  std::chrono :: duration <double,std::micro> custom_duration = end - start;
  std::cout << "function_x : " << custom_duration.count() << " microseconds \n ";
  
  start = std :: chrono :: high_resolution_clock::now() ;
  for ( uint32_t num : numbers ) {
    hw_popcount (num) ;
  }
  end = std :: chrono :: high_resolution_clock::now() ;
  std::chrono::duration <double,std::micro> hw_duration = end - start ;
  std::cout << "Hardware popcount duration : " << hw_duration.count() << " microseconds \n";
  if(custom_duration.count()<hw_duration.count()) {
    std::cout << "function_x is faster" << std::endl;
  }
  else {
    std::cout << "hardware popcount is faster" << std::endl;
  }
  return 0;
}
