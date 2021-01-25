using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TechMeet.Startup))]
namespace TechMeet
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
