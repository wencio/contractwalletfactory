pragma solidity >=0.6.0 <0.9.0;

contract WalletFactory {
    address[] public wallets;

    function createWallet() public returns (address) {
        address newWallet = new Wallet();
        wallets.push(newWallet);
        return newWallet;
    }

    function getWallets() public view returns (address[] memory) {
        return wallets;
    }
}

contract Wallet {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount <= balance, "Not enough funds");
        msg.sender.transfer(amount);
        balance -= amount;
    }
}
