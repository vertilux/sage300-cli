  def cash_paid_to_vendors
    VendorStatistics.find_by_sql("
      SELECT vg.GROUPID, vg.DESCRIPTN, SUM(vs.AMTINVPDHC) AS AMTINVPDHC
      FROM APVGR vg
      JOIN APVEN v ON vg.GROUPID = v.IDGRP
      JOIN APVSM vs ON vs.VENDORID = v.VENDORID
      WHERE vs.CNTYR = #{current_year}
      GROUP BY vg.GROUPID, vg.DESCRIPTN
    ")
  end
