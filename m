Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.27834.1591615627812237541
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 04:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xEL8ibyR;
 spf=pass (domain: linaro.org, ip: 209.85.167.68, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f68.google.com with SMTP id c12so9963072lfc.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 04:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/XMi+BoZkqVE3rrHnjmxeBDvP3ePhT191c13/7IT6U=;
        b=xEL8ibyRfOUEy+dV6MfLjwauLQxY1Y0pDeP04a65BsKcjCrN7qmJvrnmG3EW6QqkTL
         EuTr2RccGiQT0L2EypvgWpESag0uauUzIgjxa9anlhvB4HcPkdlI10QwORlqCB+Ikokb
         ozlpa1360Qpj9QBgSMtrNIbzQ+8wTyJudbS8xwOkIeOFtEqF9bT9Z//HZIZsoCXdte21
         FkvIORzkaHdDDdXsOBt3gDdW/j+NYqyBEizFrm/ujTdg8+R6fjLmRI4E9PwI+UQoGyxf
         wEW5tBSzDQ8P58u2yhAF6hEqW2p5f+TbS/oFpdtAbr6UWQGKUJDPBCiE6G4M95FRerRF
         IoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/XMi+BoZkqVE3rrHnjmxeBDvP3ePhT191c13/7IT6U=;
        b=aVBIi5EbSlbs1g/6kdZnYXgS0gcJC2ijzp7v/CAIP5fQ0ENneGxQbb5jaB3yw0p85s
         /kYmmUM34Jm1IxmPWidZuN8UTamlmuJXkvx6YHiGbwuzifzyMzpdQkX3XCZBJ8ofHMQx
         aNn7CNd+aj5x/++95Qlilx77jrQttrXFYgLH7If/ooO1lZPe3G2Xv7T01A1H1U5MUu77
         b7SImW7OVW7r/H+j+S1JKPYFz9tL8W7+ZmvxHqhK25CRYHWaJ4TgSiJi5fJSwb3iEQ1i
         4EbUu60Qy8kOIvGvnOgBw89F4Fiy5S54EWS22ZDUTfTgizUADa+vcBR/hciJgkb/dm9N
         LPhQ==
X-Gm-Message-State: AOAM5317spRokO12gFeBRMyx6WAhbjh1ndA0Ix601MDw1yBSh5CdVPJY
	4MZ4UySpCRLzd6cYE+anLGHd1e/S2OeDO4f5UkehgQ==
X-Google-Smtp-Source: ABdhPJy7vaXdREvIX8Li8HBIbNyitdSOSdHmtQisTCvyd/EjWKjUy2084B22ngZLtiUKUPkUz6KDVZf4oiK2oNMKB1Y=
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr12371960lfi.204.1591615625707;
 Mon, 08 Jun 2020 04:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org> <20200604230014.GH17660@denix.org>
In-Reply-To: <20200604230014.GH17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 8 Jun 2020 16:56:54 +0530
Message-ID: <CAFA6WYOQ4A9Wrqp9oAuZe+7k1CP3=8LTAhR1uUzt3SeDTZkNMg@mail.gmail.com>
Subject: Re: [PATCH 0/4] external-arm-toolchain: Add support for SDK generation
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 04:30, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Jun 02, 2020 at 04:34:50PM +0530, Sumit Garg wrote:
> > Patch #1 and #2 adds impprovements in external-arm-toolchain recipe in order to
> > support SDK generation. SDK generation has been tested using:
> >
> > $ bitbake core-image-base -c populate_sdk
>
> This just ensures that external-arm-toolchain doesn't get in the way of SDK
> generation by avoiding any conflicts. The only re-use here is glibc. The rest
> of pre-built Arm toolchain gets thrown out and rebuilt from sources - gcc,
> binutils, gdb/gdbserver are all built from sources as TCMODE was not set and
> falls back to "default".

Yes I noticed this as well. I guess we can improve this situation to
package tools from pre-built toolchain only rather than building from
source. Will explore options.

> Sure, pre-built Arm toolchain doesn't provide all
> possible SDKMACHINE binaries, but for 90% cases of x86_64, there's very little
> re-use...

Yes, but don't you think that having a common build environment using
SDKs is still useful from the end user's perspective irrespective of
underlying toolchain (built from source or pre-built)?

-Sumit

>
>
> > Patch #3 adds a README to describe usage details of pre-built Arm tool-set.
> >
> > Patch #4 adds package specific licences for external-arm-toolchain recipe.
> >
> > Sumit Garg (4):
> >   external-arm-toolchain: Remove glibc locale dependency
> >   external-arm-toolchain: Refine dev libraies packaging
> >   external-arm-toolchain: Add README
> >   external-arm-toolchain: Add package specific licenses
> >
> >  .../conf/distro/include/tcmode-external-arm.inc    |  1 +
> >  .../external-arm-toolchain/README.md               | 50 ++++++++++++++
> >  .../external-arm-toolchain.bb                      | 29 ++++++++-
> >  .../external-arm-toolchain/license.inc             | 76 ++++++++++++++++++++++
> >  4 files changed, 154 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> >
> > --
> > 2.7.4
> >
