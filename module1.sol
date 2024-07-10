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
