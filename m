Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.18077.1597412704738056291
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 06:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=kQ9xV+YG;
 spf=pass (domain: burtonini.com, ip: 209.85.167.66, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f66.google.com with SMTP id i19so4843056lfj.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Aug 2020 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVDSOKH4wXwr01PFVYDbgKP9RPMBwgnF9TnJy5fdwR4=;
        b=kQ9xV+YGCrHJJx6gJOMTjSAWPcLtCoEfCf7lgFEr9LlzD+QyYEeDPVLBdTGa22KGfM
         nDsxPRDsgtlHOQaZQBCiPX5+6i40SSXQZIpSAWmvRkQiocw1rQ0964Rzw1d/Ggg6wg/o
         h09g/sLcXy82ZeC1LyYlh8TjdmDWG/KZVc+8EQD5kdDQCFJssTMWLdIenCzhiy7VeXXH
         3xYyeKWMo0Xsr0u3reyx8jDE6jVfp95SXrBqHnPuTcu7v554QQHXFtv//HhTsjP7AkkM
         O7U0b5Ll/DKc4ISbLC74b7c3JqHzPAsURTXiYrsFfQw1RqEp3aWZ0NS/C37SMcwMwtIU
         dSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVDSOKH4wXwr01PFVYDbgKP9RPMBwgnF9TnJy5fdwR4=;
        b=bP22SdIx9D5O61wEkfNbhI+r/r1LT6A1lReC97cFGBAE+oi6oon8Ht3II2P0tw1WR0
         oV2/0bJj3PMjsNZ0PF2ng/MvkOUr5ZHo9HNPuJQejXEfwfSs3W05lQoU+Ef8Ov0yO7zM
         ohReUV0LxtZAXnUZ/Gg/WK8L9D/v1A6G0y3s/SMgRtjltsKnVSmv/9mb4/iiUDrMU8ue
         xPxqt2MAayuFVsmRntFmrZweLxWsi60/AuUWhj8foOUCEoIR2gaQaTIkTo/SOdObReuS
         GTXE9Qi0Vh6Rzbac//xBl7KieibzXuFpIaXm16nyZ4DiGcT+UOLLMQPKeHpLAVUZ8aU3
         7lhA==
X-Gm-Message-State: AOAM530YQQTs6hWEB4U9QvoexM4tkGG1CrhlNX50JUqf5SMsHGgvE0to
	VZUlqHdxKHOuYe0wih0RZ9XPu24dlBSQMz6Up8Hk0Q==
X-Google-Smtp-Source: ABdhPJwRii/xkyGA9P/e7PqoMKbTdaZAQs7604lIab6axLWaCwvJKdCKUTzskWpY4v8zTFgYsLXxwxR2hRCEwJkM9k4=
X-Received: by 2002:ac2:5548:: with SMTP id l8mr1267311lfk.39.1597412702456;
 Fri, 14 Aug 2020 06:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org>
 <1592526937-38479-2-git-send-email-denis@denix.org> <CAFA6WYPhPiuTKaQ59J2Qag6JeWA8S7y6sZn3UtqboEDdaAB78g@mail.gmail.com>
In-Reply-To: <CAFA6WYPhPiuTKaQ59J2Qag6JeWA8S7y6sZn3UtqboEDdaAB78g@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 14 Aug 2020 14:44:51 +0100
Message-ID: <CAAnfSTtTa7+mnSmNkqTXGJWiKwJgT-jsUTR8JSugk1w0q+j07w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 1/5] external-arm-toolchain-versions: also collect binutils/bfd version
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

These patches fell through the cracks.  It looks like patches
one/two/three were reviewed by Sumit and are good to go but four/five
need some more work.  Unless anyone NAKs in the next 24 hours we'll
merge the first three and wait on another iteration of the last two.

Cheers,
Ross

On Tue, 23 Jun 2020 at 12:38, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > To be used by SDK packaging for binutils cross.
> >
> > This code is upstreamed from meta-arago layer.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../conf/distro/include/external-arm-toolchain-versions.inc    | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
>
> > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > index 5c40af2..a89f2f0 100644
> > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > @@ -117,6 +117,15 @@ def eat_get_gdb_version(d):
> >          first_line = stdout.splitlines()[0]
> >          return first_line.split()[-1]
> >
> > +def eat_get_bfd_version(d):
> > +    try:
> > +        stdout, stderr = eat_run(d, 'as', '--version')
> > +    except bb.process.CmdError:
> > +        return 'UNKNOWN'
> > +    else:
> > +        first_line = stdout.splitlines()[0]
> > +        return first_line.split()[-1]
> > +
> >  python external_arm_toolchain_version_handler () {
> >      if not isinstance(e, bb.event.ConfigParsed):
> >          return
> > @@ -129,5 +138,6 @@ python external_arm_toolchain_version_handler () {
> >      d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
> >      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
> >      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> > +    d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> >  }
> >  addhandler external_arm_toolchain_version_handler
> > --
> > 2.7.4
> >
> >
> 
