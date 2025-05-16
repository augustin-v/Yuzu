use starknet::ContractAddress;
use contracts::libraries::types::{UserAccountData, AssetData};

#[starknet::interface]
pub trait IYuzuCore<TContractState> {
    fn deposit(ref self: TContractState, asset: ContractAddress, amount: u256, on_behalf_of: ContractAddress);
    fn withdraw(ref self: TContractState, asset: ContractAddress, amount: u256);
    fn borrow(ref self: TContractState, asset: ContractAddress, amount: u256);
    fn repay(ref self: TContractState, asset: ContractAddress, amount: u256, on_behalf_of: ContractAddress);
    fn get_user_account_data(self: @TContractState, user: ContractAddress) -> UserAccountData;
    fn get_asset_data(self: @TContractState, asset: ContractAddress) -> AssetData;
}