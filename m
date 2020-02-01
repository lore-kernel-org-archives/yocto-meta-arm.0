Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.13290.1580570711359793260
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 Feb 2020 07:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ByYI8wSt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.67, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f67.google.com with SMTP id s6so1310561iol.9
        for <meta-arm@lists.yoctoproject.org>; Sat, 01 Feb 2020 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pZSKtFmmX0zLIFYdnMMNchfV5DC32eEU9XwcKM7r9xA=;
        b=ByYI8wStkw0Zn+ndJ/B3vGvLLU1jpaniKfgjf9iT29gLkQPcYumjIvrj0lpPP/3h+5
         KCRe6N7meKMNV773541kkeamQrfk6mOJK26wRrxP0ChN85OpMDzdO7eQhkXrl39kemOK
         /bcGVTlxu4baRuiTeINCYf4GkinffwUuW4j7sV0Ed3OSXrGFBKX6lk8IcnW1H2M5bxYb
         hLpLWbvrktd6YubJrqLi0fX9/uvv7dppL601a4OV4JLVhpOcJoNAlD2XKY42PUB7R7X2
         l+UWZn4j3Tkmm6TmPROx5TAE5ETTzn8SxgXbetWNKccUBMWRlA7cDyHNXCP6GEDEn24W
         5qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZSKtFmmX0zLIFYdnMMNchfV5DC32eEU9XwcKM7r9xA=;
        b=o3r/PCT+rwkK4p8Mz5D4WUSn0ryl+p15IqLYN5q7xuTG8EiP4qI8Vu6+sIv3fGByK8
         VgejwzkGy0K6IRd/abM50+ZM9JnUi5RazXfp3Y5NNie60zvDsIJDbzhxKWGW9b51UAqI
         t+19/1bhl/Q6vyH5NuYJms0lUIYIK8CiV8fNENrHJvvUgRLeSN5o0bsEZB9A+1LdpQ4W
         aa4ICdV30XfZEtxO2QrKmt84/DgRRdZrd6ZMiTUH80RNYC7h4tZE4hBFGisTFJZG8zrK
         /lArIsKJ/AE2aS065Ql9Egyr/85R//URaFbJt1YK2Qrjld8tg94oCysX6wgsu3TMR1AD
         psxw==
X-Gm-Message-State: APjAAAV9M36V3odGpyPFFEL//bGuillEBiqGHfGW+/p5SXqwQ/fe1z+R
	l7bJjnJEwxIxF3y4BRoP0TTB9X+CKZuhbpI5jFeudQ+J2lBArA==
X-Google-Smtp-Source: APXvYqysde1dh29DxQQfgLRRDTxUl3g09Mqrs48oOWqvZ8+rZrNOa5lvN5us3TNLNRRuAbKyGy6W28Jwjf/505XpekI=
X-Received: by 2002:a5d:8796:: with SMTP id f22mr12555845ion.163.1580570710547;
 Sat, 01 Feb 2020 07:25:10 -0800 (PST)
MIME-Version: 1.0
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
 <20200130054742.GQ4735@denix.org> <CAPoiz9y72c=8WATQEe0kzzdCV+6SFGtSQvM6n-XpU+YLjKqMvw@mail.gmail.com>
 <20200131235657.GR4735@denix.org>
In-Reply-To: <20200131235657.GR4735@denix.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Sat, 1 Feb 2020 16:25:00 +0100
Message-ID: <CAPoiz9xpw_hp0XmBaz2uVK5-zKx4g+QCvczPrmJ2Vt6Y9ZTMQQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
To: meta-arm@lists.yoctoproject.org
Cc: Peter Griffin <peter.griffin@linaro.org>, jon.mason@arm.com, 
	Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, moorthy.baskaravenkatraman-sambamoorthy@linaro.org, 
	alexandre.jutras@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 1, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jan 31, 2020 at 07:54:08AM +0100, Jon Mason wrote:
> > On Thu, Jan 30, 2020 at 6:47 AM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > Thanks! And for the entire series:
> > >
> > > Tested-by: Denys Dmytriyenko <denys@ti.com>
> > >
> > > The only nitpick is that 0001-use-python3-instead-of-python.patch gets
> > > created in patch #4, but is added to the recipe in patch #5 - should have
> > > been all in one patch.
> >
> > I was thinking the same thing.  I can easily squash all of this into
> > one patch via git when I merge, if so desired.
>
> I'm fine with squashing few patches, if you want to. Do you want to squash 4
> and 5 only, or all 5 of them into 1?

I was meaning all 5 into 1, but 4 & 5 only can be done if that's preferred.

Thanks,
Jon

>
> Denys
>
>
> > Thanks,
> > Jon
> >
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wrote:
> > > > Hi Jon,
> > > >
> > > > This patch series adds the OP-TEE recipes from meta-linaro
> > > > layer to the meta-arm layer which is the new home for generic
> > > > Arm architecture components.
> > > >
> > > > Once these are merged, I will remove them and add a README
> > > > in meta-linaro.
> > > >
> > > > Thanks,
> > > >
> > > > Peter.
> > > >
> > > > Peter Griffin (5):
> > > >   optee-client.bb: add optee client recipe and patches
> > > >   optee-os_git.bb: add optee-os recipe and patches
> > > >   optee-examples.bb: add recipe for optee examples
> > > >   optee-test_git.bb: add optee-test recipe & patches
> > > >   optee-test_git.bb: add python3 backport patch
> > > >
> > > >  meta-arm/recipes-security/optee/optee-client.bb    | 35 +++++++++++
> > > >  .../optee/optee-client/tee-supplicant.service      | 10 ++++
> > > >  meta-arm/recipes-security/optee/optee-examples.bb  | 42 +++++++++++++
> > > >  ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
> > > >  meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
> > > >  .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++
> > > >  meta-arm/recipes-security/optee/optee-test_git.bb  | 50 ++++++++++++++++
> > > >  7 files changed, 267 insertions(+)
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb
> > > >
> > > > --
> > > > 2.7.4
> > > >
> > >
>
> >
>
> 
