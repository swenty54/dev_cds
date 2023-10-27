@AbapCatalog.sqlViewName: 'ZSEMIHP_CDS_003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds eğitim-2'
define view zsemihp_5026_cds_003 as select from zsemihp_cds_002 as cds2
{
    key cds2.vbeln,
    sum(cds2.conversion_netwr)                as toplam_net_deger,
    cds2.kunnrad                              as musteri_adi_soyadi,
    count(*)                                  as toplam_fatura_miktari ,
    division(cast( sum(cds2.conversion_netwr) as abap.curr( 10, 3 ) ), cast( count(*) as abap.int1 ), 3) as ortalama_miktar,
    substring(cds2.fkdat, 1, 4)               as faturalama_yili,
    substring(cds2.fkdat, 5, 2)               as faturalama_ayi,
    substring(cds2.fkdat, 7, 2)               as faturalama_gunu,
    substring(cds2.inco2_l,1,3)               as incoterm_yeri
    
}   group by cds2.vbeln,
             cds2.kunnrad, 
             cds2.fkdat, 
             cds2.inco2_l
