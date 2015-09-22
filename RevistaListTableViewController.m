//
//  RevistaListTableViewController.m
//  XTODO001
//
//  Created by Juan Manuel Moreno on 26/07/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

#import "RevistaListTableViewController.h"
#import "RecycledSong.h"
#import "WriteBrandViewController.h"

@interface RevistaListTableViewController ()

@property NSMutableArray *songs;

@end

@implementation RevistaListTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    WriteBrandViewController *writer = [segue sourceViewController];
    RecycledSong *song = writer.song;
    if (song != nil) {
        
        [self.songs addObject:song];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Hola soy REVISTAd");

    self.songs = [[NSMutableArray alloc] init];
    
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    NSLog(@"la filas que tengo son %lu", (unsigned long)[self.songs count]);
    return [self.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...

    RecycledSong *song = [self.songs objectAtIndex:indexPath.row];
    cell.textLabel.text = song.name;

    if (song.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
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

- (void)loadInitialData {

    RecycledSong *song = [[RecycledSong alloc] init];
    song.name = @"Connecting Flight";
    [self.songs addObject:song];

    /*RecycledSong *songii = [[RecycledSong alloc] init];
    songii.name = @"Connecting Flight";
    [self.songs addObject:songii];*/

    song = [[RecycledSong alloc] init];
    song.name = @"Ya Soy Señorita";
    [self.songs addObject:song];
    
    //NSLog(@"loadInitialData la filas que tengo son %lu", (unsigned long)[self.songs count]);
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    RecycledSong *tappedSong = [self.songs objectAtIndex:indexPath.row];
    tappedSong.completed = !tappedSong.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    //NSLog(@"hice tap sobre una cancion");
}

@end
