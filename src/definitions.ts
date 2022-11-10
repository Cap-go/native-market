export interface NativeMarketPlugin {
  /**
   * This method will launch link in Play/App Store.
   *
   * @param {String} appId - ID of your application. Eg. com.example.app
   *
   * @returns void
   *
   * @since 1.0.0
   */
  openStoreListing(options: { appStoreId: number, playStoreId: string }): Promise<void>;
  /**
   * This method will deep-link directly to an Play/App store listing page.
   *
   * Only in Android.
   *
   * @param {String} devId - ID of developer. Eg. com.example.app
   *
   * @returns void
   *
   * @since 1.0.0
   */
  openDevPage(options: { devId: string }): Promise<void>;
  /**
   * This method will link users to a collection or top charts.
   * Only in Android.
   *
   * @param {String} name - name of the collection. Click [here](https://developer.android.com/distribute/marketing-tools/linking-to-google-play#OpeningCollection) for android options.
   *
   * @returns void
   *
   * @since 1.0.0
   */
  openCollection(options: { name: string }): Promise<void>;
  /**
   * This method will link users to Editor's choice page.
   *
   * Only in Android.
   *
   * @param {String} editorChoice - ID of your application. Eg. editorial_fitness_apps_us
   * @returns void
   *
   * @since 1.0.0
   */
  openEditorChoicePage(options: { editorChoice: string }): Promise<void>;
  /**
   * This method will link users to custom search query.
   *
   * Only in Android.
   *
   * @param {String} editorChoice - terms to be searched in Play/App store.
   * @returns void
   *
   * @since 1.0.0
   */
  search(options: { terms: string }): Promise<void>;
}
