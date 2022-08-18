// SPDX-License-Identifier: GPL -3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExampleToken is ERC20{ 
    address public owner; //주인의 지갑 계정 주소

    constructor() ERC20("BoBCoin", "BoB"){ //생성자
        owner = msg.sender; //지갑계정 주소는 현재 함수

        //_mint(owner,1 * 10 ** decimals());
    }

    function transfer(address to, uint256 amount) public override returns (bool){
        _transfer(owner, to, amount);

        return true;
    }

    function mint(uint256 amount) public {
        _mint(owner, amount * 10 ** decimals());
    }

    function balanceOf() public view returns (uint256){
        return balanceOf(owner);
    }

}
//approve : 승인하다
//decrease Allowance : 감소 수당
//increase Allowance : 수당을 늘리다
//transfer : 옮기다
//transferFrom : 이전에서
//allowance : 허용
//balanceOf [address] : 현재 금액
