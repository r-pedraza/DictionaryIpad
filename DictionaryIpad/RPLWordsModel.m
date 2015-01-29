//
//  RPLWordsModel.m
//  DictionaryIpad
//
//  Created by Raul Pedraza on 29/1/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLWordsModel.h"

@implementation RPLWordsModel


-(id)init{
    //si es distinto de nil
    if (self=[super init]) {
        //el fichero esta en el bundle principal
        NSURL *url=[[NSBundle mainBundle]URLForResource:@"Vocabwords"
                                          withExtension:@"txt"];
        
        //en mi propiedad dcitionary almacena elcontenido obtenido mediante una url
        self.wordsDictionary=[NSDictionary dictionaryWithContentsOfURL:url];
    }
    
    return self;
}


//Va a devolver un array con las letras que corresponden a las claves del diccionario.
-(NSArray*)letters{


    return [[self.wordsDictionary allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

//devolvemos un array con las palabras que corresponden a una determinada seccion
-(NSArray*)wordsAtIndex:(NSInteger)index{
    NSString *letter=[[self letters]objectAtIndex:index];
    
    //de todas las letras dame la clave de letter ordenadas sin importar mayusculas y minusculas
    return [[self.wordsDictionary objectForKey:letter]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

}

//Recivimos el indice de la seccion como un entero, por que me la voy a recivir como un entero
-(NSString*)wordAtIndex:(NSInteger)aWordIndex
        inLetterAtIndex:(NSInteger)aLetterIndex{
    //Consigo palabras
    NSString *letter=[[self letters]objectAtIndex:aLetterIndex];
    //De mi modelo dame la letra asociada a la clave que acabo de conseguir.
    NSArray *wordsThatStarWithLetter=[self.wordsDictionary objectForKey:letter];
    
    return [wordsThatStarWithLetter objectAtIndex:aWordIndex];
}


@end
