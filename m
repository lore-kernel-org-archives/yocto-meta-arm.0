Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.38.1580917376688980098
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 07:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=w14fJtKX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.67, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f67.google.com with SMTP id s24so2610465iog.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Feb 2020 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ka08391sW9iOlybdEkIhiPykDJgPJiFW9u9jBuPfH/8=;
        b=w14fJtKXSRdRxeJAxY0IsvzmABHHUZoPBTWsW3gFlCuIP8kNYJ+e1/bZNP7Rj9s13L
         4NK7syHN0/9KMH1+2/stwFcqRuB0XYX40QoY/AsJmc0XaO8X/O5Gh/ahhSUvBR+NiE7Y
         T+cOciP9wc00jngV24Sp1Bzo7X6LMNQcyxoNoXFwAv6sMT2n7/cTbOaL0RsfjdlAWCYT
         H9pLc0stXoB9xQSX56x6vKu2BGhLJ92hQIg3xy4/0HLmP2KajeHQV/AP6Xw6WIEzUcgO
         hbU5AroJ7ufcBTDZwdyfXn2i8GcGYNhtX8J0D5vo6cGq3yTuACGq+Ca2lWxLrzWZFjPh
         s7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ka08391sW9iOlybdEkIhiPykDJgPJiFW9u9jBuPfH/8=;
        b=I29GR3nNBQs5tLcKnwAMU9eq6eAQ/KnWRIZO893BYtS6p88w42clJK5b26P2WECG43
         AXFcIzqJpaelVq0DCYcywmREElLXmb+z3eChgavmq0q8KvWHBa5K1oe1Q9XfWt2R7FRp
         cqBCIm83kd+So+2NMMyDjA/v2Iao9u2jrTv3h8wlootGg4SFQjZDW6Pude0fMFJysf1T
         ikCecI/fPlr3FK3QNzgioKaTxoabiG1aXa3/GHKovOuO+gs16uMTl+pTstzan0ffTM8e
         z28eaWIUfhGgad3n3QEwy8PjsQwc1zZsBFgM58h5rLrV4IYU0XTMI7pfw6tgyX3sS/W7
         hGnQ==
X-Gm-Message-State: APjAAAUMBa+Z283x3FcG6IqicZ5EhL2uIGl5fYjo5n/m+kDBk5s4/D+L
	SIBXWYLpRZZylpJCOvuM4SkjavlhsYd6s/YtTVZQrw==
X-Google-Smtp-Source: APXvYqwH1F9mgRDQAC6JCTZvuvym7VnpYE/DuPn0mDRXJiG9drBuJiwqrEgfPnsapFP0qKj5Nord0n3390Sp02IaSPs=
X-Received: by 2002:a5d:97d7:: with SMTP id k23mr16097219ios.97.1580917375902;
 Wed, 05 Feb 2020 07:42:55 -0800 (PST)
MIME-Version: 1.0
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
 <20200130054742.GQ4735@denix.org> <CAPoiz9y72c=8WATQEe0kzzdCV+6SFGtSQvM6n-XpU+YLjKqMvw@mail.gmail.com>
 <20200131235657.GR4735@denix.org> <CAPoiz9xpw_hp0XmBaz2uVK5-zKx4g+QCvczPrmJ2Vt6Y9ZTMQQ@mail.gmail.com>
 <CADrjBPqQQhy-66QNu_Q6fsAxwiGWHjVZqkWmZdxcYS3JdecYmA@mail.gmail.com>
In-Reply-To: <CADrjBPqQQhy-66QNu_Q6fsAxwiGWHjVZqkWmZdxcYS3JdecYmA@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 5 Feb 2020 15:42:44 +0000
Message-ID: <CAPoiz9zGzAN=yNxJU2dDYKVZR0z+K1iqzbkYah_uD-7wTM1Nfg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
To: Peter Griffin <peter.griffin@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>, 
	Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, 
	Moorthy Baskaravenkatraman Sambamoorthy <moorthy.baskaravenkatraman-sambamoorthy@linaro.org>, 
	Alexandre Jutras <alexandre.jutras@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 2, 2020 at 7:46 PM Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Jon,
>
> On Sat, 1 Feb 2020 at 15:25, Jon Mason <jdmason@kudzu.us> wrote:
>>
>> On Sat, Feb 1, 2020 at 12:57 AM Denys Dmytriyenko <denis@denix.org> wrote:
>> >
>> > On Fri, Jan 31, 2020 at 07:54:08AM +0100, Jon Mason wrote:
>> > > On Thu, Jan 30, 2020 at 6:47 AM Denys Dmytriyenko <denis@denix.org> wrote:
>> > > >
>> > > > Thanks! And for the entire series:
>> > > >
>> > > > Tested-by: Denys Dmytriyenko <denys@ti.com>
>> > > >
>> > > > The only nitpick is that 0001-use-python3-instead-of-python.patch gets
>> > > > created in patch #4, but is added to the recipe in patch #5 - should have
>> > > > been all in one patch.
>> > >
>> > > I was thinking the same thing.  I can easily squash all of this into
>> > > one patch via git when I merge, if so desired.
>> >
>> > I'm fine with squashing few patches, if you want to. Do you want to squash 4
>> > and 5 only, or all 5 of them into 1?
>>
>> I was meaning all 5 into 1, but 4 & 5 only can be done if that's preferred.
>
>
> Squashing 4 & 5 together makes sense and would be my preference I think
> over 1 giant patch.

The patches were squashed and pushed to the master branch of meta-arm.
Thank you for doing this work.

Thanks,
Jon

> Thanks,
>
> Peter.
>>
>>
>> Thanks,
>> Jon
>>
>> >
>> > Denys
>> >
>> >
>> > > Thanks,
>> > > Jon
>> > >
>> > > >
>> > > > --
>> > > > Denys
>> > > >
>> > > >
>> > > > On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wrote:
>> > > > > Hi Jon,
>> > > > >
>> > > > > This patch series adds the OP-TEE recipes from meta-linaro
>> > > > > layer to the meta-arm layer which is the new home for generic
>> > > > > Arm architecture components.
>> > > > >
>> > > > > Once these are merged, I will remove them and add a README
>> > > > > in meta-linaro.
>> > > > >
>> > > > > Thanks,
>> > > > >
>> > > > > Peter.
>> > > > >
>> > > > > Peter Griffin (5):
>> > > > >   optee-client.bb: add optee client recipe and patches
>> > > > >   optee-os_git.bb: add optee-os recipe and patches
>> > > > >   optee-examples.bb: add recipe for optee examples
>> > > > >   optee-test_git.bb: add optee-test recipe & patches
>> > > > >   optee-test_git.bb: add python3 backport patch
>> > > > >
>> > > > >  meta-arm/recipes-security/optee/optee-client.bb    | 35 +++++++++++
>> > > > >  .../optee/optee-client/tee-supplicant.service      | 10 ++++
>> > > > >  meta-arm/recipes-security/optee/optee-examples.bb  | 42 +++++++++++++
>> > > > >  ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
>> > > > >  meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
>> > > > >  .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++
>> > > > >  meta-arm/recipes-security/optee/optee-test_git.bb  | 50 ++++++++++++++++
>> > > > >  7 files changed, 267 insertions(+)
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
>> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb
>> > > > >
>> > > > > --
>> > > > > 2.7.4
>> > > > >
>> > > >
>> >
>> > >
>> >
>> > 
