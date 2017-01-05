//
//  SHFCalendar.m
//  PickerView
//
//  Created by Jacky on 2016/12/16.
//  Copyright © 2016年 jacky. All rights reserved.
//

#import "JCalendar.h"

@interface JCalendar()<UIPickerViewDelegate,UIPickerViewDataSource>{
    CGRect totalFrame;
    NSMutableArray *yearArr;
    NSMutableArray *dayArr;
    NSMutableArray *monthArr;
    NSArray *hourArr;
    NSArray *minuteArr;
    int currentHour;
    int currentMinute;
    
    BOOL isChooseToday;
}
@property (nonatomic,strong) UIPickerView *pickerView;

@end

@implementation JCalendar
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        yearArr = [[NSMutableArray alloc]init];
        dayArr = [[NSMutableArray alloc]init];
        monthArr = [[NSMutableArray alloc]init];
        isChooseToday = YES;
        
        NSString *timeStampStrCurrent = [self SetTime:[self getCurrentAfterFiveMinute]];
        [timeStampStrCurrent substringToIndex:4];
        currentHour = [[timeStampStrCurrent substringFromIndex:8] substringToIndex:2].intValue;
        currentMinute = [timeStampStrCurrent substringFromIndex:10].intValue;
        
        for (int i =0 ; i<7; i++) {
            
            [yearArr addObject:[[self SetTime:[self getCurrentTimestamp:i]] substringToIndex:4]];
            [monthArr addObject:[[[self SetTime:[self getCurrentTimestamp:i]] substringFromIndex:4] substringToIndex:2]];
            [dayArr addObject:[[[self SetTime:[self getCurrentTimestamp:i]] substringFromIndex:6] substringToIndex:2]];
        }
        
        hourArr = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
        minuteArr = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",
                      @"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",
                      @"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",
                      @"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",
                      @"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",
                      @"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59"];
        
        
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self.pickerView selectRow:currentHour inComponent:1 animated:NO];
        [self.pickerView selectRow:currentMinute inComponent:2 animated:NO];
        
        //init data
        self.yearStr = yearArr[0];
        self.monthStr = monthArr[0];
        self.dayStr = dayArr[0];
        self.hourStr = hourArr[currentHour];
        self.minStr = minuteArr[currentMinute];
    }
    return self;
}

-(void)getCurrentTime{
    NSString *timeStampStrCurrent = [self SetTime:[self getCurrentTimestamp:0]];
    self.yearStr = yearArr[0];
    self.monthStr = monthArr[0];
    self.dayStr = dayArr[0];
    
    self.hourStr = [[timeStampStrCurrent substringFromIndex:8] substringToIndex:2];
    self.minStr = [timeStampStrCurrent substringFromIndex:10];
}

#pragma mark -picker view datasouce
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger numberOfRows = 0;
    switch (component) {
        case 0:
            numberOfRows = dayArr.count;
            break;
        case 1:
            numberOfRows = hourArr.count;
            break;
        case 2:
            numberOfRows = minuteArr.count;
            break;
    }
    return numberOfRows;
}

#pragma mark -picker view delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat width = 0.0;
    switch (component) {
        case 0:
            width = 140;
            break;
        case 1:
            width = 40;
            break;
        case 2:
            width = 40;
            break;
    }
    return width;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title = @"";
    switch (component) {
        case 0:
            title = [NSString stringWithFormat:@"%@月%@日",monthArr[row],dayArr[row]];
            break;
        case 1:
            title = hourArr[row];
            
            break;
        case 2:
            title = minuteArr[row];
            
            break;
    }
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:{
            self.yearStr = yearArr[row];
            self.monthStr = monthArr[row];
            self.dayStr = dayArr[row];
            if (row == 0) {
                isChooseToday = YES;
                [self.pickerView selectRow:currentHour inComponent:1 animated:YES];
                [self.pickerView selectRow:currentMinute inComponent:2 animated:YES];
                self.hourStr = hourArr[currentHour];
                self.minStr = minuteArr[currentMinute];
            }else{
                isChooseToday = NO;
            }
        }
            break;
        case 1:{
            self.hourStr = hourArr[row];
            if (isChooseToday) {
                if(row<currentHour){
                    [self.pickerView selectRow:currentHour inComponent:1 animated:YES];
                    self.hourStr = hourArr[currentHour];
                }
            }
        }
            break;
        default:{
            self.minStr = minuteArr[row];
            if (isChooseToday) {
                if (isChooseToday) {
                    if(row<currentHour){
                        [self.pickerView selectRow:currentMinute inComponent:2 animated:YES];
                        self.minStr = minuteArr[currentMinute];
                    }
                }
            }
        }
            break;
    }
}


#pragma mark -mark time help function
-(NSString*)SetTime:(NSString*)time{
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"yyyMMddHHmm"];
    
    int timeval = [time intValue];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeval];
    
    // NSLog(@"1296035591  = %@",confromTimesp);
    
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}
-(NSString *)getCurrentTimestamp:(int)index{
    //标准型
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970]+index*60*60*24;
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
    
}

-(NSString *)getCurrentAfterFiveMinute{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970]+60*5;
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
}



#pragma mark -lazy load
-(UIPickerView *)pickerView{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, totalFrame.size.width, totalFrame.size.height)];
        [self addSubview:_pickerView];
    }
    return _pickerView;
}


@end
