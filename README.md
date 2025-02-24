# MxGA Token

A multi-chain token to track the success of all MxGA projects, powered by LayerZero Protocol.

## Overview

MxGA Token is an Omnichain Fungible Token (OFT) that can be transferred across multiple chains using LayerZero's cross-chain messaging protocol. The token is initially deployed on Sepolia and can be bridged to other supported networks.

## Supported Networks

- Sepolia (Main Contract)
- BitLayer Testnet (Trading Contract)
- Polygon (Coming Soon)
- Base (Coming Soon)
- Arbitrum (Coming Soon)

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Make](https://www.gnu.org/software/make/)
- Node.js & npm (for development tools)

## Setup Instructions

1. **Clone the Repository**:
```bash
git clone https://github.com/YOUR_USERNAME/MxGA-coin.git
cd MxGA-coin
```

2. **Environment Setup**: 
```bash
# Copy environment template
cp .env.dev .env

# Fill in required values in .env:
# - RPC URLs
# - Private Keys
# - API Keys
# - Contract Addresses (after deployment)
```

3. **Install Dependencies**:
```bash
make install
```

## Deployment

1. **Deploy Main Contract** (Sepolia):
```bash
make deploy-main-sepolia
```

2. **Deploy Trading Contract** (BitLayer Testnet):
```bash
make deploy-trading-bitlayer-testnet
```

3. **Configure LayerZero Settings**:
```bash
# Configure main contract on Sepolia
make set-config-main-sepolia

# Configure trading contract on BitLayer testnet
make set-config-trading-bitlayer-testnet
```

## Cross-Chain Operations

To bridge tokens between chains:
```bash
make bridge-token-from-sepolia-to-bitlayer-testnet
```

## Development

### Build
```bash
forge build
```

### Test
```bash
forge test
```

### Format Code
```bash
forge fmt
```

### Generate Gas Report
```bash
forge snapshot
```

## Contract Addresses

| Network | Contract Type | Address |
|---------|--------------|---------|
| Sepolia | Main         | TBA     |
| BitLayer Testnet | Trading | TBA |

## Security

- The contracts use OpenZeppelin's standard implementations
- LayerZero V2 Protocol for secure cross-chain messaging
- Basic security measures implemented in smart contracts

## License

MIT License - see [LICENSE](LICENSE) for details

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## Resources

- [LayerZero Documentation](https://layerzero.gitbook.io/docs/)
- [Foundry Book](https://book.getfoundry.sh/)
- [OpenZeppelin Docs](https://docs.openzeppelin.com/)
