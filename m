Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.15039.1620919246623752220
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 May 2021 08:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABF5940B66;
	Thu, 13 May 2021 15:20:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j38eAVA2L_KG; Thu, 13 May 2021 15:20:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D89C407DA;
	Thu, 13 May 2021 15:20:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3ECDA1745E3; Thu, 13 May 2021 11:20:42 -0400 (EDT)
Date: Thu, 13 May 2021 11:20:42 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Sumit Garg <sumit.garg@linaro.org>, Ross Burton <ross@burtonini.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: inhibit build dependencies
Message-ID: <20210513152042.GN1528@denix.org>
References: <20210510181635.3252727-1-ross.burton@arm.com>
 <CAFA6WYOd_hGzeP+CAvqb5Oih8aG1k4uLAeZTu8KC6OSUvXGy5w@mail.gmail.com>
 <20210513145831.GA11769@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20210513145831.GA11769@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2021 at 10:58:31AM -0400, Jon Mason wrote:
> On Tue, May 11, 2021 at 10:05:58AM +0530, Sumit Garg wrote:
> > On Mon, 10 May 2021 at 23:46, Ross Burton <ross@burtonini.com> wrote:
> > >
> > > These recipes don't build anything, so there's no need to depend on a
> > > toolchain.
> > >
> > > Change-Id: I49b641fb54839c30255a11a7c9d5798c8e4afd2a
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > 
> > For the series:
> > 
> > Acked-by: Sumit Garg <sumit.garg@linaro.org>
> 
> Apologies, I was too quick with the trigger and pulled these in before
> you acked.  In my defense, it did pass our internal build CI, and my
> WIP testing. We're still working on a way to have it public, but here
> is a preview of just the building:
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/298844578
> 
> You can see from the names that we are getting some coverage for
> clang, Arm Binary toolchains, Arm GCC sources, and musl (for good
> measure).  Not enough computing power currently for every possible
> permutation, but if you can see any obvious coverage gaps, let me/us
> know.

Jon,

This looks great and is really promising. Please let us know if you need 
anything. Thanks.


> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > > index 2fbabfb..046ab62 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > > @@ -1,3 +1,5 @@
> > > +INHIBIT_DEFAULT_DEPS = "1"
> > > +
> > >  FILES_${PN} = "${datadir} ${bindir}"
> > >
> > >  BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> > > --
> > > 2.25.1
> > >
> > >
> > > 
> > >
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
