// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4; 
contract DappMaster {
    struct Request{
        bytes data ;
        function (uint) external callback;
    }
    Request[] private requests;
    event NewRequest(uint);
    function collectRequest( bytes memory _data , function(uint) external callback) public{
        requests.push(Request(_data, callback));
        emit NewRequest(requests.length);
    }
    function setRequestNumber(uint _requestInedex) public {
        require(_requestInedex< requests.length,"No request finded under this index");
        requests[_requestInedex].callback(_requestInedex);
    }
    function getLengthOfRequest() public view returns(uint){
        return requests.length;
    }
}
contract DappMasterUser{
    uint public requestNumber ;
    DappMaster dappmasterUser;
    constructor(address _dappmasterAddress){
        dappmasterUser=DappMaster(address(_dappmasterAddress));
    }
    function sendRequest() public{
        dappmasterUser.collectRequest("Alamin",this.requestNumberSetter);
    }
    function requestNumberSetter(uint _number) public{
        require(msg.sender==address(dappmasterUser));
        requestNumber=_number;
    }
}