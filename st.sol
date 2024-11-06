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



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {
    address public owner;
    uint256 private balance;

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balance += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public onlyOwner {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(amount <= balance, "Insufficient funds");
        balance -= amount;
        payable(owner).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
