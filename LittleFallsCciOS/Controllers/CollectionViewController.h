//
//  CollectionViewController.h
//  REMenuExample
//
//  Created by Dustin Oosthuizen on 2014/10/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface CollectionViewController : UICollectionViewController
@interface CollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}
@end


