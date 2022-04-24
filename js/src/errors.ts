import { initCusper } from '@metaplex-foundation/cusper';
// @ts-ignore
import { errorFromCode } from './generated';

export const cusper = initCusper(errorFromCode);
