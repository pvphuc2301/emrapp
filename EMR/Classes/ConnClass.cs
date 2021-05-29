using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ConnClass
{
    public string SQL_HISProConnString = @"Data Source=172.16.0.6;Initial Catalog=OrionHIS_PRO;User ID=sa;Password=P@ssword1;";
    public string SQL_HISConnString = @"Data Source=172.16.0.7;Initial Catalog=OrionHIS_PRO;User ID=sa;Password=P@ssword1;";

    public string SQL_EMRConnString = @"Server=172.16.0.88;Database=EMR_PRO;User Id=sa;Password=!aih@123$;";

    public string SQL_CSLConnString = @"Server=172.16.0.88;Database=Consult_cRepository;User Id=sa;Password=!aih@123$;";

    public string SQL_MISConnString = @"Server=172.16.0.10;Database=AIH_MIS;User Id=mis;Password=mis@123$;";
    public string SQL_MISProConnString = @"Server=172.16.0.6;Database=AIH_MIS;User Id=mis;Password=mis@123$;";

    public string SQL_HIS_C01ConnString = @"Data Source=172.16.0.7;Initial Catalog=OrionHIS_PRO;User ID=sa;Password=P@ssword1;";

    public string SQL_EMR_C01ConnString = @"Server=172.16.0.88;Database=EMR_PRO;User Id=sa;Password=!aih@123$;";
}
