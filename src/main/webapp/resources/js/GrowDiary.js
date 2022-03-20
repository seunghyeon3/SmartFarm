//블록체인 연결
console.log('starting...');

if (typeof web3 !== 'undefined') {
        // Mist/MetaMask의 프로바이더 사용
        web3 = new Web3(window.web3.currentProvider);
        //alert('web3가 연결되었습니다.');
    } else {
        // 사용자가 Metamask를 설치하지 않은 경우에 대해 처리
        // 사용자들에게 Metamask를 설치하라는 등의 메세지를 보여줄 것
        web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));
}

if (web3)
	console.log('connected');
else
	console.log('not connected');

//첫번째 계정 조회
let account ;

// 여기에 우리가 만든 컨트랙트에 접근하는 방법을 제시한다:
/* abi generated by the compiler */
var abi = [
	{
		"constant": false,
		"inputs": [
			{
				"name": "nftNo",
				"type": "uint256"
			},
			{
				"name": "newOwner",
				"type": "string"
			}
		],
		"name": "ownerUpdate",
		"outputs": [],
		"payable": false,
		"type": "function",
		"stateMutability": "nonpayable"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "nftNo",
				"type": "uint256"
			},
			{
				"name": "owner",
				"type": "string"
			}
		],
		"name": "createGrowDiaryNft",
		"outputs": [],
		"payable": false,
		"type": "function",
		"stateMutability": "nonpayable"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "nftNo",
				"type": "uint256"
			}
		],
		"name": "ownerSearch",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"type": "function",
		"stateMutability": "view"
	}
];

//var GrowDiaryContract = web3.eth.contract(abi)

var contractAddress = "0x4822D6b4e062e810fB467a595978e0f0f5CC3dd8"; /* our contract address on Ethereum after deploying */
var GrowDiary = new web3.eth.Contract(abi, contractAddress);//GrowDiaryContract.at(contractAddress)
// `GrowDiary`는 우리 컨트랙트의 public 함수와 이벤트에 접근할 수 있다.

