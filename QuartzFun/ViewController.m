//
//  ViewController.m
//  QuartzFun
//
//  Created by Cusen on 15/8/20.
//  Copyright © 2015年 cusen. All rights reserved.
//

#import "ViewController.h"
#import "QuartzFunView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(UISegmentedControl *)sender {
    ColorTabIndex index = sender.selectedSegmentIndex;
    QuartzFunView *funView = (QuartzFunView *)self.view;
    switch (index)
    {
        case KRedColorTab:
            funView.currentColor = [UIColor redColor];
            funView.useRandomColor = NO;
            break;
        case KBlueColorTab:
            funView.currentColor = [UIColor blueColor];
            funView.useRandomColor = NO;
            break;
        case KYellowColorTab:
            funView.currentColor = [UIColor yellowColor];
            funView.useRandomColor = NO;
            break;
        case KGreenColorTab:
            funView.currentColor = [UIColor greenColor];
            funView.useRandomColor = NO;
            break;
        case KRandomColorTab:
            funView.useRandomColor = YES;
            break;
        default:
            break;
    }
}

- (IBAction)changeShape:(UISegmentedControl *)sender {
    ShapeType index = sender.selectedSegmentIndex;
    QuartzFunView *funView = (QuartzFunView *)self.view;
    funView.shapeType = index;
    if (index == KImageShape)
    {
        self.colorControl.enabled = NO;
        for (int i = 0; i < self.colorControl.numberOfSegments; i++)
        {
            [self.colorControl setEnabled:NO forSegmentAtIndex:i];
        }
    }
    else
    {
        self.colorControl.enabled = YES;
        for (int i = 0; i < self.colorControl.numberOfSegments; i++)
        {
            [self.colorControl setEnabled:YES forSegmentAtIndex:i];
        }
    }
}
@end
