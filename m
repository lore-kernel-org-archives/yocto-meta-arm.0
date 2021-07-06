Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.5124.1625572957618962558
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 05:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Tdv0uoky;
 spf=pass (domain: burtonini.com, ip: 209.85.128.48, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f48.google.com with SMTP id b14-20020a1c1b0e0000b02901fc3a62af78so1515601wmb.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Jul 2021 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fZAB4/BPe4U8IMWcIdDRG4qvQxREnStT0bWVwVc5GAM=;
        b=Tdv0uokyP6SRMj3soySHYMAb2kMVRwnUGOKuoi16y1KEDTSjerBa/eR413ZEHqmQqJ
         LV5HpMAymprMSpyEiA3U4ycGj/oY0Jh5yEc1mrtUJL5SL3LOZOO7twePnizMY/khNyJa
         rOu2NaPdrYkp3qoG6fASQ85ruus1Sjk1IqzMC9+yCfXWy/qUQ0CA1etWinDhdHUTO4ox
         i/StL4M0Cujfxga8tOofwBTC1FTSWDbsR8p5dVX1SoI5+FmlgWO+oAAmFvpiXHv+cioN
         D4fKVL5NmlpsXfOI+AsyX4yxcYrCtNmNOfMh6mnuayHQUW1hgAVtXUSLUKFAvfNFBAjc
         bqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fZAB4/BPe4U8IMWcIdDRG4qvQxREnStT0bWVwVc5GAM=;
        b=N7hozUg5gq9XowRut9TgfGUkwe0ErhHuOr4TebkTyTpjLiwVdZ1KG7wVIwBn3+nB/v
         c1QBiVQ69txpxpw2of1gTfN/GhUj0kzIQW00oWStr1mLMn1Le9R9RKgwF9TmMAQW44r7
         PVg5PbNww7+wFDlrJXEEGLBgAE7DAbIyF9K/IOacR9KfohXcusLHz2rabpYaMxKh4AVo
         T4DBxbBYlgrKkw8cQjmMkx9/bF29auj8dOazn4cy5CQh2zVrWUnzrBUT9XnBO5Wrwd4J
         TniIXqYSnDD1i/ahJ6OkxlvzSH4lv/+JFtWaaC+2lDA0UfP2qlp8NEzCNbcD6eF97yhD
         wtEg==
X-Gm-Message-State: AOAM530dirN8c5O7eAJcFdnrJm5FL7zfcbX1RLfkDvrq30ZsGQEKuY/Y
	L/WyizfN7aGRwSCRFJ9mR94WR70GZxBlk4RkDh1E/6bwU94vtEdf
X-Google-Smtp-Source: ABdhPJyYrvIRtih9fLgVKovEYXE7lPzybPf2yy4xXgVxiy2qdokFPb+IFhtGrtdCO49ixTk/dL2haqFNTKQsdmfgJPg=
X-Received: by 2002:a05:600c:1d28:: with SMTP id l40mr4180201wms.130.1625569361354;
 Tue, 06 Jul 2021 04:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210705141651.25564-1-ben.horgan@arm.com> <20210705190052.GN1528@denix.org>
In-Reply-To: <20210705190052.GN1528@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 6 Jul 2021 12:02:30 +0100
Message-ID: <CAAnfSTv1EG9NcCcrwg-5j=z-7qzudpY_ekLmhS6PGdytpz6AAQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license checksum on x86_64 host
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ben Horgan <ben.horgan@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

The checksum wasn't updated correctly when the recipe was upgraded.
We also don't exercise this recipe in the CI and nobody else has tried
to use it.

I just discovered that the arm64 build is also broken, so this needs a
v2 with fdf39a58ab6e893f3d83594cef77fa05 as the aarch64 checksum.

Ross

On Mon, 5 Jul 2021 at 20:01, Denys Dmytriyenko <denis@denix.org> wrote:
>
> What is the reason for the change?
>
>
> On Mon, Jul 05, 2021 at 03:16:51PM +0100, Ben Horgan wrote:
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > ---
> >  .../external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> > index 5cbab9e..4599831 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> > @@ -10,7 +10,7 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> >
> >  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> >  LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=1b548d9c341b3b5c82bc88551964aa60"
> > -LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
> > +LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> >
> >  PROVIDES = "virtual/aarch64-none-elf-gcc"
> >
> > --
> > 2.17.1
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
> 
>
