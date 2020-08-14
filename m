Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.18431.1597413760859295273
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 07:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Yu3h28/K;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id f26so10020630ljc.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Aug 2020 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdtntQ8EPpn8SPGolv3K1m8aBTh+1KIKScctgLlq4XU=;
        b=Yu3h28/K7ol0Hsr4lX70rv40+3W05P5lNB+OwK3AndBzLJd1d5UZUn7ChxmX3y4XKL
         2Ft3KhLbDzL5V/1R9jklu3p4gHmU4i0sh0thhApvVGdyr/jOvd+WEbXRRZQIGXsmRQ+j
         3wd5ZtjEi8V2jCyHPwYB6smNUebnGyp7dJvFIwtQTmD/e3P/63aTqUvn7teUHLrR1Q+/
         ze3iOjpSWNS3qSdxUVW/7y4NibE3caQERrWLVfdQ9DZ4rfYN3WoTktbz1qvhwtJajKOo
         G1rovhFheuLUIoLSIx6uuv5wzXLo1jvSG2xLsmRZGgmSh/yOUlDy5aq4wFHL5mk8ur2W
         uE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdtntQ8EPpn8SPGolv3K1m8aBTh+1KIKScctgLlq4XU=;
        b=pYrEnjB8NH0eTY+cUIaQvls8zjE6QtdxhSTSjrY+hGy7aGkTisr3z8QOhmuUmff3bL
         fO46EViKpkodAgDxaSELE3rDryR62JfvYnB/+Hd5PJJfx2FXZDX0TxbhvSm95rIpJ4PH
         UZv0XSfy+LwOJlGn/Y2VBgLxykKeK4frJqaQdhrF/ffmSmbYF12O1uboelbw8AEZkSeD
         0Xz+XM4iA9eNLwZwIeHNc/YoYiza/0H/SBoUdbd7rwlHM2+4+ymiL9ynaxK6TLuyK6eC
         HCsKyf2k0WaBg7/JfQXljrXEaBJl+qDbMAvcvY+0lR9ZmuVT2fkyCn08hfaMsJrisWWo
         0cvA==
X-Gm-Message-State: AOAM533gAFvaI2Kc1AUhCxgnLsgH6UwHIT4SfDPeUz2B11FTSTXZKReG
	2Bc5cvFZviH5y8TTPPp2FwKmABdP4KVWGu0aBCki7w==
X-Google-Smtp-Source: ABdhPJz+yudM8Van89JJ53NMSLfuZSCzKZ7iCuswINd7t5aLb7zYtJM3qRT9sytRhsc8agKmV9XeGvwgOuaWAgK5Id8=
X-Received: by 2002:a2e:9550:: with SMTP id t16mr1308300ljh.372.1597413758470;
 Fri, 14 Aug 2020 07:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org>
 <1592526937-38479-2-git-send-email-denis@denix.org> <CAFA6WYPhPiuTKaQ59J2Qag6JeWA8S7y6sZn3UtqboEDdaAB78g@mail.gmail.com>
 <CAAnfSTtTa7+mnSmNkqTXGJWiKwJgT-jsUTR8JSugk1w0q+j07w@mail.gmail.com>
In-Reply-To: <CAAnfSTtTa7+mnSmNkqTXGJWiKwJgT-jsUTR8JSugk1w0q+j07w@mail.gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 14 Aug 2020 19:32:26 +0530
Message-ID: <CAFA6WYPO87MVyvDvASnCNdMLqda5eE+-NW3KfwYHQtwbFk32Yw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 1/5] external-arm-toolchain-versions: also collect binutils/bfd version
To: Ross Burton <ross@burtonini.com>, Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

On Fri, 14 Aug 2020 at 19:15, Ross Burton <ross@burtonini.com> wrote:
>
> These patches fell through the cracks.  It looks like patches
> one/two/three were reviewed by Sumit and are good to go but four/five
> need some more work.  Unless anyone NAKs in the next 24 hours we'll
> merge the first three and wait on another iteration of the last two.

Yes it's fine with me to go ahead with the first 3 patches and I think
it's minor rework required for patch #4 and we can drop patch #5.

If it's fine with Denys, I can repost patch #4 as well with minor
fixup and we can have this feature incorporated upstream.

-Sumit

>
> Cheers,
> Ross
>
> On Tue, 23 Jun 2020 at 12:38, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > To be used by SDK packaging for binutils cross.
> > >
> > > This code is upstreamed from meta-arago layer.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../conf/distro/include/external-arm-toolchain-versions.inc    | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> >
> > Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > index 5c40af2..a89f2f0 100644
> > > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > @@ -117,6 +117,15 @@ def eat_get_gdb_version(d):
> > >          first_line = stdout.splitlines()[0]
> > >          return first_line.split()[-1]
> > >
> > > +def eat_get_bfd_version(d):
> > > +    try:
> > > +        stdout, stderr = eat_run(d, 'as', '--version')
> > > +    except bb.process.CmdError:
> > > +        return 'UNKNOWN'
> > > +    else:
> > > +        first_line = stdout.splitlines()[0]
> > > +        return first_line.split()[-1]
> > > +
> > >  python external_arm_toolchain_version_handler () {
> > >      if not isinstance(e, bb.event.ConfigParsed):
> > >          return
> > > @@ -129,5 +138,6 @@ python external_arm_toolchain_version_handler () {
> > >      d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
> > >      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
> > >      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> > > +    d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> > >  }
> > >  addhandler external_arm_toolchain_version_handler
> > > --
> > > 2.7.4
> > >
> > >
> > 
