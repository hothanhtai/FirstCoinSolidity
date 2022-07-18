pragma solidity >=0.7.0 <0.9.0;
contract Firstcoin {
    address public minter;
    mapping (address => uint) public balances;

    event sent(address from , address to, uint amount);

    constructor(){
        minter = msg.sender;
    }
    //Khoi tao so coin
    function mint(address receiver, uint amount)public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    //Chuyen tien
    function send(address receiver, address minter,uint amount) public {
        require(amount <= balances[minter], "Tai khoan khong du de thuc hien giao dich,Vui long nap them tien!");
        balances[minter] -= amount;
        balances[receiver] += amount;
        emit sent(minter , receiver , amount);
    }
}