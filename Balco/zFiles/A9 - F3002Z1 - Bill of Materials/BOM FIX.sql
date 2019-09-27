SELECT 

	 BOM.SZEDUS
	,BOM.SZEDBT
	,BOM.SZEDTN
	,BOM.SZEDLN
	,BOM.SZEDCT
	,BOM.SZTYTN
	,BOM.SZEDFT
	,BOM.SZEDDT
	,BOM.SZDRIN
	,BOM.SZEDDL
	,BOM.SZEDSP
	,BOM.SZPNID
	,BOM.SZTNAC
	,BOM.SZTBM
	,BOM.SZKIT
	,BOM.SZKITL
	,BOM.SZKITA
	,BOM.SZMMCU
	,BOM.SZITM
	,BOM.SZLITM
	,BOM.SZAITM
	,BOM.SZCMCU
	,BOM.SZCPNT
	,BOM.SZSBNT
	,BOM.SZPRTA
	,BOM.SZQNTY
	,BOM.SZUM
	,BOM.SZBQTY
	,BOM.SZUOM
	,BOM.SZFVBT
	,BOM.SZEFFF
	,BOM.SZEFFT
	,BOM.SZFSER
	,BOM.SZTSER
	,BOM.SZITC
	,BOM.SZFTRC
	,BOM.SZOPTK
	,BOM.SZFORV
	,BOM.SZCSTM
	,BOM.SZCSMP
	,BOM.SZORDW
	,BOM.SZFORQ
	,BOM.SZCOBY
	,BOM.SZCOTY
	,BOM.SZFRMP
	,BOM.SZTHRP
	,BOM.SZFRGD
	,BOM.SZTHGD
	,CASE
		WHEN FIX.OS_NEW IS NOT NULL THEN CAST(CAST(FIX.OS_NEW AS DECIMAL(5,2)) * 100 AS INTEGER)
		ELSE BOM.SZOPSQ
	 END	SZOPSQ
	,BOM.SZBSEQ
	,BOM.SZFTRP
	,BOM.SZF$RP
	,BOM.SZRSCP
	,BOM.SZSCRP
	,BOM.SZREWP
	,BOM.SZASIP
	,BOM.SZCPYP
	,BOM.SZSTPP
	,BOM.SZLOVD
	,BOM.SZECO
	,BOM.SZECTY
	,BOM.SZECOD
	,BOM.SZDSC1
	,BOM.SZLNTY
	,BOM.SZPRIC
	,BOM.SZUNCS
	,BOM.SZPCTK
	,BOM.SZSHNO
	,BOM.SZOMCU
	,BOM.SZOBJ
	,BOM.SZSUB
	,BOM.SZBREV
	,BOM.SZCMRV
	,BOM.SZRVNO
	,BOM.SZUUPG
	,BOM.SZURCD
	,BOM.SZURDT
	,BOM.SZURAT
	,BOM.SZURRF
	,BOM.SZURAB
	,BOM.SZUSER
	,BOM.SZPID
	,BOM.SZUPMJ
	,BOM.SZTDAY
	,BOM.SZJOBN
	,BOM.SZAING
	,BOM.SZSUCO
	,BOM.SZSTRC
	,BOM.SZENDC
	,BOM.SZAPSC
	,BOM.SZCPNB
	,BOM.SZBSEQAN
	,BOM.SZBCHAR
	,BOM.SZBOSTR

	-- ,CAST(CAST(FIX.OS_NEW AS DECIMAL(5,2)) * 100 AS INTEGER)

FROM _BOM BOM

LEFT JOIN _BOM_FIX FIX

	ON BOM.SZKIT = FIX.SZKIT
	AND BOM.SZITM =  FIX.SZITM




