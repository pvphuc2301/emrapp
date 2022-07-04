namespace EMR.Model
{
    public interface IEmrFormModel<T>
    {
        string UserId { get; }
        string EmpId { get; }
        string GroupAccess { get; }
        string AccessAuthorize { get; }
        string PAGE_URL { get; }
        string Location { get; }
        string LocationChanged { get; }
        bool IsLocationChanged { get; }
        string varDocID { get; }
        string varDocIdLog { get; }
        bool IsViewLog { get; }
        string varModelID { get; }
        /// <summary>
        /// <para>Description: patient visit id</para>
        /// </summary>
        string varPVID { get; }
        /// <summary>
        /// <para>Description: visible patient id</para>
        /// </summary>
        string varVPID { get; }
        /// <summary>
        /// <para>Description: patient id</para>
        /// </summary>
        string varPID { get; }
        void Initial();
        void BindingDataForm(T disc, bool state);
        void BindingDataFormView(T disc);
        void BindingDataFormEdit(T disc);
        void BindingDataFormPrint(T disc);
        void UpdateData(T disc);
    }
}
