Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.36889.1578913995025036578
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 03:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pazxwMnV;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id y4so9548475ljj.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Jan 2020 03:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=yxBVz+jj6dFsSH2TnuOEnAgGLPUmQU9TRhyytgWvbec=;
        b=pazxwMnVDfBOd2k71ERCWJhGNWPF5UBy+n4zGxwLG6cKybNwv6awu9TktQObiJAiEm
         RATP3w+zx5hXlqFxTzTDgJNvCkOEXtAbDkVvtSucxJouesSA1Dl10HXmXIQn5krSZ4gC
         1eXIEP8xM4V/IbNAIMBpgxsPKbo/RoV2H40N8grXQwDQAVj4r9O4RX0NHortpiKbpffN
         cftgUyurHdukLIfcqie26OYwFoPn8P06TDdld+AP5SszZTY/bUG0NjwhwAhmkKDwyzgV
         3Qo9j37nLmrk1vYMexAoHIACbEeqfBxwwTAd3E42Iuy4R/XOQbX0HfyWIU2JtnMWsYeJ
         s1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=yxBVz+jj6dFsSH2TnuOEnAgGLPUmQU9TRhyytgWvbec=;
        b=dsYBr0Ns0YBK5J8D9cS2q9Bl13jSaUk+ehI13nbPgKa9e/tnd+YRJuA4PjseSyvmTj
         d8Kqtgh6qTRH8o5ef/mckyA4k4A4i72OFkYS5ZnMh6r0l2o6CEOZR9BytLI7VsyDkwMb
         zCAjiFr+wnbKUyXS8j9bkf0MQB2LPykY2R56jQ1P1LByZMtXx8mbVu+pctq7kEVdVXUZ
         GaWlxg5DHYZ+FyXU8Oj9Z+AiBDkeBlS/cknhNOi8YjQ72qp/nBnChd6uWEerqZAdQQ2w
         nBxaRXfWYkdDJFARk45rAbkUZUkG8KqJ/SdyN+ZtvpynCGSDSwh5vIx/pm57yRmD5/hP
         I1YQ==
X-Gm-Message-State: APjAAAXjvtAOHY/64f9X6XElMLIjAPAMSiJ53i508oyARXvl15Ud+WEH
	iGvCDSk3q1TAM+WnrGe+6cLJSDcCujUULb/h2/aMkFPaLlE=
X-Google-Smtp-Source: APXvYqyzr2OSM33STy+bl7vVYb+RB//mbE3b1hKPypj62FEbpGBNDuSW6uUCedd6ceRQoSkPy2hS3o1KitrOec+fcHI=
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr10507155ljk.245.1578913991775;
 Mon, 13 Jan 2020 03:13:11 -0800 (PST)
MIME-Version: 1.0
References: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
 <2596.1578907811326950752@lists.yoctoproject.org>
In-Reply-To: <2596.1578907811326950752@lists.yoctoproject.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 13 Jan 2020 12:13:00 +0100
Message-ID: <CAP71Wjy3gNpd3XL-qzrnORHLedm7d6t=cX3wsn5dP6sS7D8c9w@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 10:30 AM Bertrand <bertrand.marquis@arm.com> wrote:
>
> Hi Khem,
>
> On Fri, Jan 10, 2020 at 12:33 AM, Nicolas Dechesne wrote:
>
> hi Jon!
>
> On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
>
> The meta-arm layer is now publicly available at
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
>
> It is still under active development, and I encourage everyone who would
> like to contribute to read
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
>
> many thanks for starting this effort!
>
> Some initial comments/thoughts:
>
> 1. We are interested in moving the OP-TEE recipes that we've
> maintained in meta-linaro for quite some time, over there. We will be
> looking into that soon.
> 2. I have very quickly browsed through the files, and noticed that you
> are setting DISTRO_FEATURES within machine configuration meta data
> (juno.conf), this really needs to be removed, as it's a bad practice.
> If someone builds their own distro/apps for 'juno' you shouldn't
> change their distro config.
>
> In order to have a working setup on Juno, I need to enable usb and usb m=
ass storage.
> The other solution could be to enable this directly in the kernel config=
uration and not using the DISTRO_FEATURES but the someone activating or tur=
ning off those features would not get the wanted behaviour.

That's fine. If someone disable usbhost and/or usbgadget in their
DISTRO, they should be able to. If Juno 'requires' these features ,
then you can document that in the README file as well.

> What would be your suggestion here to solve this issue ?

You need to enable usbhost and usbgadget in MACHINE_FEATURES , which
you've done already. Then for the testing you need to use a distro
which has usbhost and usbgadget already enabled by default (which is
the case on OE core nodistro and poky, iirc). If you use a distro
where it's not enabled, then you need to provide a setup script that
will update the distro accordingly.

But forcing the DISTRO variable in the BSP layer is considered bad
practice, for sure.

>
> 3. We have some juno machine definition in meta-96boards, and we
> should look at cleaning things up a bit to avoid duplication
>
> Definitely agree here. Maybe the definition should just be remove in 96b=
oards after checking that we provide the same functionalities.
> When I implemented the Juno BSP, I did check the 96boards so I think we =
have at least the same features in meta-arm but it would be good to have an=
 other check on this.

ok, we will need to have a look at that...

>
>
> Also, some of the layers are now present on the OpenEmbedded layer
> index. Specifically,
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm-b=
sp/
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/
>
> The meta-arm-iota layer was rejected due to not having a distro
> definition in it, and generally being empty. I will attempt to add it
> again once code has been pushed to that location.
>
>
> Thanks,
> Jon
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>=20
