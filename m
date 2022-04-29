Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73800C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:30:55 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.7002.1651213846749530779
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fLic8t9y;
 spf=pass (domain: linaro.org, ip: 209.85.215.169,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f169.google.com with SMTP id r83so5823480pgr.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dtl7kfpxpg8CUzcrYnFsiHLhmqiK9/HyiPZKI0+HwNQ=;
        b=fLic8t9ylrqTYfyPiE4C0aVSWsL1TBarw16gUMs+ocKtuaRv67nbmrdFQUB4BM3WBx
         A/zs2eR5owIHocQacL2F1ojV8NpqOOldnGG6/aI339xDS8DtK1zItXY/ALrrDM0eoAt7
         oRor8iz49eiE/4mhRRw0EzP/ufbpyLhPPdtTRAdPJhXaceL7vUTTD2/pCIO2i33EiSZh
         XgLkhZ86i6u/Ddkd9xHeCLod8/4UfKUM7H2KDqiB/U9x61vLt4rajgHyeQ09NyqSvl2E
         Xiqi29Ie2STNzKORNf31IanMFUl+B70Vr29vma+kwFir5UwkUUoDjgn7J2vQHBqnz3yh
         NTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dtl7kfpxpg8CUzcrYnFsiHLhmqiK9/HyiPZKI0+HwNQ=;
        b=RHJPkgU5W4lvOgt+5bbivssiaZTpQSWsX8tcqADM1OrdQOl+ui9eJvdxo1OEJ/+j4b
         WXJHtLhkhZ0nijiK4PVRvo1kdqMuZBV8F7WI321x421srIi9LcdUFt52So7GU6UiKa+g
         T0Qv51AQpOrfAaeWPHZjmSKYdXU8jMq8MQSJQiRNIYxO4Fp/hyPX6GDJsoCYlVtBYQem
         I/UU6oFxcVhTFfvnN4wIVTi5FYT6aaUNMZAnC8SFNxxyPTo6kseHRSK42Z1/QXNqRhrA
         F0o2+ZLTZ5CsXETRvlJklUvnTL15Tdr2QZj/oWxfPQ8GetimSoE42CJbm8+RYUqHDijl
         piSg==
X-Gm-Message-State: AOAM532qMpNR+Ko08sGPF+wVzHBattcPnp2F0GW7gHUSPqu1sZGx4ojp
	A2//H7RgKFOuYAog4Bng3I/0LwJPH9gVbWE80soE8Q==
X-Google-Smtp-Source: 
 ABdhPJzK/jhlAeqGeYjVYg4grnXowY4iELm1eDDpPa6Rn7DNXd/bDHX/ZoLrlkLfnFTMU586D6cLX+nq1JSj39O5f6I=
X-Received: by 2002:a63:ad4d:0:b0:378:4b82:b881 with SMTP id
 y13-20020a63ad4d000000b003784b82b881mr31902856pgo.282.1651213846219; Thu, 28
 Apr 2022 23:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220428122848.3941460-1-sumit.garg@linaro.org>
 <20220428140001.GM9834@denix.org> <Ymrk9HYsLWJjeerC@kudzu.us>
In-Reply-To: <Ymrk9HYsLWJjeerC@kudzu.us>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 29 Apr 2022 12:00:33 +0530
Message-ID: 
 <CAFA6WYPCEv9xcEM-GoLrXYHb1ZqXeT0XgQMowuaGpgGVs6Girg@mail.gmail.com>
Subject: Re: [PATCH 1/2] external-arm-toolchain-versions: Use ldd to get libc
 version
To: Jon Mason <jdmason@kudzu.us>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org,
 jon.mason@arm.com,
	ross.burton@arm.com, daniel.thompson@linaro.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Apr 2022 06:30:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3332

Hi Jon,

On Fri, 29 Apr 2022 at 00:33, Jon Mason <jdmason@kudzu.us> wrote:
>
> Sumit,
> It passes my CI.  Can you answer Denys's question below?
>

I have incorporated Denys's suggestion in v2.

> WE're going to cut the branch tomorrow, and I'd really like to get
> this in.  However, if it's not ready, we'll push it to the next
> release.

I think v2 should be ready to go in. I have tested different poky
build combinations using gcc11 and gcc10 binary releases for Arm 32bit
and 64bit Qemu targets.

-Sumit

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
> >
> > Are you trying to sed-in-place ldd executable, which is relative to
> > ${EXTERNAL_TOOLCHAIN} that can be installed system-wide w/o necessary
> > permissions?
> >
> >
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
> > >
> >
> > --
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> >

