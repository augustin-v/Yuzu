#[derive(Drop, Serde)]
pub struct UserAccountData {
    total_collateral_value: u256,
    total_debt_value: u256,
    current_ltv: u256,
    liquidation_threshold: u256,
    health_factor: u256,
}

#[derive(Drop, Serde)]
pub struct AssetData {
    base_ltv: u256,
    curret_dynamic_ltv: u256,
    liquidation_threshold: u256,
    liquidation_bonus: u256,
    reserve_factor: u256,
    total_supplied: u256,
    total_borrowed: u256,
    supply_apy: u256,
    borrow_apy: u256,
    recent_volatility: u256,
}