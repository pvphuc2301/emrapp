using System.Threading.Tasks;
using Emr.WebServices;
using Newtonsoft.Json.Linq;

namespace Emr.Ris.ImagingEncode
{
    public class ImagingEncodeService
    {
        private readonly WebService webService;
        public ImagingEncodeService(WebService _webService)
        {
            webService = _webService;
        }
        public ImagingEncodeResponse GetImagingEncode(string UserId, string accnumber, string patientid)
            => GetImagingEncodeAsync(UserId, accnumber, patientid).GetAwaiter().GetResult();
        public async Task<ImagingEncodeResponse> GetImagingEncodeAsync(string UserId, string accnumber, string patientid)
        {
            object requestBody = new
            {
                userid = UserId,
                accnumber = accnumber,
                patientid = patientid
            };

            var response = webService.Post("/api/rad/token", requestBody);
            if (response.IsSuccessStatusCode)
            {
                string data = response.Content.ToString();
                dynamic obj = JObject.Parse(data);
                requestBody = new
                {
                    token = obj.token.ToString()
                };
                response = webService.Post("/api/rad/study", requestBody);
                if (response.IsSuccessStatusCode)
                {
                    data = response.Content.ToString();
                    obj = JObject.Parse(data);
                    return new ImagingEncodeResponse()
                    {
                        patientencode = obj.patientencode,
                        encodeLink = obj.encodeLink
                    };
                }
            }
            return null;
        }
    }
}
