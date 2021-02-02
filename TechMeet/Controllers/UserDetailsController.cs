using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TechMeet.DATA.EF;
using Microsoft.AspNet.Identity;

namespace TechMeet.Controllers
{
    public class UserDetailsController : Controller
    {
        private TechMeetEntities db = new TechMeetEntities();

        // GET: UserDetails
        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            return View(db.UserDetails.ToList().OrderBy(x => x.LastName));
        }

        // GET: UserDetails/Details/5
        public ActionResult Details(string id)
        {
            string currentUserId = User.Identity.GetUserId();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }

            if (User.IsInRole("Manager") || User.IsInRole("Employee"))
            {
                var userDeets = db.UserDetails.Where(x => x.UserId == currentUserId);
                return View(userDeets);
            }
            return View(userDetail);
        }

        // GET: UserDetails/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,FirstName,LastName,ResumeFilename")] UserDetail userDetail, HttpPostedFileBase resume)
        {
            if (ModelState.IsValid)
            {
                string resumeName = "noPDF.pdf";
                if (resume != null)
                {
                    resumeName = resume.FileName;

                    string ext = resumeName.Substring(resumeName.LastIndexOf('.'));

                    string goodExt = ".pdf";

                    if (goodExt.Contains(ext.ToLower()) && (resume.ContentLength <= 4194304))
                    {
                        resumeName = Guid.NewGuid() + ext;

                        resume.SaveAs(Server.MapPath("~/Content/resumes/" + resumeName));
                    }
                    else
                    {
                        resumeName = "noPDF.pdf";
                    }
                }
                userDetail.ResumeFilename = resumeName;

                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,FirstName,LastName,ResumeFilename")] UserDetail userDetail, HttpPostedFileBase resume)
        {
            if (ModelState.IsValid)
            {
                string resumeName = resume.FileName;

                string ext = resumeName.Substring(resumeName.LastIndexOf("."));

                string goodExt = ".pdf";

                if (goodExt.Contains(ext.ToLower()) && (resume.ContentLength <= 4194304))
                {
                    resumeName = Guid.NewGuid() + ext;

                    resume.SaveAs(Server.MapPath("~/Content/resumes/" + resumeName));
                }

                userDetail.ResumeFilename = resumeName;

                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userDetail);
        }

        // GET: UserDetails/Delete/5
        [Authorize]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            UserDetail userDetail = db.UserDetails.Find(id);

            if (userDetail.ResumeFilename != null && userDetail.ResumeFilename != "noPDF.pdf")
            {
                System.IO.File.Delete(Server.MapPath("~/Content/resumes/" + userDetail.ResumeFilename.ToString()));
            }

            db.UserDetails.Remove(userDetail);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
