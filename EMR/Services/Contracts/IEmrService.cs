namespace EMR.Services.Contracts
{
    public interface IEmrService
    {
        void GetLogList(string model, string location, string documentId);
    }
}
