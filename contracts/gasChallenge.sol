// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10];
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
      // ** Gas optimisation technique 2: Caching of State Variable** 
      uint len = numbers.length; 
      // **Gas optimisation technique 3: Different For Loop Increment Syntax**
      // ++i costs less gas compared to i++ or i += 1 for an unsigned integer,
      // as pre-increment is cheaper (about 5 gas per iteration)
      for (uint i = 0; i < len;) {
        numbers[i] = 0;
        // **Gas optimisation technique 4: Unchecked Block** 
        // Technique to skip unnecessary checks
        // Use unchecked for arithmetic where we are sure 
        // it won't over or underflow, hence saving gas costs.
        unchecked { ++i; }
      }
    }
 }
