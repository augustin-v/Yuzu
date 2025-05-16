use pragma_lib::abi::{IPragmaABIDispatcher, IPragmaABIDispatcherTrait};
use pragma_lib::types::{AggregationMode, DataType, PragmaPricesResponse};
use starknet::ContractAddress;

const KEY: felt252 = '6287680677296296772';

pub fn get_asset_price_median(oracle_address: ContractAddress, asset: DataType) -> u128 {
    let oracle_dispatcher = IPragmaABIDispatcher { contract_address: oracle_address };
    let output: PragmaPricesResponse = oracle_dispatcher.get_data(asset, AggregationMode::Median(()));
    output.price
}