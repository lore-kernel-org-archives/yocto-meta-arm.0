Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687B2C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 19:16:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1218.1651173397366973434
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 12:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F18DC40C22;
	Thu, 28 Apr 2022 19:16:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrllnJMaLjV9; Thu, 28 Apr 2022 19:16:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B505C40951;
	Thu, 28 Apr 2022 19:16:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 81BDC1748F0; Thu, 28 Apr 2022 15:16:30 -0400 (EDT)
Date: Thu, 28 Apr 2022 15:16:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com, ross.burton@arm.com, daniel.thompson@linaro.org
Subject: Re: [PATCH 1/2] external-arm-toolchain-versions: Use ldd to get
 libc version
Message-ID: <20220428191630.GN9834@denix.org>
References: <20220428122848.3941460-1-sumit.garg@linaro.org>
 <20220428140001.GM9834@denix.org>
 <Ymrk9HYsLWJjeerC@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ymrk9HYsLWJjeerC@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Apr 2022 19:16:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3328

On Thu, Apr 28, 2022 at 03:03:16PM -0400, Jon Mason wrote:
> Sumit, 
> It passes my CI.  Can you answer Denys's question below?
> 
> WE're going to cut the branch tomorrow, and I'd really like to get
> this in.  However, if it's not ready, we'll push it to the next
> release.
> 
> Thanks,
> Jon
> 
> On Thu, Apr 28, 2022 at 10:00:01AM -0400, Denys Dmytriyenko wrote:
> > On Thu, Apr 28, 2022 at 05:58:47PM +0530, Sumit Garg wrote:
> > > Arm GCC 11.2 binary release has moved away from keeping libc library
> > > versioning info as libc-{EAT_VER_LIBC}.so. So rather switch to
> > > retrieving libc version by parsing output from "$ ldd --version".
> > > 
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  .../external-arm-toolchain-versions.inc       | 43 ++++++++-----------
> > >  1 file changed, 17 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > index a89f2f0..388987a 100644
> > > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > @@ -50,37 +50,28 @@ def eat_get_gcc_version(d):
> > >  
> > >  def eat_get_libc_version(d):
> > >      import os,bb
> > > +    import subprocess
> > > +
> > >      syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
> > >      if not syspath:
> > >          return 'UNKNOWN'
> > >  
> > > -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> > > -
> > > -    if os.path.exists(libpath):
> > > -        for file in os.listdir(libpath):
> > > -            if file.find('libc-') == 0:
> > > -                return file[5:-3]
> > > -
> > > -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
> > > -
> > > -    if os.path.exists(libpath):
> > > -        for file in os.listdir(libpath):
> > > -            if file.find('libc-') == 0:
> > > -                return file[5:-3]
> > > -
> > > -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> > > -
> > > -    if os.path.exists(libpath):
> > > -        for file in os.listdir(libpath):
> > > -            if file.find('libc-') == 0:
> > > -                return file[5:-3]
> > > -
> > > -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
> > > +    topdir = d.getVar('TOPDIR', True)
> > > +    lddpath = syspath + '/libc/usr/bin/ldd'
> > > +
> > > +    if os.path.exists(lddpath):
> > > +        cmd1 = 'sed -i -e \'s#/usr/bin/bash#/bin/bash#\' ' + lddpath

Running an executable from a target sysroot is also questionable, but since 
it's a shell script and only used to print the version, is probably Ok.


> > Are you trying to sed-in-place ldd executable, which is relative to 
> > ${EXTERNAL_TOOLCHAIN} that can be installed system-wide w/o necessary 
> > permissions?

The way to bypass the bad shebang is to call the interpreter directly (and 
it's not bash specific, so /bin/sh should work):

$ /bin/sh $syspath/libc/usr/bin/ldd --version

In previous releases, ldd came with even more weird shebang, e.g.:

#! /arm/tools/gnu/bash/4.2/rhe6-x86_64/bin/bash

All that gets corrected in do_install() of external-arm-toolchain.bb anyway.


> > > +        cmd2 = lddpath + ' --version'
> > > +        try:
> > > +            stdout, stderr = bb.process.run(cmd1, cwd=topdir, stderr=subprocess.PIPE)
> > > +            stdout, stderr = bb.process.run(cmd2, cwd=topdir, stderr=subprocess.PIPE)
> > > +        except bb.process.CmdError as exc:
> > > +            bb.error('Failed to obtain external Arm libc version: %s' % exc)
> > > +            return 'UNKNOWN'
> > > +        else:
> > > +            first_line = stdout.splitlines()[0]
> > > +            return first_line.split()[2]
> > >  
> > > -    if os.path.exists(libpath):
> > > -        for file in os.listdir(libpath):
> > > -            if file.find('libc-') == 0:
> > > -                return file[5:-3]
> > >      return 'UNKNOWN'
> > >  
> > >  def eat_get_kernel_version(d):
> > > -- 
> > > 2.17.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

