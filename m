Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.12250.1591367588877786346
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 07:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x16h0ZWv;
 spf=pass (domain: linaro.org, ip: 209.85.167.65, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f65.google.com with SMTP id e125so5945183lfd.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jun 2020 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+WPH4dLdsrFZ2tpFoMi8gSslZetFXUESDqws6XAoPk=;
        b=x16h0ZWvuJZHqr6Qsls6ARYDlTlmRk9GOWOjgIFvNDFqVwr146yi8o49+60MxXEm6A
         s3HmSB+AA1bhaEqlbOS2lRZN00/MNkPlK7KqFHr/6o7pXvKRIuiV3wKmSCWHm+p25zMc
         6JL6jCuyL2cr7cewpBsscwoCIA2RgBYsc8Gr4mIJPm5YctITnA3F7qRAP1wP6Wy0tLPQ
         CXCsjRjPRk/FtX/AS0nvkb/p3h8WpmYYlkePnLYOlB6xq50vzwy6TDKy3jDuBHLpyZbK
         hnrTUV1TkrGeY5utQuRd3TI9WoDN6Jx9R4/B2icwibrQWd5uuyyei6t9hazHovGJGVUm
         hgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+WPH4dLdsrFZ2tpFoMi8gSslZetFXUESDqws6XAoPk=;
        b=qdHfLAJGKv5U3lV2mOMJUYvb22UhsoKORNixXS7Nu1yCEMLUmDUBEUmA0ordiWCq3Y
         ae+TbZYnLkYeTLZUbJGFWaUkeR2aVw6flTBQqVZ3lJ4CwconW4EfjbMgIovewkqOqe3E
         46nIrpmUQ6HhwUMWj9LcAbgLgt2uSls2hnpGL6B2ZlYzK6lW48xIl8JTPbqmE2TlzF7k
         JPM3tPTsAsKuQIKLTIBJPpTxLXU+Q35N3bwxzbJx0lShUwQonZJTqiFwo/hLSyJmf+qq
         haBc94FHEFZ/WgeQB2GWHrUxh4lYIUABcGBF3V7VUqVg1pMvs+UexQQHTJKMAtnIm0MC
         34ow==
X-Gm-Message-State: AOAM532iMIpDeNUAGEb/BYH2Fy5qJBla3/FO+SRhzYiw/HoDiWuozaps
	XkBV+74zuz0rjVqrsrQaz5SlJnlc8CvB+riWfm1EXQ==
X-Google-Smtp-Source: ABdhPJwfGyu6mpX5XmO5YCzS9G6ug0Wrw+2LYEEt8yZfbX4idW/lf7m5GRfSBAmyxyRKnauBXLRcEaamzJmovFDNN2k=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr5495107lfn.21.1591367586971;
 Fri, 05 Jun 2020 07:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-4-git-send-email-sumit.garg@linaro.org> <20200604184700.GF17660@denix.org>
In-Reply-To: <20200604184700.GF17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 5 Jun 2020 20:02:55 +0530
Message-ID: <CAFA6WYN6KXR6kR_kY+obdyy00USc7pa69OAnSi5KDOa4iy6=5w@mail.gmail.com>
Subject: Re: [PATCH 3/4] external-arm-toolchain: Add README
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 00:17, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Jun 02, 2020 at 04:34:53PM +0530, Sumit Garg wrote:
> > Document usage details for pre-built Arm toolchains.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  .../external-arm-toolchain/README.md               | 50 ++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> > new file mode 100644
> > index 0000000..65d1a42
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> > @@ -0,0 +1,50 @@
> > +Pre-built Arm toolchain recipes
> > +===============================
> > +
> > +Introduction
> > +------------
> > +This layer contains recipes for pre-built Arm toolchain recipes as follows:
> > +
> > +external-arm-toolchain.bb
> > +~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This recipe provides support for pre-built GNU toolchains targeting processors
> > +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> > +
> > +Usage
> > +^^^^^
> > +
> > +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> > +on), a user needs to download and untar tool-set on host machine at a particular
> > +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> > +in ``conf/local.conf`` in order to replace OE toolcahin with pre-built GNU-A
> > +toolchain:
> > +
> > +TCMODE = "external-arm"
> > +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> > +
> > +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> > +   EXTERNAL_TOOLCHAIN = "\
> > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> > +   "
> > +
> > +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> > +   EXTERNAL_TOOLCHAIN = "\
> > +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> > +   "
> > +
> > +Supported distros and machines
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> > +meant to be distro and machine agnostic as long as one is cross-compiling for
> > +Arm A-profile architecture.
> > +
> > +gcc-arm-none-eabi_<version>.bb
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> gcc-aarch64-none-elf?
>

Sure will update for gcc-aarch64-none-elf as well.

> Probably need to explain a bit more regarding the differences between
> baremetal and Linux toolchains, as currently it can be confusing to some
> why there are 2 sets of toolchain recipes...
>

Isn't baremetal development and Linux development self explanatory?

What additional differences are you looking for?

-Sumit

>
> > +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> > +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> > +Cortex-R and Cortex-M processors.
> > +
> > +Supported version: 9-2019-q4-major
> > --
> > 2.7.4
> >
