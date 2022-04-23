use borsh::{BorshDeserialize, BorshSerialize};
use shank::ShankInstruction;

#[repr(C)]
#[derive(BorshSerialize, BorshDeserialize, PartialEq, Debug, Clone)]
pub struct InstructionThingArgs {
    value: u64,
}

#[derive(Debug, Clone, ShankInstruction, BorshSerialize, BorshDeserialize)]
#[rustfmt::skip]
pub enum InstructionThingy {
    /// Description of this instruction
    #[account(0, writable, name="writable_account", desc="writable account description")]
    #[account(1, name="non_writable_account", desc = "non-writable account description")]
    #[account(2, name="token_program", desc = "Token program")]
    #[account(3, name="rent", desc = "Rent sysvar")]
    InstructionThing(InstructionThingArgs),
}
