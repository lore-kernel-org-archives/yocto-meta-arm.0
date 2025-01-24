Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C14C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:52:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4509.1737755563424366001
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 13:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8237C40C6B;
	Fri, 24 Jan 2025 21:52:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FER1uTAVeiwh; Fri, 24 Jan 2025 21:52:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A60940A22;
	Fri, 24 Jan 2025 21:52:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BCEAC1641A9; Fri, 24 Jan 2025 16:52:39 -0500 (EST)
Date: Fri, 24 Jan 2025 16:52:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: willhowe235@gmail.com
Cc: meta-arm@lists.yoctoproject.org, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-arm] Failing to fetch beaglebone kernel from github
Message-ID: <20250124215239.GB21836@denix.org>
References: <lrnS.1737746847989365062.hDBY@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <lrnS.1737746847989365062.hDBY@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2025 21:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6349

On Fri, Jan 24, 2025 at 11:27:27AM -0800, willhowe235 via lists.yoctoprojec=
t.org wrote:
> Hello all,
>=20
> I'm new to the yocto project and I'm a first time poster.

This question is more appropriate for the meta-ti mailing list (copied).

Since the recipe you are having problems with resides in meta-beagle layer,=
=20
which is part of the meta-ti repository. And Yocto Project layers are requi=
red=20
to have a README file that explains where to send questions to:
https://git.yoctoproject.org/meta-ti/tree/meta-beagle/README?h=3Dscarthgap


> NOTE: Executing Tasks
> WARNING: linux-bb.org-6.6.32+git-r0 do_fetch: Failed to fetch URL git://g=
ithub.com/beagleboard/linux.git;protocol=3Dhttps;branch=3Dv6.6.32-ti-arm32-=
r7, attempting MIRRORS if available
> ERROR: linux-bb.org-6.6.32+git-r0 do_fetch: Fetcher failure: Fetch comman=
d export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=
=3D/run/user/1000/bus"; export PATH=3D"/home/whowe1/tmp/sysroots-uninative/=
x86_64-linux/usr/bin:/home/whowe1/yocto_live_coding_project/poky/scripts:/h=
ome/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/r=
ecipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi:/home/whowe1/tmp/work/b=
eaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot/usr/bin=
/crossscripts:/home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.=
org/6.6.32+git/recipe-sysroot-native/usr/sbin:/home/whowe1/tmp/work/beagleb=
one-poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot-native/usr/bi=
n:/home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+g=
it/recipe-sysroot-native/sbin:/home/whowe1/tmp/work/beaglebone-poky-linux-g=
nueabi/linux-bb.org/6.6.32+git/recipe-sysroot-native/bin:/home/whowe1/yocto=
_live_coding_project/poky/bitbake/bin:/home/whowe1/tmp/host
> tools"; export HOME=3D"/home/whowe1"; LANG=3DC git -c gc.autoDetach=3Dfal=
se -c core.pager=3Dcat -c safe.bareRepository=3Dall fetch -f --progress htt=
ps://github.com/beagleboard/linux.git refs/heads/*:refs/heads/* refs/tags/*=
:refs/tags/* failed with exit code 128, see logfile for output
> ERROR: linux-bb.org-6.6.32+git-r0 do_fetch: Bitbake Fetcher Error: FetchE=
rror('Unable to fetch URL from any source.', 'git://github.com/beagleboard/=
linux.git;protocol=3Dhttps;branch=3Dv6.6.32-ti-arm32-r7')
> ERROR: Logfile of failure stored in: /home/whowe1/tmp/work/beaglebone-pok=
y-linux-gnueabi/linux-bb.org/6.6.32+git/temp/log.do_fetch.1038389

Could you check the corresponding log file referred here ^^^

I just tried it locally and it worked as expected:

$ git clone https://github.com/beagleboard/linux.git -b v6.6.32-ti-arm32-r7
=2E..
$ git checkout 525684d28fadc2bdae5424f28b219377bd5d4639
=2E..

Please try these steps manually and see if that works. I wonder if it's som=
e=20
kind of a local issue (e.g. caused by WSL) or a temporarily connection issu=
e=20
with github...

FWIW, we used to fetch directly from git.beagleboard.org, but had to switch=
 to=20
github.com as it was more reliable:

https://git.yoctoproject.org/meta-ti/commit/?id=3D26665b1fea17ac6010121fff5=
93759de55bb6120

--=20
Denys

