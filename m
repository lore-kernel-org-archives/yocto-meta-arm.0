Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1813.1589841711857151720
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 15:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D29C40AF3;
	Mon, 18 May 2020 22:41:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c28Sb6dNDCBL; Mon, 18 May 2020 22:41:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F308E40A9E;
	Mon, 18 May 2020 22:41:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5D36317316F; Mon, 18 May 2020 18:41:48 -0400 (EDT)
Date: Mon, 18 May 2020 18:41:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: William Mills <wmills@ti.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
Message-ID: <20200518224148.GO11927@denix.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
 <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
 <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
 <20200518185843.GM11927@denix.org>
 <09567703-1e04-ee36-f6a8-f8a60b10592b@ti.com>
 <7c1ad105-4850-aced-26a4-61dd6e8c52b4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7c1ad105-4850-aced-26a4-61dd6e8c52b4@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 05:06:48PM -0500, Joshua Watt wrote:
> 
> On 5/18/20 4:57 PM, William Mills wrote:
> >
> >On 5/18/20 2:58 PM, Denys Dmytriyenko wrote:
> >>On Mon, May 18, 2020 at 01:03:01PM -0500, Joshua Watt wrote:
> >>>On 5/18/20 12:04 PM, William Mills wrote:
> >>>>On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
> >>>>>On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
> >>>>>>Adds a sysVinit service to start tee-supplicant so that the optee-client
> >>>>>>package can be used on distros where systemd is not used. Also does some
> >>>>>>cleanup of the recipe including:
> >>>>>>  1) Using @path@ tokens for replacemane in the .service file instead of
> >>>>>>     paths
> >>>>>>  2) Replacing tokens in the .service file after it is installed instead
> >>>>>>     of editing the source file in ${WORKDIR}
> >>>>>Overall looks fine. Quick question - if both sysvinit and systemd are in
> >>>>>DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
> >>>>>to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
> >>>>>and only install/enable the service accordingly, while some completely rely
> >>>>>on the corresponding bbclass.
> >>>>>
> >>>>I had to look into this on ubuntu/debian recently.
> >>>>systemd's sysvinit emulation will skip any sysvinit script that has the
> >>>>same name as a *.service file.
> >>>>
> >>>> From [1]:
> >>>>"""
> >>>>systemd-sysv-generator generates the service units that run the van
> >>>>Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
> >>>>systemd service unit by that name already existing in the other six
> >>>>locations.
> >>>>"""
> >>>>
> >>>>I don't know if that is systemd default or Debian enhancement but OE
> >>>>should follow that rule if it does not already IMHO.
> >>>systemd.bbclass and update-rc.d.bbclass work together to do the
> >>>correct things based on the existence of the "sysvinit" and
> >>>"systemd" DISTRO_FEATURES, so its fine to include both in a recipe.
> >>So, if both are included and have the same name, systemd will skip the
> >>sysvinit emulation and load the correct service only once, correct?
> >>
> >>
> >Yes that is my understanding of how it works at run time, at least on
> >debian.  Even if the user was to hand create both an sysinit script and
> >a service file with the same basename, systemd will ignore the script in
> >favor of the service file.  (sysvinit has know how to ignore service
> >files since the 1970's :)
> >
> >Joshua: is what you are talking about in the classes a runtime selection
> >or a rootfs build time selection?  Perhaps we are double covered?
> 
> Build time. systemd.bbclass sets INHIBIT_UPDATERCD_BBCLASS = "1" if
> "systemd" is in DISTRO_FEATURES and "sysvinit" is not,
> update-rc.d.bbclass does nothing if that is set, and setting
> INIT_MANAGER = "systemd" removes(*) "sysvinit" from DISTRO_FEATURES
> and adds "systemd", so it pretty much automatically prefers the
> systemd service files if possible.
> 
> * Well, sets DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"

Yeah, well, INIT_MANAGER is a simplification short-cut that is meant to setup 
bunch of VIRTUAL-RUNTIME variables and ensure some sane defaults. It only 
handles cases of systemd OR sysvinit OR mdev.

One can still go a more advanced route and set VIRTUAL-RUNTIME variables 
directly and have both systemd AND sysvinit enabled in DISTRO_FEATURES. There 
are (or maybe were) some specific use-cases that required systemd init-manager 
enabled alongside fallback sysvinit scripts, because "systemd-compat-units" 
was not enough. Maybe because of the recipes I mentioned that check for 
"sysvinit" in DISTRO_FEATURES to even install correcponding initscripts.

Hence my question (and I believe, Bill's comments also) were regarding 
run-time support of such cases...

-- 
Denys
