Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1919.1589828327088204308
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 11:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 779D040C28;
	Mon, 18 May 2020 18:58:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1Glk40BynZH; Mon, 18 May 2020 18:58:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 448CE40AF3;
	Mon, 18 May 2020 18:58:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E97B2173145; Mon, 18 May 2020 14:58:43 -0400 (EDT)
Date: Mon, 18 May 2020 14:58:43 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: William Mills <wmills@ti.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
Message-ID: <20200518185843.GM11927@denix.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
 <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
 <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 01:03:01PM -0500, Joshua Watt wrote:
> 
> On 5/18/20 12:04 PM, William Mills wrote:
> >
> >On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
> >>On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
> >>>Adds a sysVinit service to start tee-supplicant so that the optee-client
> >>>package can be used on distros where systemd is not used. Also does some
> >>>cleanup of the recipe including:
> >>>  1) Using @path@ tokens for replacemane in the .service file instead of
> >>>     paths
> >>>  2) Replacing tokens in the .service file after it is installed instead
> >>>     of editing the source file in ${WORKDIR}
> >>Overall looks fine. Quick question - if both sysvinit and systemd are in
> >>DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
> >>to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
> >>and only install/enable the service accordingly, while some completely rely
> >>on the corresponding bbclass.
> >>
> >I had to look into this on ubuntu/debian recently.
> >systemd's sysvinit emulation will skip any sysvinit script that has the
> >same name as a *.service file.
> >
> > From [1]:
> >"""
> >systemd-sysv-generator generates the service units that run the van
> >Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
> >systemd service unit by that name already existing in the other six
> >locations.
> >"""
> >
> >I don't know if that is systemd default or Debian enhancement but OE
> >should follow that rule if it does not already IMHO.
> 
> systemd.bbclass and update-rc.d.bbclass work together to do the
> correct things based on the existence of the "sysvinit" and
> "systemd" DISTRO_FEATURES, so its fine to include both in a recipe.

So, if both are included and have the same name, systemd will skip the 
sysvinit emulation and load the correct service only once, correct?


> >This is not clear in the man pages [2][3].
> >
> >[1]
> >https://unix.stackexchange.com/questions/233468/how-does-systemd-use-etc-init-d-scripts
> >
> >[2]
> >http://manpages.ubuntu.com/manpages/bionic/man8/systemd-sysv-generator.8.html
> >
> >[3]
> >https://www.freedesktop.org/software/systemd/man/systemd-sysv-generator.html
> >
> >Bill

> 

