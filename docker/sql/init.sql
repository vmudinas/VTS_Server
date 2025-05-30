-- Create the FAI database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'FAI')
BEGIN
    CREATE DATABASE [FAI]
END
GO

USE [FAI]
GO

-- Create tables if they don't exist (this is a simplified example; adjust according to your actual schema)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Users](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [Username] [nvarchar](50) NOT NULL,
        [PasswordHash] [nvarchar](255) NOT NULL,
        [Email] [nvarchar](100) NULL,
        [Role] [nvarchar](20) NOT NULL,
        [CreatedAt] [datetime2](7) NOT NULL,
        [LastLoginAt] [datetime2](7) NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
    )
END

-- Add more table creation scripts as needed

GO

-- Insert initial admin user if not exists
IF NOT EXISTS (SELECT * FROM [dbo].[Users] WHERE [Username] = 'admin')
BEGIN
    INSERT INTO [dbo].[Users] ([Username], [PasswordHash], [Email], [Role], [CreatedAt])
    VALUES ('admin', 'hashed_password_placeholder', 'admin@example.com', 'Admin', GETDATE())
END
GO