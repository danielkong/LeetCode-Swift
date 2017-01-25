iOS CollectionView

# What's new in iOS 10 CollectionView?

* Smoothly scrolling
* self-sizing
* Interactive re-ordering

# Life cycle of UICollectionViewCell

* prepareForReuse
* cellFOrItemAtIndexPath
* willDisplayCell
* didEndDisplayingCell

# New datasource -- prefetchDataSource in iOS 10
```
protocol UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView,
                        prefetchItemsAt indexPaths: [NSIndexPath])
    optional func collectionView(_ collectionView: UICollectionView,
                                 cancelPrefetchingForItemsAt indexPaths: [NSIndexPath])
}
class UICollectionView : UIScrollView {
    weak var prefetchDataSource: UICollectionViewDataSourcePrefetching?
    var isPrefetchingEnabled: Bool
}
```

1. In GCD or NSOperationQueue handle loading cell data.
2. Pre-fetching is self-adaptive. scroll slowly, it works. scroll too fast, do not execute pre-fetching api.
3. If user slow scroll, or even reverse scroll/clicking action. call cancelPrefetchingAPI
4. BTW, also could use in tableView. **UITableViewDataSourcePrefetching** 

# self-sizing improvement. _First intro in iOS 8_

1. UICollectionViewFlowLayout already support `self-sizing`. Use `estimatedItemSize` to trigger dynamic calculation layout. 
    ```
    layout.estimatedItemSize = CGSize(width:50,height:50)
    ```
    * autolayout
    * override func sizeThatFits()
    * preferredlayoutAttributesFittingAttributes()

2. In iOS 10, we could use `layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize`. 
    ![alt text][selfsizing_iOS9]
    ![alt text][selfsizing_iOS10]
[selfsizing_iOS9]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/notificationQueue.png
[selfsizing_iOS10]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/notificationQueue.png

