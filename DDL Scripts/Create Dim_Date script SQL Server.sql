-- Create Dim_Date for SQL Serve
-- r sherman
-- 2022-11-07
---drop TABLE Dim_Date;

CREATE TABLE Dim_Date ( 
 
                 date_sk             int           not null primary key 
                ,date_nk         date          NOT NULL unique 
                ,datetime_value      datetime      NOT NULL unique

                ,QtrYear_SK          int not null
                ,QtrYear_Name        varchar(20) not null

                ,MonthYear_SK        int not null
                ,MonthYear_Name      varchar(20) not null

                ,Day_in_Month        int NOT NULL 
                ,Day_in_Year         int NOT NULL 
                ,Day_Count           int NOT NULL
                
                ,Day_Name            varchar(20) not null
                ,Day_Abr             char(3) not null
                
                ,Week_in_Year        int NOT NULL 
                ,Week_Count          int NOT NULL

                ,Month_ID            int NOT NULL 
                ,Month_Name          varchar(20) not null
                ,Month_Abr           char(3) not null
                ,Month_Count         int NOT NULL 

                ,First_Day_of_Month  date NOT NULL
                ,Last_Day_of_Month   date NOT NULL

                ,Qtr_ID              int NOT NULL
                ,Date_Year             int NOT NULL  
               ) 
;

declare @startDay      datetime, 
        @endDay        datetime,
        @CounterDay    int, 
        @currentDay    datetime,
        @CounterMonth  int,
        @CurrentMonth  int,
        @PreviousMonth int,
        @CounterWeek  int,
        @CurrentWeek  int,
        @PreviousWeek int
          

select @startDay = '1/1/2022', 
       @endDay = '12/31/2030',
       @CounterDay = 1,
       @currentDay = @startDay,
       @CounterMonth = 1,
       @CurrentMonth = datepart(month,@currentDay),
       @PreviousMonth = datepart(month,@currentDay),
       @CounterWeek = 1,
       @CurrentWeek  = datepart(week,@currentDay),
       @PreviousWeek = datepart(week,@currentDay)
             
--begin transaction 

while @currentDay <= @endDay 
begin 

  insert into Dim_Date
  (
     date_sk, 
     date_nk, 
     datetime_value, 

     QtrYear_SK,
     QtrYear_name,
  
     MonthYear_SK,
     MonthYear_Name,

     Day_in_Month, 
     Day_in_Year,
     Day_Count,
     
     Day_Name,
     Day_Abr,
     
     Week_in_Year ,
     Week_Count,

     Month_ID ,
     Month_Name,
     Month_Abr,
     Month_Count,

     First_Day_of_Month,
     Last_Day_of_Month,

     Qtr_ID ,
     Date_Year  
  ) 
select 
     (datepart(year, @currentDay)* 10000) 
        + (datepart(month,@currentDay)* 100) 
        + (datepart(day,@currentDay)),  -- date_sk
     @currentDay,   -- date_value
     @currentDay,   -- datetime_value

     ( (datepart(year, @currentDay)*100)+ ( (datepart(month,@currentDay) / 4 ) + 1 ) ),
     datename(year, @currentDay)+' Q'+cast((datepart(month,@currentDay) / 4) + 1 as char(1)),

     datepart(year, @currentDay)*100+datepart(month,@currentDay),
     datename(year, @currentDay)+' '+cast((datepart(month,@currentDay))as char(2) ),

     datepart(day,@currentDay) as Day_in_Month, 
     datepart(dayofyear,@currentDay) as Day_in_Year,
     @CounterDay, 
     
     datename(dw,@currentDay)   as Month_Name,
     cast (datename(dw,@currentDay) as CHAR(3))  as Month_Abr,
     
     datepart(week,@currentDay) as Week_in_Year,
     @CounterWeek,
     
     datepart(month,@currentDay)   as Month_ID, 
     datename(month,@currentDay)   as Month_Name,
     cast (datename(month,@currentDay) as CHAR(3))  as Month_Abr,
     @CounterMonth,

     CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@currentDay)-1),@currentDay),101) as First_Day_of_Month,
     CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@currentDay))),DATEADD(mm,1,@currentDay)),101) as Last_Day_of_Month,

     datepart(quarter ,@currentDay) as Qtr_ID, 
     datepart(year, @currentDay) as Date_Year

set @currentDay   = dateadd(day,1,@currentDay)
set @CounterDay   = @CounterDay + 1
set @CurrentMonth = datepart(month,@currentDay)
set @CurrentWeek  = datepart(week,@currentDay)

if @CurrentMonth <> @PreviousMonth
   begin 
       set @CounterMonth = @CounterMonth + 1
       set @PreviousMonth = @CurrentMonth
      -- print ' Add a month to count'
    end
    
if @CurrentWeek <> @PreviousWeek
   begin 
       set @CounterWeek = @CounterWeek + 1
       set @PreviousWeek = @CurrentWeek
      -- print ' Add a month to count'
    end
    
--end 

--go

set @currentDay = dateadd(day,1,@currentDay)
set @CounterDay = @CounterDay + 1
    
end 

;