using System;

namespace EMR.Model
{
    public interface IEmrFormModel<T>
    {
        T FormModel { get; }
        /// <summary>
        /// <para>Description: User login</para>
        /// <para>Ex: hisuser</para>
        /// </summary>
        string UserId { get; }
        /// <summary>
        /// <para>Description: employee id</para>
        /// <para>Ex: 8b38e1b7-374c-409a-8b2b-d8556683d4ce</para>
        /// </summary>
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
        /// <summary>
        /// <para>Description: Ngày ký</para>
        /// </summary>
        string SignatureDate { get; }
        /// <summary>
        /// <para>Description: Chữ ký</para>
        /// </summary>
        string SignatureName { get; }
        void Initial();
        void SetDefaultValue();
        void PostBackEventHandler();
        void BindingDataForm(T disc, bool state);
        void BindingDataFormView(T disc);
        void BindingDataFormEdit(T disc);
        void BindingDataFormPrint(T disc);
        void UpdateData(T disc);
    }
}
