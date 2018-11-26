CREATE TABLE [dbo].[tbl_StudentDetails](
	[Entryid] [int] IDENTITY(1,1) NOT NULL,
	[Fathersname] [nvarchar](200) NOT NULL,
	[mothersname] [nvarchar](200) NULL,
	[phonenumber] [nvarchar](100) NULL,
	[Studentid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Entryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Students]    Script Date: 30-10-2018 12:26:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Students](
	[Studentid] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](200) NOT NULL,
	[Lastname] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_Students] PRIMARY KEY CLUSTERED 
(
	[Studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_StudentDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_StudentDetails_tbl_Students] FOREIGN KEY([Studentid])
REFERENCES [dbo].[tbl_Students] ([Studentid])
GO
ALTER TABLE [dbo].[tbl_StudentDetails] CHECK CONSTRAINT [FK_tbl_StudentDetails_tbl_Students]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Getstudentname is the name of the stored procedure*/

Create  PROCEDURE [dbo].[Getstudentname](

@studentid INT                   --Input parameter ,  Studentid of the student 

)
AS
BEGIN
SELECT Firstname+' '+Lastname FROM tbl_Students WHERE studentid=@studentid 
END
GO
/****** Object:  StoredProcedure [dbo].[GetstudentnameInOutputVariable]    Script Date: 30-10-2018 12:26:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  PROCEDURE [dbo].[GetstudentnameInOutputVariable]
(

@studentid INT,                       --Input parameter ,  Studentid of the student
@studentname VARCHAR(200)  OUT        -- Out parameter declared with the help of OUT keyword
)
AS
BEGIN
SELECT @studentname= Firstname+' '+Lastname FROM tbl_Students WHERE studentid=@studentid
END
GO
/****** Object:  StoredProcedure [dbo].[GetstudentswithJoinsInOutputVariable]    Script Date: 30-10-2018 12:26:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create  PROCEDURE [dbo].[GetstudentswithJoinsInOutputVariable]
(

@studentid INT                      --Input parameter ,  Studentid of the student
     
)
AS
BEGIN
SELECT  tbl_Students.Studentid,tbl_StudentDetails.Fathersname,tbl_Students.Firstname
  FROM tbl_Students join   tbl_StudentDetails  on tbl_Students.Studentid =@studentid
END
GO
/****** Object:  StoredProcedure [dbo].[InsertStudentrecord]    Script Date: 30-10-2018 12:26:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertStudentrecord]
(
 @StudentFirstName Varchar(200),
 @StudentLastName  Varchar(200),
 @StudentEmail     Varchar(50)
) 
As
 Begin
   Insert into tbl_Students (Firstname, lastname, Email)
   Values(@StudentFirstName, @StudentLastName,@StudentEmail)
 End
GO

Insert into tbl_Students (Firstname, lastname, Email)
 Values('Pankaj', 'Kumar', 'pankaj@abc.com')

Insert into tbl_Students (Firstname, lastname, Email)
 Values('Amit', 'Singh', 'amit@abc.com')

Insert into tbl_Students (Firstname, lastname, Email)
 Values('Manish', 'Kumar', 'manish@abc.comm')

Insert into tbl_Students (Firstname, lastname, Email)
 Values('Abhishek', 'Singh', 'abhishek@abc.com')




 Insert into tbl_StudentDetails (Fathersname, mothersname, phonenumber,Studentid)
 Values('Pankaj', 'Kumar', 'pankaj@abc.com',1)

 Insert into tbl_StudentDetails (Fathersname, mothersname, phonenumber,Studentid)
 Values('Pankaj', 'Kumar', 'pankaj@abc.com',2)

 Insert into tbl_StudentDetails (Fathersname, mothersname, phonenumber,Studentid)
 Values('Pankaj', 'Kumar', 'pankaj@abc.com',3)

 Insert into tbl_StudentDetails (Fathersname, mothersname, phonenumber,Studentid)
 Values('Pankaj', 'Kumar', 'pankaj@abc.com',4)



 CREATE TABLE [dbo].[tbl_test](
	[testid] [int] IDENTITY(1,1) NOT NULL,
	[Fathersname] [nvarchar](200) NOT NULL,
	[mothersname] [nvarchar](200) NULL,
	[phonenumber] [nvarchar](100) NULL,
	[Studentid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO