pragma solidity 0.4.24;

contract Auction {
    address currentLeader;
    uint highestBid;
    mapping(address => uint) allocated;

    function bid1() payable {
        require(msg.value > highestBid);
        // <yes> <report> SOLIDITY_DOS_WITH_REVERT 15ac23
        require(currentLeader.send(highestBid));
        currentLeader = msg.sender;
        highestBid = msg.value;
    }

    function bid2() payable {
        require(msg.value > highestBid);
        currentLeader.transfer(highestBid);
        currentLeader = msg.sender;
        highestBid = msg.value;
    }

    modifier only_token_holder() {
        // <yes> <report> SOLIDITY_DOS_WITH_REVERT 15ac23
        require(allocated[msg.sender] > 0 || allocated[msg.sender] > 0);
        _;
    }

    modifier only_token_holder2() {
        // <yes> <report> SOLIDITY_DOS_WITH_REVERT 15ac23
        assert(allocated[msg.sender] > 0 || allocated[msg.sender] > 0);
        _;
    }
}
