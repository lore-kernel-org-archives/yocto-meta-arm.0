Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.2041.1586822152778043242
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 16:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lksZ/hV/;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id s30so8770713qth.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Apr 2020 16:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXanqfwV2wxEaQiSut+95dkHe/2NOqkEpA5x/G9I2CU=;
        b=lksZ/hV/QJ2K/Lz8CJr8p6iTFxtwsM5CPKm5sdv2WcRQ2oDQzhc6Ie8LCrYczPBE6L
         yj1wZxj3I2UxkOUyD60Gig3qUDW3AxUI0tGBDhQ3gSzstxs4TD+JWa3Vl8SfYM0Mqv9l
         75Kszo22mEbPWt6ZeEFa9PIbHjs+F9xb2iOt5nwMhvsQxbFAhUfYdTXgMkKtPBhVaD4X
         vurWxIpGWRnbADYKFKQFuZVvrqdfG37TerOIJ7KBvYuSKnHbtMnKPshCrLFqViTXcEpL
         CLwITpu5VZ/SBATuHi+FZLehu9xyoEFR2ShFUILzy8QCwgYDmAnbY9KIua9X8arEL/xg
         75RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXanqfwV2wxEaQiSut+95dkHe/2NOqkEpA5x/G9I2CU=;
        b=q3GZFUCYR5qRIl0p1X6eZPAwzPx4h2W74IQMq4RPRIVsJ4HTX05mDjM5IU29zkpzZn
         fE1nBhavNnzyGT9A572bZl/QTezIRXfKvllbqiZh8Ef7JIvmil/k2g22Ye0spsN18/eC
         H8FCoqa8App4kWYlMTE5gGES6/O6URQ4LlMEV71gF6eLkl6IrhNQZ7yYpfANML7FT1HT
         DtHnPRZxiT0zU1DDihgRiVUdForcIfIhBuCgzHVguz/jyABRNjPEwcoHOB57XohWRRif
         nIsBHue+FKsJpjiUUP3Ac4eEKaf8jbw6EFz2tif3G0ynpTw42yPgnt8CW6MknFO+J9iI
         T7Dw==
X-Gm-Message-State: AGi0Pua+F5jhl6sh7V0pd8qLxo0SLDkF/b1dLckNe6Rrr8Ia6Qht2QQS
	QB7EGjAqlrc9FN/+2/eiQ3dXscUXhb2BH12qfGHHL3qa
X-Google-Smtp-Source: APiQypI4LzlHZxnSAVr1QTGkACfwiPIA6zQXPEj6Kqp+MHQcHdmyp+wxtrIZV72BOBchtoVPcwAG8jCkePvk7DTActo=
X-Received: by 2002:ac8:4e92:: with SMTP id 18mr7489419qtp.316.1586822151745;
 Mon, 13 Apr 2020 16:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200412054531.1804159-1-raj.khem@gmail.com> <20200413220519.GD30105@kudzu.us>
 <16058061C39D13E2.17445@lists.yoctoproject.org> <20200413224013.GB11927@denix.org>
In-Reply-To: <20200413224013.GB11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 13 Apr 2020 16:55:25 -0700
Message-ID: <CAMKF1soD3EJLe4tLfH-t8ovh0rMc5T4hAy+862aeGr_cRU1uww@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 13, 2020 at 3:40 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Apr 13, 2020 at 06:06:37PM -0400, Denys Dmytriyenko wrote:
> > On Mon, Apr 13, 2020 at 06:05:19PM -0400, Jon Mason wrote:
> > > On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> > > > all arm SOCs may not support optee and there are non-arm machines too
> > > > this makes this recipe fit into mutli-BSP environments, platforms which
> > > > support optee should be specifically called out via COMPATIBLE_MACHINE,
> > > > for general case it remains 'null'
> > >
> > > Pulled into the master branch.
> >
> > I think this was due to the parsing issues, resolved by another patch. What's
> > the point of masking this recipes now?
> >
> >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >
> > > > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> > > > new file mode 100644
> > > > index 0000000..a12521d
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > @@ -0,0 +1,2 @@
> > > > +COMPATIBLE_MACHINE = "null"
> > > > +# Please add supported machines below
>
> Can we instead of neutering all OPTEE recipes and requiring BSPs to provide
> bbappends with COMPATIBLE_MACHINE for opt-in, add EXCLUDE_FROM_WORLD = "1"?

its fine to provide it via bbappends, as long as it is per machine,
which really supports Optee
it is also educational to understand the recipes thats way, excluding
from world is then not required.

>
> --
> Denys
