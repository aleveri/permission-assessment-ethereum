FROM ethereum/client-go:stable

CMD ["bootnode", "-nodekeyhex", "<your-node-key>", "-verbosity", "3"]