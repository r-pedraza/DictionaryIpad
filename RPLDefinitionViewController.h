//
//  RPLDefinitionViewController.h
//  DictionaryIpad
//
//  Created by Raul Pedraza on 29/1/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPLWordsTableViewController.h"
@interface RPLDefinitionViewController : UIViewController <wordsTableViewControllerdelegate>
@property (weak, nonatomic) IBOutlet UILabel *myWordLabel;
@property(copy,nonatomic)NSString* myWord;

@end
