//
//  RPLWordsTableViewController.m
//  DictionaryIpad
//
//  Created by Raul Pedraza on 29/1/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLWordsTableViewController.h"
#import "RPLWordsModel.h"
#import "RPLDefinitionViewController.h"

@interface RPLWordsTableViewController ()
@property(strong,nonatomic)RPLDefinitionViewController* definitionViewController;
@end

@implementation RPLWordsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Cargar modelo
    self.wordsModel=[[RPLWordsModel alloc]init];
    //localizamos el view controller que queremos
    self.definitionViewController=(RPLDefinitionViewController*)[[self.splitViewController.viewControllers lastObject]topViewController];
    self.delegate=self.definitionViewController;
    //forzamos que cuando cargue el progrma coja la primera programa
    NSString *word=[self.wordsModel wordAtIndex:0 inLetterAtIndex:0];
    [self.delegate wordsTableViewController:self didClickOnWord:word];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    //tantas secciones como letras
    return [[self.wordsModel letters]count];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.wordsModel wordsAtIndex:section]count];
}

//Cabecera de la seccion
-(NSString*)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{

    //Devuelveme las secciones que haya en el fichero que tiene mi modelo
    return [[self.wordsModel letters]objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:CellIdentifier];
    }
    //metodo de la clase modelo que devuelve el indice y la seccion
    cell.textLabel.text=[self.wordsModel  wordAtIndex:indexPath.row
                                      inLetterAtIndex:indexPath.section];
    
    return cell;
}


#pragma mark - Table delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



    NSString* selectWord=[self.wordsModel wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section];
    
    //Delegado, te mando palabra y secccion, me ando a mi mismo y te mando la palabra extraida.
    [self.delegate wordsTableViewController:self
                             didClickOnWord:selectWord];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
