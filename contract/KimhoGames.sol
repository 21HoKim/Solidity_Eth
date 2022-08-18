// SPDX-License-Identifier: GPL -3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Game is ERC20{
    address public owner;

        string RockScissorsPaperScore;
        string BaseBallScore;
        string racingScore;
    constructor() ERC20("GameCoin", "Alice"){ //생성자
        owner = msg.sender; //지갑계정 주소는 현재 함수

    }
    
    function transfer(address to, uint256 amount) public override returns (bool){
        _transfer(owner, to, amount);
        return true;
    }
    
    function mint(uint256 amount) public {
        _mint(owner, amount * 10 ** decimals());
    }    

    uint randNonce=0;
    function randMod() private returns(uint) //랜덤함수
    {
        randNonce++; 
        return uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)));
        
    }

    function RSP(uint input1, uint input2, uint input3) public returns (string memory){
        string memory Winmessage = "you win!!";
        string memory Defeatmessage = "you lose";
        uint count=0;
            if(RockScissorsPaper(input1)){
                count++;
            }
            if(RockScissorsPaper(input2)){
                count++;
            }
            if(RockScissorsPaper(input3)){
                count++;
            }
        if(count>1){
            RockScissorsPaperScore=Winmessage;
            return Winmessage;
        }
        else{
            RockScissorsPaperScore=Defeatmessage;
            return Defeatmessage;
        }
    }

    function RockScissorsPaper(uint users) private returns (bool){
        //0:rock 1:scissors 2:paper
        uint a = users%3; //user
        uint b = randMod()%3; //computer

        if(a==0){//users이 주먹 
            if(b==2 && b==0){
                return false;
            }
        }
        if(a==1){//users이 가위
            if(b==0 && b==1){
                return false;
            }
        }
        if(a==2){//users이 보 
            if(b==1 && b==2){
                return false;
            }
        }
        return true;
    }
    function getRockScissorsPaper() public view returns (string memory){
        return RockScissorsPaperScore;
    } 
}