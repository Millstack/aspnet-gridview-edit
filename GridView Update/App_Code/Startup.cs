using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GridView_Update.Startup))]
namespace GridView_Update
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
