CREATE PROCEDURE [dbo].[sp_RoomTypes_GetAviableTypes]
	@startDate DATE,
	@endDate DATE
AS

BEGIN

	SELECT [t].[Id], [t].[Title], [t].[Description], [t].[Price]
	FROM RoomTypes t
	JOIN Rooms R ON r.RoomTypeID = t.id
	WHERE r.id NOT IN(
 SELECT b.RoomId
 FROM Bookings b
 WHERE (@startDate < b.StartDate AND @endDate > b.EndDate)
 OR (endDate >= b.StartDate AND @endDate < b.EndDate)
 OR (@startDate >= b.StartDate AND startDate > b.EndDate)
 )
END
RETURN 0
