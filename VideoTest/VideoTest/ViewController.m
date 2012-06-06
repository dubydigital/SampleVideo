//
//  ViewController.m
//  VideoTest
//
//  Created by Mark Dubouzet on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
// URL REFERENCE:
//http://mobile.tutsplus.com/tutorials/iphone/mediaplayer-framework_mpmovieplayercontroller_ios4/



#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad::");
    UIButton* playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [playButton setFrame:CGRectMake(10, 10, 200, 50)];
    [playButton addTarget:self action:@selector(playMovie:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
}

-(void)playMovie:(id)sender
{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Katy_Flash_Frame" ofType:@"mp4"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerController];
    
    [self.view addSubview:moviePlayerController.view];

    //moviePlayerController.fullscreen = YES;
    [moviePlayerController.view setFrame:CGRectMake(38, 100, 250, 163)];  
    
    [moviePlayerController play];
}


- (void)moviePlaybackComplete:(NSNotification *)notification
{
    NSLog(@"::: moviePlaybackComplete");
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
}







//---------

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
