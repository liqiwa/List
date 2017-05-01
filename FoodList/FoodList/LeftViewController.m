//
//  LeftViewController.m
//  
//
//  Created by 王琳琳 on 17/4/29.
//
//

#import "LeftViewController.h"
#import "ListGroupDao.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView *tabView;
@property (strong,nonatomic)ListGroup *listGp;

@end

@implementation LeftViewController
{
    NSArray *_array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"我是leftView");
    ListGroupDao *db = [[ListGroupDao alloc] init];
    [db open];
    _array = [[NSArray alloc] init];
    _array = [db selectData];
    NSLog(@"%ld",_array.count);
    [db close];
    [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    _tabView = [[UITableView alloc] init];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    _tabView.frame =self.view.bounds;
    [self.view addSubview:_tabView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case TableViewSectionListGroupSection:
            return 1;
            break;
        case TableViewSectionSettingSection:
            return 1;
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"tableviewcell"];
    }
    switch (indexPath.section) {
        case TableViewSectionListGroupSection:
            self.listGp =_array[indexPath.row];
            cell.textLabel.text = self.listGp.groupName;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",self.listGp.remainNumber];
            return cell;
            break;
         case TableViewSectionSettingSection:
            cell.textLabel.text = @"设置";
            return cell;
          
    }
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
