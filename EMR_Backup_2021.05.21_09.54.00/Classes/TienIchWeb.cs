using System;
using Newtonsoft.Json;
using System.Data;
using System.IO;
using System.Net;
using System.Web.UI.WebControls;
using System.Text;
using Newtonsoft.Json.Linq;

public class TienIchWeb
{
    public static string url = "";   // "http://172.16.0.10/ict/api/Tracking73";
    public static HttpWebRequest request; //test
  
    public static string getJstring(string url)
    {
        string jstring = "";
        //surl = "http://172.16.0.10/ict/api/Tracking73";
        var js = TienIchWeb.MakeRequest(url, null, "GET", "");//, Type JSONResponseType)

        if (!string.IsNullOrEmpty(js.ToString()) | js != null)
            jstring = js.ToString();
        return jstring;
    }


    public static DataTable GetDataTableJS(string jsquery)
    {
        dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(jsquery);

        DataTable dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
        
        return dt;
    }
   public static void AddToGridView(string jsquery, GridView grv)
    {
        dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(jsquery);
        DataTable tbl = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
        grv.DataSource = tbl;
        grv.DataBind();
    }
    public static object MakeRequest(string requestUrl, object JSONRequest, string JSONmethod, string JSONContentType)//, Type JSONResponseType)
    {
        try
        {
            //HttpWebRequest request = WebRequest.Create(requestUrl) as HttpWebRequest;
            request = WebRequest.Create(requestUrl) as HttpWebRequest;
            //HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlSend);
            //WebRequest WR = WebRequest.Create(requestUrl);   
            string sb = JsonConvert.SerializeObject(JSONRequest);
            request.Method = JSONmethod;

            Byte[] bt = System.Text.Encoding.UTF8.GetBytes(sb);
            //Stream st = request.GetRequestStream();
            //   st.Write(bt, 0, bt.Length);
            //  st.Close();
            if (JSONmethod == "POST" | JSONmethod == "PUT" | JSONmethod == "DELETE")
            {
                request.ContentType = JSONContentType; // "application/json";   
                using (StreamWriter streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    //StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                    streamWriter.Write(JSONRequest);
                    streamWriter.Close();
                }
            }
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {

                if (response.StatusCode != HttpStatusCode.OK) throw new Exception(String.Format(
                    "Server error (HTTP {0}: {1}).", response.StatusCode,
                response.StatusDescription));

                //DataContractJsonSerializer jsonSerializer = new DataContractJsonSerializer(typeof(Response));
                //// object objResponse = JsonConvert.DeserializeObject();
                Stream stream1 = response.GetResponseStream();
                StreamReader sr = new StreamReader(stream1);
                string strsb = sr.ReadToEnd();
                //object objResponse = JsonConvert.DeserializeObject(strsb, JSONResponseType);
                JSONContentType = strsb;
                return strsb;// objResponse;                    
            }
        }
        catch (WebException ex)
        {
            String errorText = "";
            WebResponse errorResponse = ex.Response;
            using (Stream responseStream = errorResponse.GetResponseStream())
            {
                StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                errorText = reader.ReadToEnd();
            }
            // throw;
            return errorText;
        }
    }
    public static string getJstring(string url, string authToken)
    {

        string jstring = "";
        //var js = TienIchWeb.MakeRequestToKen(url, null, "POST", "application / json", authToken);
        //if (!string.IsNullOrEmpty(js.ToString()) | js != null)
        //    jstring = js.ToString();
        return jstring;
    }


    public static string getJstring()
    {
        string jstring = "";
        var js = TienIchWeb.MakeRequest(url, null, "GET", "");//, Type JSONResponseType)

        if (!string.IsNullOrEmpty(js.ToString()) | js != null)
            jstring = js.ToString();
        return jstring;
    }

