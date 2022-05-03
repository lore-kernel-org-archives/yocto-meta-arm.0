Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55797C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:54:45 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.892.1651593275531290623
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZyhMfB0Z;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id y6so11822753qke.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q93JI9kGEtWAH8Vl7rzA16s3HMLzXu0/K5medGQslRg=;
        b=ZyhMfB0ZAUSA6nXMSekTU/NWJTDF2HyDKS5CdrzG+dwsnVbZE48YGADnUH+YBHZWiR
         V+HXgXyAJs38b3vyju0c4lkDsKyKQh25hl2/rY+eCzjGxgiJ9Dafl6LE4l1oPIzDz1qb
         ke18/gdwvdgY27Xbx/M8/JV8UMPnFnlAi5wqyJKsAKBcANeAqk4vK5fffy8ex6TMrieS
         PKv+czXHs5fcu6MXQrcF+ROUc2z603kPzp4GGwgYkwmrjPv9ZSuHTvU24CVX9iDNmJLP
         DdNOyUiBZxBZE9NqgRXZjO5eSwz02WqEsfchsIVB0FR2tqwFTSVHRLKTTH39kW+FLnfN
         OOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q93JI9kGEtWAH8Vl7rzA16s3HMLzXu0/K5medGQslRg=;
        b=BIomRITE22gYZ9sDNHQHmvEir6IpcCrDfiXYITJl6zkPNjr+uTAf0mPUWmQQqrHpHx
         YaCG542Q36uZb6bxd85YpmM9qhSPSRlNuT2GSl1yJV8zfZLH/IE73Mvl5ABHfStqIkDp
         cIbEuz810dtiQXWUm/mHwiQMsnMgNWC5RZzikxwHanaApip6EbR53NondP+F2YSxMfTW
         hyIMYISFsmiCRI4mS/gG+mIHhvL1jvRTYEH6UBIyDQKQHWlkgbjXYoilT/vdMfUyOUp6
         2CI3jXvA44sjW9IhqV+c4wn1enCv+oToKSfY98RpCTHgmcoVD+yKTFVRcl+xalWSczdd
         H09g==
X-Gm-Message-State: AOAM531mObXYnlj2/p4M3wyFr/eGVsl0N/E1rrJHOxmCoSG2OR0EWceB
	dQB2+bMnJoQVEf4PqQkmRMO+hRROddDyJn0lIRI=
X-Google-Smtp-Source: 
 ABdhPJzgVjTI53sb7H4z6S2ovg1mei7m3noD39yt1xc69uFj2s2blpq1+R2xuOV6ANUMzLWdGMEYPLGRzPCJ1ZZIqhY=
X-Received: by 2002:a37:b51:0:b0:69f:c378:e1e1 with SMTP id
 78-20020a370b51000000b0069fc378e1e1mr11597525qkl.180.1651593274526; Tue, 03
 May 2022 08:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220501184731.3730441-1-raj.khem@gmail.com>
 <YnEo7I/HCeTzmtBY@kudzu.us>
 <CAMKF1sqk4PSVJJsc-5d=Csf+fPNHjh=k+8ZDw0OzmHHkPiXOaA@mail.gmail.com>
 <20220503152148.GW9834@denix.org>
In-Reply-To: <20220503152148.GW9834@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 08:54:07 -0700
Message-ID: 
 <CAMKF1so2ZE57b07KZeHeogwBv=LOjFfS+puYpqcna=RFu_B=hg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 15:54:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3344

On Tue, May 3, 2022 at 8:21 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, May 03, 2022 at 07:48:20AM -0700, Khem Raj wrote:
> > On Tue, May 3, 2022 at 6:06 AM Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Sun, May 01, 2022 at 11:47:31AM -0700, Khem Raj wrote:
> > > > The module can not be compiled without patching kernel 5.10
> > > > This helps meta-ti to live in multi-BSP envs
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > > > index 4051c34..a4dd38c 100644
> > > > --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > > > +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > > > @@ -27,6 +27,7 @@ do_install:append() {
> > > >  }
> > > >
> > > >  COMPATIBLE_HOST = "(arm|aarch64).*-linux"
> > > > +COMPATIBLE_HOST:ti-soc = "null"
> > >
> > > Shouldn't this live in meta-ti?
> >
> > yeah perhaps better there.
>
> If the kernel requires patching to use this module from meta-arm, shouldn't
> meta-arm set a bit stricter COMPATIBLE_HOST? How are other BSPs supposed to
> work along with meta-arm?

I think meta-arm is a base dependency of meta-ti not other way around,
so in this case I think its better to fix
in meta-ti, since meta-ti is not using the kernel that meta-arm tests
so this layer has no control over things downstream
layers do.

>
>
> > > >  # Kernel modules currently RDEPEND on the kernel, which is troublesome when you want to put a
> > > >  # kernel module into a initramfs without pulling the kernel into the initramfs, which would be
> > > > --
> > > > 2.36.0
> > > >
> > > >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

