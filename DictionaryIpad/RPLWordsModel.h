//
//  RPLWordsModel.h
//  DictionaryIpad
//
//  Created by Raul Pedraza on 29/1/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPLWordsModel : NSObject


@property (strong,nonatomic)NSDictionary *wordsDictionary;

-(NSArray*)letters;
-(NSArray*)wordsAtIndex:(NSInteger)index;
-(NSString*)wordAtIndex:(NSInteger)aWordIndex
        inLetterAtIndex:(NSInteger)aLetterIndex;

@end
