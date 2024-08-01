FROM ethereum/client-go:stable

EXPOSE 8545 8546

CMD ["geth", "--rpc", "--rpcaddr", "0.0.0.0", "--rpcvhosts", "*", "--rpcapi", "web3,eth,net,personal"]