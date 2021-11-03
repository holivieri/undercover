using Microsoft.AspNetCore.Mvc.ApplicationModels;
using System.Linq;

namespace Undercover.API.Config
{
    public class SwaggerConvention : IControllerModelConvention
    {
        public void Apply(ControllerModel controller)
        {
            var namespaceController = controller.ControllerType.Namespace;
            var ApiVersion = namespaceController.Split('.').Last().ToLower();
            controller.ApiExplorer.GroupName = ApiVersion;
        }
    }
}
