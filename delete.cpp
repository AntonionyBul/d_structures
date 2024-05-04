#include <fstream>
#include <vector>
#include <chrono>
#include <algorithm>
#include <deque>
#include "testlib.h"

int main(){
	setName("abracadabra");
	std::ofstream fcout("deque_output_sort.txt");
	for(int n = 1'000'000; n <= 10'000'000; n += 1'000'000){
		std::deque<int> vec(n);
		for(int i = n; i >= 1; i--){
			vec[n-i] = i;
		}
		shuffle(vec.begin(), vec.end());
		auto start = std::chrono::high_resolution_clock::now();
		std::sort(vec.begin(), vec.end());
		std::chrono::duration<double> time = std::chrono::high_resolution_clock::now() - start;
		fcout << n << " " << time.count() << std::endl;
	}
}