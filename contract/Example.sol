// SPDX-License-Identifier: GPL -3.0
pragma solidity > 0.8.0;

contract Example{
    uint256 number;
    string name;

    struct TestStruct{
        uint number;
        string name;
        bool isStruct;
    }

    TestStruct public testStruct;
    mapping (uint256 => string) names; 

    constructor(){
        number = 1;
        name = "name";

        testStruct.number = 999;
        testStruct.name = "testStruct";
        testStruct.isStruct = true;
    }

    function addFacebook(uint256 _number, string memory _name) public{
        names[_number] = _name;
    }

    function getNameViaNumber(uint256 _number) public view returns (string memory){
        require(bytes(names[_number]).length > 0);

        return names[_number];
    }

    function getTestStruct() public view returns (TestStruct memory){
        return testStruct;
    }

    function getSender() public view returns (address){
        return msg.sender;
    }

    function getNumber() public view returns (uint256){
        return number;
    }

    function setName(string memory _name) public returns (bool){
        name = _name;

        return true;
    }

    function getName() public view returns (string memory){
        return name;
    }

    function setIsEven(uint256 _number) public pure returns (bool){ //pure는 데이터가 변화되지 않고 가스비가 적게 나옴
        if(_number % 2 <= 0){
            return true;
        }

        return false;
    }
}