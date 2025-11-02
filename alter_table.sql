--Adding gender to table 
ALTER TABLE infoemployee
add column genders varchar(10) not null
check(genders in ('Male', 'Female')); 

--Adding current_time to table
ALTER TABLE infoemployee
add column time_in time default current_time; 

--Remove column gender
ALTER TABLE infoemployee
DROP COLUMN genders 

--Renaming column
renaming genders to gender
ALTER TABLE infoemployee
rename column genders to gender;
