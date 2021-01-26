using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TechMeet.UI.MVC.Startup))]
namespace TechMeet.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
