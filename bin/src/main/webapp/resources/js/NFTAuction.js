//블록체인 연결
console.log('starting...');

web3 = new Web3(new Web3.providers.HttpProvider('HTTP://127.0.0.1:8545')); // 메타마스크 연결

if (web3)
	console.log('connected');
else
	console.log('not connected');

//첫번째 계정 조회
let account;

web3.eth.getAccounts(function (err, accs){
	if(err != null){
		alert('There was an error fetching your accounts.')
		return
	}
	if(accs.length == 0){
		alert("Couldn't get any accounts!")
		return
	}
	account = accs[0];
})

// 여기에 우리가 만든 컨트랙트에 접근하는 방법을 제시한다:
/* abi generated by the compiler */
var abi = [
	{
		"constant": false,
		"inputs": [],
		"name": "bid",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "auctionEnd",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "beneficiary",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "withdraw",
		"outputs": [
			{
				"name": "",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "highestBidder",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_biddingTime",
				"type": "uint256"
			},
			{
				"name": "_beneficiary",
				"type": "address"
			}
		],
		"name": "NFTAuction",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "highestBid",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "bidder",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "HighestBidIncreased",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "winner",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "AuctionEnded",
		"type": "event"
	}
];

//var GrowDiaryContract = web3.eth.contract(abi)

var contractAddress = "0x9BcEeb6EF1D19842a5dB24b2A86CAF51EB34C256"; /* our contract address on Ethereum after deploying */

var NFTAuction = new web3.eth.Contract(abi, contractAddress);//GrowDiaryContract.at(contractAddress)
// `GrowDiary`는 우리 컨트랙트의 public 함수와 이벤트에 접근할 수 있다.

