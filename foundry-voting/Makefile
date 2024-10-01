-include .env

NETWORK_ARGS := --rpc-url http://localhost:7545 --private-key $(GANACHE_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif

deploy:
	@forge script script/DeployVoting.s.sol:DeployVoting $(NETWORK_ARGS)
