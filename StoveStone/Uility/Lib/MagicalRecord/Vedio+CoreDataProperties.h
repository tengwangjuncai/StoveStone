//
//  Vedio+CoreDataProperties.h
//  2-MagicRecord
//
//  Created by qianfeng on 16/3/3.
//  Copyright © 2016年 Jane. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Vedio.h"

NS_ASSUME_NONNULL_BEGIN

@interface Vedio (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *iconUrl;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *type;

@end

NS_ASSUME_NONNULL_END
