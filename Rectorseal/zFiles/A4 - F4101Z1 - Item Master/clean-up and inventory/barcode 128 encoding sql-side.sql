-- The following TSQL code will take a character string and perform the encoding that is necessary to generate a BARCODE 128 formatted string to be used with a BARCODE 128 font.[CODE]declare @myString varchar(255)
-- select @myString = 'BarCode 1'
--  NOTE: It's much for efficient to do this someplace other than SQL, especially on our old DB2 server.  I've also added VBscript to do this in excel or other client-side apps.
-- Define the string of characters that we'll need to pull the reference of
declare @asciiString varchar(255)
select @asciiString = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
select @asciiString = @asciiString + char(195) -- 0xC3
select @asciiString = @asciiString + char(196) -- 0xC4
select @asciiString = @asciiString + char(197) -- 0xC5
select @asciiString = @asciiString + char(198) -- 0xC6
select @asciiString = @asciiString + char(199) -- 0xC7
select @asciiString = @asciiString + char(200) -- 0xC8
select @asciiString = @asciiString + char(201) -- 0xC9
select @asciiString = @asciiString + char(202) -- 0xCA
/* -- alternate string for some windows TTF barcode fonts if above doesn't work
select @asciiString = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
select @asciiString = @asciiString + char(200) -- 0xC8
select @asciiString = @asciiString + char(201) -- 0xC9
select @asciiString = @asciiString + char(202) -- 0xCA
select @asciiString = @asciiString + char(203) -- 0xCB
select @asciiString = @asciiString + char(204) -- 0xCC
select @asciiString = @asciiString + char(205) -- 0xCD
select @asciiString = @asciiString + char(206) -- 0xCE
select @asciiString = @asciiString + char(207) -- 0xCF
*/
-- Define the stop and start characters
declare @stopchar char(1)
declare @startchar char(1)
declare @spacechar char(1)
select @stopchar = char(206) -- 0xCE
select @startchar = char(204) -- 0xCC
select @spacechar = char(194) -- 0xC2

-- Define the final holding place of our output string
declare @finalArray varchar(255)

-- Define the variables that we'll need to be using
declare @checksumTotal int
declare @checksum int
select @checksumTotal = 104;
select @checksum = 0;

-- Start building our output
select @finalArray = @startchar

-- Loop through our input variable and start pulling out stuff
declare @position int
declare @thisChar char(1)
select @position = 1
while @position <= len(@myString)
begin
select @thisChar = substring(@myString, @position, 1)
select @checksumTotal = @checksumTotal + (@position * (ascii(@thischar)-32))
select @finalArray = @finalArray + @thisChar
select @position = @position + 1
end -- We've gone past the length now

-- Now we need to figure out and add the checksum character
select @checksum = @checksumTotal % 103
if @checksum = 0
select @finalArray = @finalArray + @spacechar
else
-- Barcorde array assumes 0 as initial offset so we need to add 1 to checksum
select @finalArray = @finalArray + substring(@asciiString, @checksum+1, 1)
-- Now we append the stop character
select @finalArray = @finalArray + @stopchar

-- The @final Array represents the barcode encoded string
select @finalArray[/CODE]