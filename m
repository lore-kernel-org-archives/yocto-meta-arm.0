Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB4DC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:23:15 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.6957.1651213388645483439
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EXRdpF7/;
 spf=pass (domain: linaro.org, ip: 209.85.216.44,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f44.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso1031453pjb.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+b8qan40UDvOqnjobi8hvnCyFuCIZEZIWVuNZ7C/vVU=;
        b=EXRdpF7/zrxyoMQw4KqZZla+qyhTIGqJB8JF7uxQ6EsCQbzDZq0muetNe16F/JtqSq
         f7pHg+yjRcysbwdaXI/eDcMP/Cu0bT+B/YASM+LGjmS3vgfyUNZsqCOjFIIhESN/Zibc
         4F15sFPfvL5r0OTWNEnuDErX+wcYTKErZhpmK5/e+6QvKL+PWbM7ofk0xr+qO1nndZBX
         MEO90ck7wXOYuiBafvP2j1mWvu5DRQhU3hCLDsa9NRX7riF3LFGAV2EiAhMtPXzrZ6R1
         7MpH998IW0O8b4N4wTvDgUzxN3iAMrGGXhYpBXjx1v6KQA4Utct/pKaj6913i0qXQMTW
         my4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+b8qan40UDvOqnjobi8hvnCyFuCIZEZIWVuNZ7C/vVU=;
        b=KbMyXYc2HG7MtDnUvR3j8EMTeHucVYfduCOGJunMpXJv1rcyr+Ilp0LkIrWWT9YFJ5
         UiepACqxeOtzk88iIyGwjyfnhNvaUiy2Gaj5ZLjqKbsMKdqwQT63CwqGG4y5sanWrDbK
         N//XPN8hD71O3sknBC17il0vkcfTazBwatOLnLCAnSgecylo8UGkkFipeuesJxhpYD1K
         pl+S416zar02QxdcD670KdiGoCHwj0lu9CvKqh0ghN1HsuLVGi/8/7Vn/TyCwVEOOvyY
         ZXcVBz+QL99R1OSfBMblpRXZMxx3PUEMrllK6AQvsapQy6030Zh9bpl0jcyx58IUJaAT
         stzw==
X-Gm-Message-State: AOAM531jwuAOXa1o32+TY0HlUmJp7QWd2n4Bk324kEesKGFtFEc950tJ
	F6oSofu6Q5Fz7temHXNg1wNqCaVTEvj8Jios4g7HV/wVrsU=
X-Google-Smtp-Source: 
 ABdhPJzyZlF3pwuMLd213gHYrw84Me7tQjV/6bF0eqI8D1Q5xbp75fi67SL+suZESjfV8QWINfnJ48plcHVGMC09uxY=
X-Received: by 2002:a17:903:2444:b0:15d:281d:87 with SMTP id
 l4-20020a170903244400b0015d281d0087mr20110940pls.9.1651213388016; Thu, 28 Apr
 2022 23:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220428122848.3941460-1-sumit.garg@linaro.org>
 <20220428140001.GM9834@denix.org> <Ymrk9HYsLWJjeerC@kudzu.us>
 <20220428191630.GN9834@denix.org>
In-Reply-To: <20220428191630.GN9834@denix.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 29 Apr 2022 11:52:52 +0530
Message-ID: 
 <CAFA6WYPG74StqE1xZ9rscRebXC4cvtdjwPe=FfT_k7TyCsg1iw@mail.gmail.com>
Subject: Re: [PATCH 1/2] external-arm-toolchain-versions: Use ldd to get libc
 version
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org,
 jon.mason@arm.com,
	ross.burton@arm.com, daniel.thompson@linaro.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Apr 2022 06:23:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3331

On Fri, 29 Apr 2022 at 00:46, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Apr 28, 2022 at 03:03:16PM -0400, Jon Mason wrote:
> > Sumit,
> > It passes my CI.  Can you answer Denys's question below?
> >
> > WE're going to cut the branch tomorrow, and I'd really like to get
> > this in.  However, if it's not ready, we'll push it to the next
> > release.
> >
> > Thanks,
> > Jon
> >
> > On Thu, Apr 28, 2022 at 10:00:01AM -0400, Denys Dmytriyenko wrote:
> > > On Thu, Apr 28, 2022 at 05:58:47PM +0530, Sumit Garg wrote:
> > > > Arm GCC 11.2 binary release has moved away from keeping libc library
> > > > versioning info as libc-{EAT_VER_LIBC}.so. So rather switch to
> > > > retrieving libc version by parsing output from "$ ldd --version".
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > ---
> > > >  .../external-arm-toolchain-versions.inc       | 43 ++++++++-----------
> > > >  1 file changed, 17 insertions(+), 26 deletions(-)
> > > >
> > > > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > > index a89f2f0..388987a 100644
> > > > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > > @@ -50,37 +50,28 @@ def eat_get_gcc_version(d):
> > > >
> > > >  def eat_get_libc_version(d):
> > > >      import os,bb
> > > > +    import subprocess
> > > > +
> > > >      syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
> > > >      if not syspath:
> > > >          return 'UNKNOWN'
> > > >
> > > > -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> > > > -
> > > > -    if os.path.exists(libpath):
> > > > -        for file in os.listdir(libpath):
> > > > -            if file.find('libc-') == 0:
> > > > -                return file[5:-3]
> > > > -
> > > > -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
> > > > -
> > > > -    if os.path.exists(libpath):
> > > > -        for file in os.listdir(libpath):
> > > > -            if file.find('libc-') == 0:
> > > > -                return file[5:-3]
> > > > -
> > > > -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> > > > -
> > > > -    if os.path.exists(libpath):
> > > > -        for file in os.listdir(libpath):
> > > > -            if file.find('libc-') == 0:
> > > > -                return file[5:-3]
> > > > -
> > > > -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
> > > > +    topdir = d.getVar('TOPDIR', True)
> > > > +    lddpath = syspath + '/libc/usr/bin/ldd'
> > > > +
> > > > +    if os.path.exists(lddpath):
> > > > +        cmd1 = 'sed -i -e \'s#/usr/bin/bash#/bin/bash#\' ' + lddpath
>
> Running an executable from a target sysroot is also questionable, but since
> it's a shell script and only used to print the version, is probably Ok.
>

Yeah this was the sanest way I could find to retrieve libc version
that will work for all binary toolchain releases.

>
> > > Are you trying to sed-in-place ldd executable, which is relative to
> > > ${EXTERNAL_TOOLCHAIN} that can be installed system-wide w/o necessary
> > > permissions?
>

Ah, you are right there could be a permissions issue.

> The way to bypass the bad shebang is to call the interpreter directly (and
> it's not bash specific, so /bin/sh should work):
>
> $ /bin/sh $syspath/libc/usr/bin/ldd --version
>

Will use this instead in v2.

> In previous releases, ldd came with even more weird shebang, e.g.:
>
> #! /arm/tools/gnu/bash/4.2/rhe6-x86_64/bin/bash
>
> All that gets corrected in do_install() of external-arm-toolchain.bb anyway.
>

Yeah.

-Sumit

>
> > > > +        cmd2 = lddpath + ' --version'
> > > > +        try:
> > > > +            stdout, stderr = bb.process.run(cmd1, cwd=topdir, stderr=subprocess.PIPE)
> > > > +            stdout, stderr = bb.process.run(cmd2, cwd=topdir, stderr=subprocess.PIPE)
> > > > +        except bb.process.CmdError as exc:
> > > > +            bb.error('Failed to obtain external Arm libc version: %s' % exc)
> > > > +            return 'UNKNOWN'
> > > > +        else:
> > > > +            first_line = stdout.splitlines()[0]
> > > > +            return first_line.split()[2]
> > > >
> > > > -    if os.path.exists(libpath):
> > > > -        for file in os.listdir(libpath):
> > > > -            if file.find('libc-') == 0:
> > > > -                return file[5:-3]
> > > >      return 'UNKNOWN'
> > > >
> > > >  def eat_get_kernel_version(d):
> > > > --
> > > > 2.17.1
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

