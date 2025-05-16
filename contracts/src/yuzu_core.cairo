#[starknet::contract]
mod YuzuCore {
    use starknet::ContractAddress;
    use starknet::storage::{Map, StoragePointerReadAccess, StoragePointerWriteAccess};

    #[derive(Drop, Serde, starknet::Store)]
    struct UserPosition {
        deposited_amount: u256,
        borrowed_amount: u256,
        last_updated_timestamp: u256,
    }

    #[derive(Drop, Serde, starknet::Store)]
    struct AssetConfig {
        // base config
        base_ltv: u256,
        volatility_multiplayer: u256,
        market_risk_factor: u256,
        liquidation_threshold: u256,
        liquidation_bonus: u256,
        reserve_factor: u256,
        
        // dynamic/current state
        current_ltv: u256,
        recent_volatility: u256,
        total_supplied: u256,
        total_borrowed: u256,
        supply_apy: u256,
        borrow_apy: u256,

        // asset props
        decimals: u8,
        oracle_address: ContractAddress,
        enabled: bool
    }

    #[storage]
    struct Storage {
        admin: ContractAddress,
        treasury: ContractAddress,
        protocol_fee: u256,
        oracle_adaptater: ContractAddress,

        supported_assets: Map<ContractAddress, bool>,
        asset_configs: Map<ContractAddress, AssetConfig>,
        user_positions: Map<(ContractAddress, ContractAddress), UserPosition>, // (user, asset) -> position
        price_observations: Map<(ContractAddress, u64), u256>, // (asset, timestamp) -> price
        last_observation_index: Map<ContractAddress, u64>
    }

    #[constructor]
    fn constructor(
        ref self: ContractState,
        admin: ContractAddress,
        treasury: ContractAddress,
        oracle_adaptater: ContractAddress
    ) {
        self.admin.write(admin);
        self.treasury.write(treasury);
        self.protocol_fee.write(10); // 0.1%  fee
    }
}