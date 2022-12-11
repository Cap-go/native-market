import { WebPlugin } from '@capacitor/core';

import type { NativeMarketPlugin } from './definitions';

export class NativeMarketWeb extends WebPlugin implements NativeMarketPlugin {
  openStoreListing(_options: { appId: string; country?: string }): Promise<void> {
    throw new Error('Method not implemented.');
  }

  openDevPage(_options: { devId: string }): Promise<void> {
    throw new Error('Method not implemented.');
  }

  openCollection(_options: { name: string }): Promise<void> {
    throw new Error('Method not implemented.');
  }

  openEditorChoicePage(_options: { editorChoice: string }): Promise<void> {
    throw new Error('Method not implemented.');
  }

  search(_options: { terms: string }): Promise<void> {
    throw new Error('Method not implemented.');
  }
}
