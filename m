Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.4373.1586416838700288366
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2020 00:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OO4G8MGW;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id k21so10401491ljh.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2020 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yjTiJqgQpifn+YQZEBrtA4/TnzSq3IAlIYIz1RSI9W0=;
        b=OO4G8MGWMu+vwkv8Z5XGA23SUOOv4hSMrf8oCBYWKmZq+I1adGDByLiJyw6X4Mzkwu
         zdEHXz8htKwQYhTkSRrUBWy6oAWZy1ZcYW3mn3xlfE21nZxiZnNAMjf67wMi6gpOHKvO
         xPkzMabiVKJpH+/+U5aVzfMcUIROuLjWXLBHArCaSP5ZMOSGKNYMzOtI414p7KXwc5z4
         29pJNa9uiHZpl5iLe36Irjm0kw0ueS8XJ1xCsqfSgSebaSRg8KEDrbBVtWpQPa/IrNQ0
         T3KeBjJAfuXCNHg9LNM5lt7/JK+S2pOzrMmUM70j+EJzg/nJLQFcIzK12o/a5rgJTbGC
         SoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yjTiJqgQpifn+YQZEBrtA4/TnzSq3IAlIYIz1RSI9W0=;
        b=ANS5Cro2bt7KD8GL4tLkAYptzhkPV1Y8ifp9m5tAyDrD0xVA94o1ZNbg1XWIlemybo
         QNOCJmuawRn4ijN3pDL1iivvlOAJ9H4feZrKW7n7OhWYgYYoFuuOWj4UcpqjDh08F4Un
         t3ojujcgwKvuKqT6KE1gTei7nc7QNZlUWQ69v2FGc3RJ9IWq0v1hsUcqM4w0fugwI3im
         aKSoGkDWmob0Jud1mCNe5Tewm8moNyCO2e4gu9Kn7W7qST9emOQaN+ybD+nRig9LF0yn
         7o0AlVcdR8wE3TI16omQwksZu0Z/yaQWwnJcSUrWOStAEON/l5l83oceGfE+cl7gHkz1
         g3rQ==
X-Gm-Message-State: AGi0PubrO0KP4+KKIMPH/Zex2WGG82/TQdSbWL4J/xfILi+dMMctLlKb
	J8ure/e7aRX4xJ5KKz9lfp5/ZHy5rkOcOigXz4KACg==
X-Google-Smtp-Source: APiQypI0KkOwwUuqjOY/EUIurcfpm+jiWWF+4b1LGpmODeJuX4l1cp0nlpVAv4fi8rRFQI7V6JBJAKmXF2tp7XL2Hks=
X-Received: by 2002:a2e:5d3:: with SMTP id 202mr1561488ljf.293.1586416836703;
 Thu, 09 Apr 2020 00:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org> <AM0PR08MB3987BA60B6716249954D79A592C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB3987BA60B6716249954D79A592C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 9 Apr 2020 12:50:25 +0530
Message-ID: <CAFA6WYP1u0qGV4HR+a9-cLa+6B=BZamGqJBOTMFt+Xv6ENdHag@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Jon Mason <Jon.Mason@arm.com>, 
	"nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>, 
	"riku.voipio@linaro.org" <riku.voipio@linaro.org>, "denis@denix.org" <denis@denix.org>, 
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Apr 2020 at 12:36, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Sumit Garg via lists.yoctoproject.org
> > Sent: 09 April 2020 07:30
> > To: meta-arm@lists.yoctoproject.org
> > Cc: Jon Mason <Jon.Mason@arm.com>; nicolas.dechesne@linaro.org;
> > riku.voipio@linaro.org; denis@denix.org; daniel.thompson@linaro.org;
> > Sumit Garg <sumit.garg@linaro.org>
> > Subject: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball
> > insted of svn
> >
> > GCC 9.2 source fetch from svn is quite slow as compared to source tar ball.
> > So switch to fetch GCC 9.2 source tar ball instead.
> >
> > Reported-by: Riku Voipio <riku.voipio@linaro.org>
> > Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-
> > arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > index 366a070..08e8f7f 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > @@ -27,10 +27,7 @@ LIC_FILES_CHKSUM = "\
> >      file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \  "
> >
> > -#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > -#RELEASE ?= "5a5ca2d"
> > -#BASEURI ?= "https://repo.or.cz/official-
> > gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-
> > ${RELEASE}.tar.gz"
> > -BASEURI ?=
> > "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=277439;module=arm-9-
> > branch"
> > +BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-
> > a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz"
>
> Any specific reason for having a softer assignment here? Are we expecting
> the user to customize this variable?

This trend has been followed on from OE-core gcc recipes. AFAIK, this
will be useful in case the source package is hosted somewhere else
like local storage etc. User can simply override this variable via
".bbapend".

-Sumit

>
> >  SRC_URI = "\
> >             ${BASEURI} \
> >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \ @@ -71,7
> > +68,9 @@ SRC_URI = "\
> >             file://0036-Re-introduce-spe-commandline-options.patch \
> >             file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \  "
> > -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
> > +SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
> > +
> > +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-9.2-
> > 2019.12"
> >
> >  # For dev release snapshotting
> >  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> > --
> > 2.7.4
>
