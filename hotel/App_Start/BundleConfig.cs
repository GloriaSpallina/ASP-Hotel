using System.Web;
using System.Web.Optimization;

namespace hotel
{
    public class BundleConfig
    {
        // Pour plus d'informations sur le regroupement, visitez https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-1.12.4.min.js"));


            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/css/bootstrap.min.css",
                      "~/css/owl.carousel.min.css",
                      "~/css/gijgo.css",
                      "~/css/slicknav.css",
                      "~/css/animate.min.css",
                      "~/css/magnific-popup.css",
                      "~/css/fontawesome-all.min.css",
                      "~/css/themify-icons.css",
                      "~/css/slick.css",
                      "~/css/nice-select.css",
                      "~/css/style.css",
                      "~/css/responsive.css"));

         
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/js/vendor/modernizr-3.5.0.min.js"
               ));
            
            bundles.Add(new ScriptBundle("~/bundles/magnificpopup").Include("~/js/jquery.magnific-popup.js"));



            bundles.Add(new ScriptBundle("~/bundles/PropperBootstrap").Include(
                "~/js/popper.min.js",
               "~/js/bootstrap.min.js"
               ));

            bundles.Add(new ScriptBundle("~/bundles/MobileMenu").Include(
               "~/js/jquery.slicknav.min.js"
               ));

            bundles.Add(new ScriptBundle("~/bundles/Carousel").Include(
               "~/js/owl.carousel.min.js",
               "~/js/slick.min.js",
               "~/js/gijgo.min.js"
               ));

            bundles.Add(new ScriptBundle("~/bundles/AnimatedHeadline").Include(
               "~/js/wow.min.js",
               "~/js/animated.headline.js"
               ));

            bundles.Add(new ScriptBundle("~/bundles/ScrollNiceSticky").Include(
               "~/js/jquery.scrollUp.min.js",
               "~/js/jquery.nice-select.min.js",
               "~/js/jquery.sticky.js"
               ));

            bundles.Add(new ScriptBundle("~/bundles/Contact").Include(
               "~/js/contact.js",
               "~/js/jquery.form.js",
               "~/js/jquery.validate.min.js",
               "~/js/mail-script.js",
               "~/js/jquery.ajaxchimp.min.js"
               ));

            bundles.Add(new ScriptBundle("~/bundles/Main").Include(
            "~/js/plugins.js",
            "~/js/main.js"
            ));

        }
    }
}
