iOS CollectionView

# What's new in iOS 10 CollectionView?

* [Smoothly scrolling](#life-cycle-of-uicollectionviewcell)
* [self-sizing](#self-sizing-improvement)
* [Interactive reordering](# Interactive-Reordering)

## Life cycle of UICollectionViewCell

* prepareForReuse
* cellFOrItemAtIndexPath
* willDisplayCell
* didEndDisplayingCell

iOS 9 life cycle of cell: 
![alt text][Life_Cycle_CollectionView_Cell_iOS9_p]
![alt text][Life_Cycle_CollectionView_Cell_iOS9_c]
![alt text][Life_Cycle_CollectionView_Cell_iOS9_w]
![alt text][Life_Cycle_CollectionView_Cell_iOS9_e]

iOS 10 life cycle of cell: 
![alt text][Life_Cycle_CollectionView_Cell_iOS10_p]
![alt text][Life_Cycle_CollectionView_Cell_iOS10_c]
![alt text][Life_Cycle_CollectionView_Cell_iOS10_w]
![alt text][Life_Cycle_CollectionView_Cell_iOS10_e]
[Life_Cycle_CollectionView_Cell_iOS9_p]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS9_p.png
[Life_Cycle_CollectionView_Cell_iOS9_c]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS9_c.png
[Life_Cycle_CollectionView_Cell_iOS9_w]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS9_w.png
[Life_Cycle_CollectionView_Cell_iOS9_e]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS9_e.png
[Life_Cycle_CollectionView_Cell_iOS10_p]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS10_p.png
[Life_Cycle_CollectionView_Cell_iOS10_c]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS10_c.png
[Life_Cycle_CollectionView_Cell_iOS10_w]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS10_w.png
[Life_Cycle_CollectionView_Cell_iOS10_e]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/Life_Cycle_CollectionView_Cell_iOS10_e.png

## New datasource -- prefetchDataSource in iOS 10
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

## Self-sizing improvement
_First intro in iOS 8_

1. UICollectionViewFlowLayout already support `self-sizing`. Use `estimatedItemSize` to trigger dynamic calculation layout. 
    ```
    layout.estimatedItemSize = CGSize(width:50,height:50)
    ```
    * autolayout
    * override func sizeThatFits()
    * preferredlayoutAttributesFittingAttributes()

2. In iOS 10, we could use `layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize`. 

    iOS 9 selfsizing: 
    ![alt text][selfsizing_iOS9]

    iOS 10 selfsizing: 
    ![alt text][selfsizing_iOS10]
[selfsizing_iOS9]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/selfsizing_iOS9.gif
[selfsizing_iOS10]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/selfsizing_iOS10.gif

## Interactive Reordering

1. In iOS 9, introducing interactive reordering. In iOS 10, enhanced.
    * iOS 9, we need call following method:
    
    ```
    class UICollectionView : UIScrollView {
        func beginInteractiveMovementForItem(at indexPath: NSIndexPath) -> Bool
        func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint)
        func endInteractiveMovement()
        func cancelInteractiveMovement()
    }
    ```

    * iOS 10, we have `installsStandardGestureForInteractiveMovement` and it will call above func automatically. And one more thing is `collectionView.isPagingEnabled = true`.
    
    ```
    class UICollectionViewController : UIViewController {
        var installsStandardGestureForInteractiveMovement: Bool
    }
    ```

    iOS 9 Interactive reordering: 
    ![alt text][interactive_reordering]

    iOS 10 pageing enable as false:
    ![alt text][collectionView_isPagingEnableFalse]

    iOS 10 pageing enable as true: 
    ![alt text][collectionView_isPagingEnabledTrue]
[interactive_reordering]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/interactive_reordering.gif
[collectionView_isPagingEnableFalse]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/collectionView_isPagingEnableFalse.gif
[collectionView_isPagingEnabledTrue]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/CollectionViewAttachment/collectionView_isPagingEnabledTrue.gif

## UIRefreshControl

1. Consider as CollectionView attribute now, do not in UICollectionViewController any more. 
```
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refreshControlDidFire(_:)),
                             for: .valueChanged)
    collectionView.refreshControl = refreshControl
```


