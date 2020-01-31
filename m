Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.770.1580453660766704025
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 22:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=G2P2gXDu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.196, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f196.google.com with SMTP id l4so5315401ilj.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2020 22:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2GoLfYblIUyMCq1cTT+W8qAukagzql9F6v4QXeVkJvs=;
        b=G2P2gXDuxV6SXDpoiTDrk4XvCYrZ9WNxtp4IXdcPq3/9filzq2iXQ6MseJi4XzJGT9
         2d6aAEnOZ8PlrkjOJA8j3XfadE0pzq14TmBhKdGCuhWns35h6VzheI+muDWIgTSiV9iP
         Bqjm3/N+VCuuKwIGiYP1WW6jhDrAj6uwqPk0ymwx1JXTymO9/yQVjU6iko4PRv2wBHkl
         J1c7QZkNGOAJAFMcL4GkPbspoZbjpMhVGvrqc2V2kQTRIElZsqugLK6Lenk3WmEXXucr
         uim4rG7l1XDIor6WAbBjIdWHTBfB/J3FoxedtLlH9GgMa7tohenmM2d9eX8FakjwR1if
         S3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2GoLfYblIUyMCq1cTT+W8qAukagzql9F6v4QXeVkJvs=;
        b=dXn64j5aBiwX3E4ydPAN5HvcDKT2C3Ib5xnt8P4KYAiLDAFFsp8mpV5KNm3SDn0Xre
         UAgMrbJCzAl8UzgQaOVgGVatkVE86W88bArQEKd0iKEzvhk2PYL6UNRIo6CgRkCIaklI
         QrLWI3NRq8ss3vTfJD8CuyEG6bUYQI7vwc78uDDixtPtg75XXv+oBDSk72sEhCijv+JV
         +PPTrwZKLC07TKwOTPpoRSEP7rIfP3LaHOkzlSBS3HkFq82WDKN1KsyGbNyb6Ol53JSR
         pkWR0+LfByo8gFwnv18ePzQ+F0uR4unGvbv8HwGCsog5inwDbgEeF+eqM976Nw7pePbB
         ADnA==
X-Gm-Message-State: APjAAAUYowph0E5bwW0g03+NOry4seqrTewMAv4MQr0br+RQYXsksuHK
	sdDutlQnfqQvtKQcRJm2KfiIANUTcOHkt6Vr4hBLqXv3jHVVWlWX
X-Google-Smtp-Source: APXvYqx7/LxhD2NQNvgGyxOHNWl0ONoyrJLnGeM88BC6hp/OVDk6gtSeat3RNwzYTcNOPN0FjpGpw+UmXsCeuDcL68Y=
X-Received: by 2002:a05:6e02:e8b:: with SMTP id t11mr1221977ilj.159.1580453660017;
 Thu, 30 Jan 2020 22:54:20 -0800 (PST)
MIME-Version: 1.0
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org> <20200130054742.GQ4735@denix.org>
In-Reply-To: <20200130054742.GQ4735@denix.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 31 Jan 2020 07:54:08 +0100
Message-ID: <CAPoiz9y72c=8WATQEe0kzzdCV+6SFGtSQvM6n-XpU+YLjKqMvw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
To: meta-arm@lists.yoctoproject.org
Cc: Peter Griffin <peter.griffin@linaro.org>, jon.mason@arm.com, 
	Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, joakim.bech@linaro.org, 
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org, 
	alexandre.jutras@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 30, 2020 at 6:47 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Thanks! And for the entire series:
>
> Tested-by: Denys Dmytriyenko <denys@ti.com>
>
> The only nitpick is that 0001-use-python3-instead-of-python.patch gets
> created in patch #4, but is added to the recipe in patch #5 - should have
> been all in one patch.

I was thinking the same thing.  I can easily squash all of this into
one patch via git when I merge, if so desired.

Thanks,
Jon

>
> --
> Denys
>
>
> On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wrote:
> > Hi Jon,
> >
> > This patch series adds the OP-TEE recipes from meta-linaro
> > layer to the meta-arm layer which is the new home for generic
> > Arm architecture components.
> >
> > Once these are merged, I will remove them and add a README
> > in meta-linaro.
> >
> > Thanks,
> >
> > Peter.
> >
> > Peter Griffin (5):
> >   optee-client.bb: add optee client recipe and patches
> >   optee-os_git.bb: add optee-os recipe and patches
> >   optee-examples.bb: add recipe for optee examples
> >   optee-test_git.bb: add optee-test recipe & patches
> >   optee-test_git.bb: add python3 backport patch
> >
> >  meta-arm/recipes-security/optee/optee-client.bb    | 35 +++++++++++
> >  .../optee/optee-client/tee-supplicant.service      | 10 ++++
> >  meta-arm/recipes-security/optee/optee-examples.bb  | 42 +++++++++++++
> >  ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
> >  meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
> >  .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++
> >  meta-arm/recipes-security/optee/optee-test_git.bb  | 50 ++++++++++++++++
> >  7 files changed, 267 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> >  create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> >  create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb
> >
> > --
> > 2.7.4
> >
> 
