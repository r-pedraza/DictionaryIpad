//
//  RPLWordsTableViewController.h
//  DictionaryIpad
//
//  Created by Raul Pedraza on 29/1/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RPLWordsModel;
@class RPLWordsTableViewController;

@protocol wordsTableViewControllerdelegate <NSObject>

//la tabla en la que estoy recibe como parámetro la misma tabla en la que estoy
//recivo una puslacion y te la hago llegar, te mando la palabra en la que han pulsado, me encargo de buscarla y se la mando al delegado ya buscada.
-(void)wordsTableViewController: (RPLWordsTableViewController*)sender
                 didClickOnWord:(NSString*)aWord;

@end

@interface RPLWordsTableViewController : UITableViewController

@property(strong,nonatomic)RPLWordsModel *wordsModel;
//propiedad que tiene que entender el protocolo que va a tener que ejecutar.
@property(weak,nonatomic)id <wordsTableViewControllerdelegate> delegate;


@end
