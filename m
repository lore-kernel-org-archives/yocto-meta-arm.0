Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.9777.1594880085152818483
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jul 2020 23:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20150623.gappssmtp.com header.s=20150623 header.b=cSTaZF5Q;
 spf=pass (domain: baylibre.com, ip: 209.85.166.193, mailfrom: fparent@baylibre.com)
Received: by mail-il1-f193.google.com with SMTP id e18so4083364ilr.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jul 2020 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Yi6drgxKY0UJqEoAEx+e4MMojNen1zleePApbxc8jM=;
        b=cSTaZF5QQXk7JCC+oFuypqF8fYIjjCDk9GSltJbKje4hLGLRyZNia8YDz38mY8fKbc
         XpjbXMZ1lheaWukGWT6phqVQIGZqYIPWeNQH/qbHuYE2IrbGeM5fgSzVd5ZKBKHGE6n5
         bmIdotbe51DOXLM23qSAtGamsUBT43n9cW3ss7Iryuhyq7hEiAlELiDFYNVE5Q3n+FfS
         11BMrdvLZrFGG/9rPCuKeDYABQHoYrxHso0E+dtJbvV4Y1I7iQpVZF30x4tA+5VyA+5H
         jFSjSfODTKFz7c1JZWzOz+z03c8zh0bYUtg9ZnBTsjbEjA9vehAPZPgLoA2xep/5BO/x
         f3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Yi6drgxKY0UJqEoAEx+e4MMojNen1zleePApbxc8jM=;
        b=t4/wUcxr2EjaS9gaHiulEsZuS0+gZgux6gfylqo3S2siruOjuy9h9zyQOy99nO/wbR
         zF2lVzX9Jt0hfCzhkiYc+UVURdgJrz61gD4ZKMzcw5WFQXMNsvqvXhLXiDw7Qx0hDZRv
         lybECKU/O8CpApWr5SxsZ02cADJWuIAfN/OVfWYilGG/7LqWFcKc1VMIlTxJe3fzuHr0
         t1tUOwhv/adyms35nlQFeVXbimX0ZXBAJ9yJSdKfBgJGnOCmt2KIeEgTFh0rOFYF0cH5
         Rcmc8scog6l0m7nEwxfB89qOKQmGjRTyTMKwCOpq1AAh4K9QM4SZXI9IIujM+wsAjTp9
         dMMA==
X-Gm-Message-State: AOAM530BB3BD5E8YVTZzBejZvnearGyLIUVVcsa0BXcmtYqtBXSmCMXn
	5hctGgyvkgnB0IlP1U2ZHeRvtxZbEvn83uxFhPyHQQ==
X-Google-Smtp-Source: ABdhPJx9u8468V1x/fG2dgGHQYolXxTDnmWJrIGmkLrsY9ogd10LGQwfSzQHdkwXf5GsCS7P/NmoDCExn4mRwyaIm5A=
X-Received: by 2002:a92:7949:: with SMTP id u70mr3200482ilc.88.1594880084325;
 Wed, 15 Jul 2020 23:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200622071401.2570-1-gabor.abonyi@arm.com> <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org> <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org> <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
 <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
 <20200701180840.GT17660@denix.org> <CAAnfSTu3YvnOKHug6ifScDHSYQBPhVEkd7FAY4EN0xwot=6LsA@mail.gmail.com>
 <20200702153948.GB21456@kudzu.us>
In-Reply-To: <20200702153948.GB21456@kudzu.us>
From: "Fabien Parent" <fparent@baylibre.com>
Date: Thu, 16 Jul 2020 08:14:33 +0200
Message-ID: <CAOwMV_wBTPWEz=c_8SnLo4uf5x9vFu4vyfSJEwkFEToU2Fxp0A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
To: Jon Mason <jdmason@kudzu.us>
Cc: Ross Burton <ross@burtonini.com>, Denys Dmytriyenko <denis@denix.org>, 
	Gabor Abonyi <Gabor.Abonyi@arm.com>, "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using meta-arm for the OP-TEE recipe (and soon I will replace our
TF-A recipe to be based on the one from meta-arm). I just discovered
this change today by receiving multiple report of the following error
when trying to build an image based on our layer:
    ERROR: Layer 'meta-arm' depends on layer 'arm-toolchain', but this
layer is not enabled in your configuration
    Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Usually the stable branches (dunfell in this case) don't add change
that could break other people's setup like adding a new hard
dependency. Most of the time the changes are bug-fixes, or minor
upgrades to packages.

Shall I consider meta-arm to not follow this rule, and in order to
never have breakage, pull a specific commit hash instead of pulling
the current release branch?

Thanks,
Fabien

On Thu, Jul 2, 2020 at 5:39 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, Jul 02, 2020 at 10:14:55AM +0100, Ross Burton wrote:
> > On Wed, 1 Jul 2020 at 19:08, Denys Dmytriyenko <denis@denix.org> wrote:
> > > meta-arm is meant to be a central place for shared components to be used by
> > > other BSPs. Kind of a community layer, if you like. And arm-toolchain is kind
> > > of a special layer and may not be desirable by all BSPs, so that would reduce
> > > overall usefulness of meta-arm layer. Each individual BSP (and meta-arm-bsp is
> > > one of those) is free to depend on arm-toolchain layer directly, if needed.
> >
> > Arguably, tfm should be in meta-arm for the same reasons that tfa is:
> > it's a shared component and not specific to a single BSP.
> >
> > The need for a binary toolchain is not ideal but simply adding the
> > layer doesn't cause it to be used by all recipes.  I propose that we
> > add this series now and evaluate the use of multiconfig to build a
> > second cross compiler in the future (sooner rather than later).
>
> To be clear, this is not a perminent requirement.  I would LOVE for it
> to be removed, and I am hoping it will be done within the next month
> or so.  IMHO, having TF-M available with this detriment is superior to
> not having it due to this issue.
>
> If this is a dealbreaker, please let me know.
>
> Thanks,
> Jon
>
> >
> > Ross
> 
