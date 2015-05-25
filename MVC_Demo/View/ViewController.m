//
//  ViewController.m
//  MVC_Demo
//
//  Created by Tops on 5/21/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"
#import "ShareDATA.h"
@interface ViewController() < UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *txtview;
@property (strong, nonatomic) IBOutlet UITableView *tblview;
@end

@implementation ViewController
NSMutableArray * response ;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dic =[[NSMutableDictionary alloc] init];
    response =[[NSMutableArray alloc] init];
    [dic setObject:@"10" forKey:@"user_id"];
    
    NSString *url= @"http://topsdemo.in/mit/parles/ws/chat/chat_user_details";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if ([[responseObject objectForKey:@"FLAG"] boolValue]) {
             NSLog(@"%@",responseObject);
             NSArray *arr =[responseObject objectForKey:@"chat"];
            
             
             //            NSDictionary *arrDic =(NSDictionary *) responseObject;
             //            ShareDATA *helpObj = [MTLJSONAdapter modelOfClass:ShareDATA.class fromJSONDictionary:arrDic error:nil];
             
             response = [MTLJSONAdapter modelsOfClass:ShareDATA.class fromJSONArray:arr error:nil];
              [self.tblview reloadData];
         }else{
             
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
     }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return response.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tblview dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell) {
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle   reuseIdentifier:@"myCell"];
    }
    ShareDATA *data = [response objectAtIndex:indexPath.row];
    cell.textLabel.text=data.strName;
    cell.detailTextLabel.text=data.strEmail;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
