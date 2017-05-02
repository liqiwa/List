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
    [self initData];
       [self createTableView];
    // Do any additional setup after loading the view.
}
- (void)initData{
    ListGroupDao *db = [[ListGroupDao alloc] init];
    [db open];
    _array = [[NSArray alloc] init];
    _array = [db selectData];
    NSLog(@"%ld",_array.count);
    [db close];

}
- (void)createTableView{
    _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-100, kScreenHeight)style:UITableViewStyleGrouped];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    [self.view addSubview:_tabView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case TableViewSectionListGroupSection:
            //返回_array数组的数量
            return 1;
        case TableViewSectionSettingSection:
            return 1;
        default:
            return 0;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"tableviewcell"];
    }
    switch (indexPath.section) {
        case TableViewSectionListGroupSection:
            self.listGp =_array[indexPath.row];
            cell.textLabel.text = self.listGp.groupName;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",self.listGp.remainNumber];
            return cell;
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
