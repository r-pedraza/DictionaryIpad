//
//  RPLDefinitionViewController.m
//  DictionaryIpad
//
//  Created by Raul Pedraza on 29/1/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLDefinitionViewController.h"

@interface RPLDefinitionViewController ()

@end

@implementation RPLDefinitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - View delegate
-(void)wordsTableViewController: (RPLWordsTableViewController*)sender
                 didClickOnWord:(NSString*)aWord{

    self.myWord=aWord;
    self.myWordLabel.text=self.myWord;
    //titulo de la ventana será lo mismo que cuando coja la palabra.
    self.title=self.myWord;


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.myWordLabel.text=self.myWord;

}

# pragma mark - UiSPlitViewController



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