    protected void Add(object sender, EventArgs e)
    {
        string PostData = "{\"invoice_nr\":\"1021\",\"customer_nr\":\"tin\"}";
        url = "http://mis.aih.com.vn/aihapi/api/invoice";

        MakeRequest(url, PostData, "POST", "application/json");//, Type JSONResponseType)
    }
    protected void Update(string sender, EventArgs e)
    {
        string PostData = "{\"invoice_nr\":\"1020\",\"customer_nr\":\"minh\"}";
        //"{\"invoice_nr\":\"@1\",\"customer_nr\":\"@2\"}";
        url = "http://mis.aih.com.vn/aihapi/api/invoice/1020";
        MakeRequest(url, PostData, "PUT", "application/json");//, Type JSONResponseType)
    }
    protected void Delete(object sender, EventArgs e)
    {
        string PostData = "{\"invoice_nr\":\"1021\"}";
        url = "http://mis.aih.com.vn/aihapi/api/invoice/1021";
        MakeRequest(url, PostData, "DELETE", "application/json");//, Type JSONResponseType)
    }
    public static string POST(string url, string jsonContent, string authToken, bool authen)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "POST";
        if (authen)
        {
            request.Headers.Add("Authentication", authToken); // SOFTDREAM
        }
        else
        {
            request.Headers.Add("Authorization", authToken);//HEARME
        }


        System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
        Byte[] byteArray = encoding.GetBytes(jsonContent);
        request.ContentLength = byteArray.Length;
        request.ContentType = "application/json";
        using (Stream dataStream = request.GetRequestStream())
        {
            dataStream.Write(byteArray, 0, byteArray.Length);
        }
        long length = 0;
        try
        {
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                length = response.ContentLength;
                WebResponse response1 = request.GetResponse();
                Stream dataStream = response1.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                var responseFromServer = reader.ReadToEnd();

                //var res = response1;
                reader.Close();
                dataStream.Close();
                response.Close();
                return responseFromServer;

            }


        }
        catch (WebException ex)
        {
            //MessageBox.Show(ex.Message);
            return null;
        }
    }
    public static string GET(string url, string jsonContent, string authToken)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "GET";
        request.Headers.Add("Authentication", authToken);
        System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
        Byte[] byteArray = encoding.GetBytes(jsonContent);
        request.ContentLength = byteArray.Length;
        request.ContentType = "application/json";
        using (Stream dataStream = request.GetRequestStream())
        {
            dataStream.Write(byteArray, 0, byteArray.Length);
        }
        long length = 0;
        try
        {
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                length = response.ContentLength;
                WebResponse response1 = request.GetResponse();
                Stream dataStream = response1.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                var responseFromServer = reader.ReadToEnd();

                //var res = response1;
                reader.Close();
                dataStream.Close();
                response.Close();
                return responseFromServer;

            }
        }
        catch (WebException ex)
        {
            //MessageBox.Show(ex.Message);
            return null;
        }
    }

    public static string POST(string url, string jsonContent)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "POST";
        // request.Headers.Add("Authentication", authToken);
        System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
        Byte[] byteArray = encoding.GetBytes(jsonContent);
        request.ContentLength = byteArray.Length;
        request.ContentType = "application/json";
        using (Stream dataStream = request.GetRequestStream())
        {
            dataStream.Write(byteArray, 0, byteArray.Length);
        }
        long length = 0;
        try
        {
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                length = response.ContentLength;
                WebResponse response1 = request.GetResponse();
                Stream dataStream = response1.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                var responseFromServer = reader.ReadToEnd();

                //var res = response1;
                reader.Close();
                dataStream.Close();
                response.Close();
                return responseFromServer;

            }
        }
        catch (WebException ex)
        {
            //MessageBox.Show(ex.Message);
            return null;
        }
    }

    public static string GenerateToken(string httpMethod, string username, string password)
    {
        DateTime epochStart = new DateTime(1970, 01, 01, 0, 0, 0, 0, DateTimeKind.Utc);
        TimeSpan timeSpan = DateTime.UtcNow - epochStart;
        string timestamp = Convert.ToUInt64(timeSpan.TotalSeconds).ToString();
        string nonce = Guid.NewGuid().ToString("N").ToLower();
        string signatureRawData = $"{httpMethod.ToString().ToUpper()}{timestamp}{nonce}";

        using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
        {
            var hash = md5.ComputeHash(Encoding.UTF8.GetBytes(signatureRawData));
            var signature = Convert.ToBase64String(hash);
            return $"{signature}:{nonce}:{timestamp}:{username}:{password}";
        }
    }

 
}
