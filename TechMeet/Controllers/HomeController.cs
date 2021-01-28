using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using TechMeet.UI.MVC.Models;

namespace TechMeet.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }
            string message = $"{cvm.Name}, just sent you an email with a subject \"{cvm.Subject},\" from {cvm.Email}, containing the message: <br />{cvm.Message}";
            MailMessage mm = new MailMessage("admin@isaacbeck.net", "isaacbbeck@outlook.com", cvm.Subject, message);
            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            mm.ReplyToList.Add(cvm.Email);
            SmtpClient client = new SmtpClient("mail.isaacbeck.net");
            client.Credentials = new NetworkCredential("admin@isaacbeck.net", "@0nid0g19");
            client.Port = 8889;

            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We're sorry your request could not be completed at this time. Please try again later.<br />Error Message<br />{ex.StackTrace}.";
                return View(cvm);
            }
            return View("EmailConfirmation", cvm);
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
