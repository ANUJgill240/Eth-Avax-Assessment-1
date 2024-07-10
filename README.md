# School Grading Project

## Description :
The provided Solidity code defines a contract named MyContract that demonstrates the usage of three error handling mechanisms: require, assert, and revert statement.

## Getting Started
- Run on Remix IDE: Use Remix for online execution.
- Create a new Solidity file: Click "+" in the left sidebar, save as .sol (e.g., MyToken.sol).
- Paste the code: Copy and paste your Solidity code into the file.

---solidity



    // SPDX-License-Identifier: MIT
    
    pragma solidity ^0.8.20;


    contract SchoolGrades{
        enum Grade{A,B,F} //to define enum type"Grade"
    
    // Function to assign a grade to a student

    function gradeRequire(uint score)public pure returns(Grade) {
        require(score <=50,"Score cannot be greater than 50");
            
        Grade grade;
        if(score>=40){
            grade=Grade.A;
        }
        else if(score>=30){
            grade=Grade.B;
        }
        else {
            grade=Grade.F;
        }
           return grade; // return the grade here after setting it
    }

     // Assert that a valid grade was assigned (should never fail)

    function gradeAssert( uint score) public pure returns(Grade){
            require(score <= 50,"Score cannot be greater than 50");
             Grade grade;
         if (score >= 40) {
            grade = Grade.A;
        } else if (score >= 30) {
            grade = Grade.B;
        } else {
            grade = Grade.F;
        }

         // Assert the correctness of the grade assignment
        assert((grade == Grade.A && score >= 40) || // A requires 40+
               (grade == Grade.B && score >= 30 && score < 40) || // B requires 30-39
               (grade == Grade.F && score < 30)); // F for less than 30

        return grade;
    }
           
    function gradeRevert(uint score)public pure  returns(Grade) {
        if(score > 50) {
            revert("Score cannot be greater than 50");
        }

        Grade grade;
        if (score >= 40) {
            grade = Grade.A;
        } else if (score >= 30) {
            grade = Grade.B;
        } else {
            grade = Grade.F;
        }
        return grade;
    }
    }

- Firstly the contract defines an enum type named Grade with three possible values: A, B, and F. This enum represents the different grades a student can receive.

- For the first error handling gradeRequire() : -this function takes a student's score as an argument (uint representing an unsigned integer). -it uses the require statement to ensure the score is less than or equal to 50. If not, it throws an error message ("Score cannot be greater than 50") and prevents further execution of the function. -the function then assigns a grade based on score ranges: -grade.A for scores >= 40 -grade.B for scores >= 30 and below 40 -grade.F for scores below 30 -finally, it returns the assigned grade.

- For the gradeAssert(): -it has the same require() statement and grade assignment logic as gradeRequire(). However, after assigning the grade, it uses the assert() statement to verify the correctness of the assignment. The assertion checks if the assigned grade matches the score range (e.g., A for scores >= 40). -if the assertion fails, the transaction will revert, but unlike require(), it won't provide any specific error message. -finally, it returns the assigned grade.

- Lastly revert()statement: -similar to testrequire, this function takes an student's score as an argument. -it uses an if statement to check if the score is greater than 50. -if the condition is true, it throws a revert() statement with a custom error message ("Score cannot be greater than 50"). -this stops the function execution and reverts the entire transaction state, similar to require(). However, revert() provides a more informative error message to the user.

## Help
If you encounter any issues, ensure the following:

The Solidity compiler version is set correctly.
The address used in function calls is valid.
The balance of the address is sufficient for burning tokens. For additional help, use the Remix documentation or community forums.
## Author
Anuj

anujgill240@gmail.com

## License
This project is licensed under the MIT License.

