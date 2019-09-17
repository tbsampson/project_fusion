

UPDATE CVDTA.F4101
SET IMSRCE = CASE 
                    WHEN IMSRCE IN ('9901','66040','66645','66648','CERAMICFIBER','CERAMICFIBER01','CERAMICFIBER1/2','CERBLANKET101','CERBLANKET1012','DT1812','EBA32A','EBA32B','EC11A','EC11B','HTFABRICPLUS','INTSHEET','MASKTAPE','NRTAPERL','PC33','PLFA-100-H','PLFA-100-H-M','PLFA-100-OB','PRIMER2A','PRIMER2B','SCRIM','SKA1','SKP1','ST2','ST2D','TC12A','TC12B')
                        THEN '3'
                    ELSE ''
              END;
COMMIT;


UPDATE CVDTA.F4102
SET IBSRCE = CASE 
                    WHEN IBSRCE IN ('9901','66040','66645','66648','CERAMICFIBER','CERAMICFIBER01','CERAMICFIBER1/2','CERBLANKET101','CERBLANKET1012','DT1812','EBA32A','EBA32B','EC11A','EC11B','HTFABRICPLUS','INTSHEET','MASKTAPE','NRTAPERL','PC33','PLFA-100-H','PLFA-100-H-M','PLFA-100-OB','PRIMER2A','PRIMER2B','SCRIM','SKA1','SKP1','ST2','ST2D','TC12A','TC12B')
                        THEN '3'
                    ELSE ''
              END;
COMMIT;
