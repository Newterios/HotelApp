CREATE PROCEDURE [dbo].[sp_Guest_AddGuest]
	@firstName nvarchar(50),
	@lastname nvarchar(50)
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS(SELECT 1 FROM Guests WHERE LastName = @lastname and FirstName =@firstName)
	BEGIN
	INSERT INTO Guests(FirstName,LastName)
	VALUES (@firstName,@lastname)
	END
	SELECT TOP 1 Id,FirstName,LastName
	From Guests
	WHERE LastName = @lastname AND 
	FirstName = @firstName
END