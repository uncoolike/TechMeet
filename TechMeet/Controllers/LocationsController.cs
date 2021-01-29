﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TechMeet.DATA.EF;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using TechMeet.UI.MVC.Models;

namespace TechMeet.Controllers
{
    [Authorize(Roles ="Admin")]
    public class LocationsController : Controller
    {
        private TechMeetEntities db = new TechMeetEntities();
        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        private ApplicationRoleManager _roleManager;
        public ApplicationRoleManager RoleManager
        {
            get
            {
                return _roleManager ?? HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            }
            private set
            {
                _roleManager = value;
            }
        }

        // GET: Locations
        public ActionResult Index()
        {
            var locations = db.Locations.Include(l => l.UserDetail);
            return View(locations.ToList().OrderBy(x => x.StoreNumber));
        }

        // GET: Locations/Create
        public ActionResult Create()
        {
            var role = RoleManager.FindByName("Manager");

            var users = new List<ApplicationUser>();

            foreach (var user in UserManager.Users.ToList())
            {
                if (UserManager.IsInRole(user.Id, role.Name))
                {
                    users.Add(user);
                }
            }
            List<UserDetail> managers = new List<UserDetail>();
            foreach (var user in users)
            {
                var man = db.UserDetails.Where(x => x.UserId == user.Id).Single();
                managers.Add(man);
            }

            ViewBag.ManagerId = new SelectList(managers, "UserID", "LastName");

            return View();
        }
        

        // GET: Locations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        [Authorize(Roles = "Admin")]
        // POST: Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LocationId,StoreNumber,City,State,ManagerId")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Locations.Add(location);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FullName", location.ManagerId);
            return View(location);
        }
        [Authorize(Roles = "Admin")]
        // GET: Locations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FirstName", location.ManagerId);
            return View(location);
        }

        [Authorize(Roles = "Admin")]
        // POST: Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LocationId,StoreNumber,City,State,ManagerId")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Entry(location).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerId = new SelectList(db.UserDetails, "UserId", "FirstName", location.ManagerId);
            return View(location);
        }

        // GET: Locations/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Locations/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Location location = db.Locations.Find(id);
            db.Locations.Remove(location);
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
