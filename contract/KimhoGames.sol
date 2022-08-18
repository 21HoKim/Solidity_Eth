// SPDX-License-Identifier: GPL -3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Game is ERC20{
    address public owner;

        string RockScissorsPaperScore;
        string BaseBallScore;
        string racingScore;
        uint win;
    constructor() ERC20("GameCoin", "Alice"){ //생성자
        owner = msg.sender; //지갑계정 주소는 현재 함수

    }

    function gameEND()public returns (bool){
        string memory Winmessage = "you win!!";
        int score=0;
        if(keccak256(abi.encodePacked(block.timestamp,msg.sender,RockScissorsPaperScore)) == keccak256(abi.encodePacked(block.timestamp,msg.sender,Winmessage))){
            score++;
        }
        if(keccak256(abi.encodePacked(block.timestamp,msg.sender,BaseBallScore)) == keccak256(abi.encodePacked(block.timestamp,msg.sender,Winmessage))){
            score++;
        }
        if(keccak256(abi.encodePacked(block.timestamp,msg.sender,racingScore)) == keccak256(abi.encodePacked(block.timestamp,msg.sender,Winmessage))){
            score++;
        }

        if(score==0){
            _burn(owner, balanceOf(owner)/2);
        }
        if(score==1){
            _burn(owner, balanceOf(owner)/5);
        }
        if(score==2){
            _mint(owner, balanceOf(owner)*2);
        }



        return true;
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

    function RockPaperScissors(uint input1, uint input2, uint input3) public returns (string memory){
        string memory Winmessage = "you win!!";
        string memory Defeatmessage = "you lose";
        //0 : 가위, 1 : 바위, 2 : 보
        uint count=0; //승리 횟수
        uint u1=input1%3;
        uint u2=input2%3;
        uint u3=input3%3;
        uint rand=uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)))%3;
            if(u1==0){
                if(rand==1){ // 비겨도 진거임
                    count++;
                }
            }
            if(u1==1){
                if(rand==2){
                    count++;
                }
            }
            if(u1==2){
                if(rand==0){
                    count++;
                }
            }
            if(u1==0){
                if(rand==1){ // 비겨도 진거임
                    count++;
                }
            }
            if(u1==1){
                if(rand==2){
                    count++;
                }
            }
            if(u1==2){
                if(rand==0){
                    count++;
                }
            }
            //-----------------------------------------
            rand=uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)))%3;
            if(u2==0){
                if(rand==1){ // 비겨도 진거임
                    count++;
                }
            }
            if(u2==1){
                if(rand==2){
                    count++;
                }
            }
            if(u2==2){
                if(rand==0){
                    count++;
                }
            }
            //-----------------------------------------
            rand=uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)))%3;
            if(u3==0){
                if(rand==1){ // 비겨도 진거임
                    count++;
                }
            }
            if(u3==1){
                if(rand==2){
                    count++;
                }
            }
            if(u3==2){
                if(rand==0){
                    count++;
                }
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

    function getRockScissorsPaper() public view returns (string memory){
        return RockScissorsPaperScore;
    }


    function NumBaseBall(uint input) public returns (bool){
        string memory Winmessage = "you win!!";
        string memory Defeatmessage = "you lose";
        uint rand = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)))%100;
        uint u=input%100;
        if(rand>=u){
            BaseBallScore=Defeatmessage;
        }
        else{
            BaseBallScore=Winmessage;
        }
        return true;
    }
 
    function getNumBaseBallSore() public view returns (string memory){
        return BaseBallScore;
    }

    function race(uint input) public returns (bool){
        string memory Winmessage = "you win!!";
        string memory Defeatmessage = "you lose";
        uint rand = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)))%100;
        uint u=input%100;
        if(rand>=u){
            racingScore=Defeatmessage;
        }
        else{
            racingScore=Winmessage;
        }
        return true;
    }
    
    function getRaceScore() public view returns (string memory){
        return racingScore;
    }

}