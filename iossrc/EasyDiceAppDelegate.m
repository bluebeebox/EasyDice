//
//  Easy_DiceAppDelegate.m
//  Easy Dice
//
//  Created by Slobodan Pejic on 11-10-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EasyDiceAppDelegate.h"
#import "Controls/SPDiceRoller.h"
#import "Controls/SPBannerContainer.h"
#import "Model/AppModel.h"

@implementation EasyDiceAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Override point for customization after application launch.
	UIScreen* screen = [UIScreen mainScreen];
	CGRect scBounds = screen.bounds;
	self.window = [[UIWindow alloc] initWithFrame: scBounds];
	[self.window setBackgroundColor: [UIColor blackColor]];
	UIImageView* background =[[UIImageView alloc] initWithImage:
			[UIImage imageNamed: @"assets/background.png"]];
	background.frame = scBounds;
	[self.window addSubview: background];
	[self.window makeKeyAndVisible];
	
	static const int MARGIN = 15;
	SPDiceRoller* diceView = [[SPDiceRoller alloc]
				  initWithFrame: scBounds];
	[diceView setDieDim: CGSizeMake(48, 48)];
	SPBannerContainer* bannerContainer = [[SPBannerContainer alloc] init];
	bannerContainer.view = self.window;
	[bannerContainer viewDidLoad];
	bannerContainer.marginTop = 20 + MARGIN;
	bannerContainer.marginLeft = MARGIN;
	bannerContainer.marginRight = MARGIN;
	bannerContainer.marginBottom = MARGIN;
	bannerContainer.childView = diceView;
	
	AppModel* model = [AppModel sharedAppModel];
	
	diceView.rollingDice = model.dice;
	diceView.availableDice = model.availableDice;
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

- (void)dealloc
{
	[_window release];
	[super dealloc];
}

@end
