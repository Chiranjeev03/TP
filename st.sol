// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student3{
    struct Student{
        uint rollNo;
        string name;
    }

    Student[] public students;
    mapping(uint => Student) students2;

    function addStudent(uint rollNo, string memory name) public {
        students.push(Student(rollNo, name));
        students2[rollNo] = Student(rollNo, name);
    }

    function getStudent(uint _rollNo) public view returns (uint rollNo, string memory name){
        return (students2[_rollNo].rollNo, students2[_rollNo].name);

    }

    function getStudent2() public view returns (uint rollNo, string memory name){

        for(uint i = 0; i < students.length; i++){
            if(students[i].rollNo == rollNo){
                return (students[i].rollNo, students[i].name);
            }
        }

        revert("Student not found");
        

    }



}
