Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.4823.1620968702086508803
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 May 2021 22:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=c/Dp6Uw9;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id g4so12040633lfv.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 May 2021 22:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+LoqPnWnPs3fmXTIBtGWtkI2UnLSvL+Di8gaOWj3R4o=;
        b=c/Dp6Uw9fl/zMViPVGQdnlTUjDcJGob172LC4DQg9mdcwjxK9QHQ4ONDjXgtWcS4Fx
         4/yhSxVAxRwA75GmT++qd1gvXZyFpkNgiMyW6DaSHHbOcZge61hMAcOFxi0IqaADRUI+
         NyTG0PPSp75auB9Bl3Kvq9/HlhyKlfYJ7oouBkC6O+d1dDFbJslc1OgZ2y3bd8n+CxWc
         BiflQBskdPNJaZJjK+Cr1Yae4lYOWvVk02UxRCbkQbBaHZ8zIGMM4rSzYLBsNs5wrYB0
         shFamnEGvauwIanFaQqtGwI9hiQA3yXdJ9Z4h3wpr/kYLhMyGnJgQl3W2OgenIOYrR29
         wpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+LoqPnWnPs3fmXTIBtGWtkI2UnLSvL+Di8gaOWj3R4o=;
        b=gVG+yrnEVWMcX05d7DU9XAkagPdgh0pinZWyP4NEDc1DMjUr3zFlv8OC5NiblbA5Yx
         trLcxPs7U9fBPVrVwEX3x5+IarWOVsDmRz+nBVQce4082HwaroPDUBA0yMgk8gaqFGBg
         rt7Jq+bjbvMtPsPce5hY9SNJpgq6e4mGI3Yuc/KgczThXPIHgNwhOPdMvBoXpDb4kZE7
         ehK9SJ9FOQwRto9NWZtVZJovRezNTIgyqrpc5d5anY9I7URtGEYOA8HSZgLBndRJXV1z
         h9Xu0etjSYXD8ehaiwf2SZZ0g0FkqVuXKgyQzP2ZNg0plnkrJlDXF2FGT9iCFdf1NEVd
         A9Qg==
X-Gm-Message-State: AOAM532qTkmr/UqgwTKzK1PsLoPLjO/u2pqokrT44whjZfA3Ml7mu8xw
	hxnkIdkM4LZV67EUOCZTBwaEQ20lcRvkiXB/wjhzDA==
X-Google-Smtp-Source: ABdhPJyXs75L0Dtry5MVoSsJU3OerXi+njBYjdMo/h52aZf+QHQhyGXCQGDcSxYcF1X6Vr3TRKjUrzLw9xXo1W+5VRM=
X-Received: by 2002:a19:e05c:: with SMTP id g28mr23947209lfj.84.1620968699970;
 Thu, 13 May 2021 22:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210510181635.3252727-1-ross.burton@arm.com> <CAFA6WYOd_hGzeP+CAvqb5Oih8aG1k4uLAeZTu8KC6OSUvXGy5w@mail.gmail.com>
 <20210513145831.GA11769@kudzu.us>
In-Reply-To: <20210513145831.GA11769@kudzu.us>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 14 May 2021 10:34:48 +0530
Message-ID: <CAFA6WYPBtcpcVWZNHGq6OJdLNQeNNDKAueZMbtHqZHai0OvF6g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: inhibit build dependencies
To: Jon Mason <jdmason@kudzu.us>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 May 2021 at 20:28, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, May 11, 2021 at 10:05:58AM +0530, Sumit Garg wrote:
> > On Mon, 10 May 2021 at 23:46, Ross Burton <ross@burtonini.com> wrote:
> > >
> > > These recipes don't build anything, so there's no need to depend on a
> > > toolchain.
> > >
> > > Change-Id: I49b641fb54839c30255a11a7c9d5798c8e4afd2a
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > For the series:
> >
> > Acked-by: Sumit Garg <sumit.garg@linaro.org>
>
> Apologies, I was too quick with the trigger and pulled these in before
> you acked.

No worries :)

> In my defense, it did pass our internal build CI, and my
> WIP testing. We're still working on a way to have it public, but here
> is a preview of just the building:
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/298844578
>
> You can see from the names that we are getting some coverage for
> clang, Arm Binary toolchains, Arm GCC sources, and musl (for good
> measure).  Not enough computing power currently for every possible
> permutation, but if you can see any obvious coverage gaps, let me/us
> know.
>

Thanks for setting it up. Having a CI setup for toolchain testing is
great especially for binary toolchains. Following are additional test
scenarios that come to my mind:

1. SDK build and test.
2. If computation power allows then we should do a "bitbake world"
prior to every release as that would allow us to cover building almost
all recipes (for included layers) using Arm source/binary toolchains.

-Sumit

> Thanks,
> Jon
>
> >
> > -Sumit
> >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > > index 2fbabfb..046ab62 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > > @@ -1,3 +1,5 @@
> > > +INHIBIT_DEFAULT_DEPS = "1"
> > > +
> > >  FILES_${PN} = "${datadir} ${bindir}"
> > >
> > >  BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
>
> >
> > 
> >
>
