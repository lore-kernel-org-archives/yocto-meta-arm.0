Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91370CD5BC9
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 14:28:38 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.11034.1725546508669016444
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Sep 2024 07:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UtJlENhu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.50, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-27b55c4b35eso447175fac.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Sep 2024 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725546508; x=1726151308; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FTpXReao8hvTAAYqpgecS94rPygpsXF4v0zDOLrB5A=;
        b=UtJlENhupiQR7bEkoO2jt9npag3mHgdM05NDpdfHePPcMRfpeHNkSwDuuUsVuN12ZB
         r66Swe8xRN/+QR+/+cDSWaJpiR+GvoeggIH3WssTteBe7KgpE1YL1li2DKkIVODo7YAw
         pNNZcwHD+28vVh5r6fHLG1MasFHRI4NK0f/lqeAQ1fycIBm7NItseMtnutqLUT2UQKcL
         QYHX2xn7UsWNFsmj/zjXDtA6c/OSWEUCRFukuRllzW6wAnN3Oe0E7BlkBxSWoJVsJ0ps
         HDKJ6Lg6SkJHNxteT3cLL3wJrbq7AoxmSZdHa5rr9nlltQFkgbd4bX1uKOVXZaz5bkdj
         o7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725546508; x=1726151308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FTpXReao8hvTAAYqpgecS94rPygpsXF4v0zDOLrB5A=;
        b=NhQLGtNUjkRat7c4afXnxwyM4LKAkT94Yr4R8Gr1NQ3e/alwZfvB6RMuo2b0yl3Oev
         6KQHYQo/8y024UY1a/xsVr3S1tkYXBy785smJ3omDmuw0I/fjY2I4qUOuX16ReasNFCc
         6qov2ULX8W4+dOEMRUu0GYN2G5I0lpqiOjFgEvksZjkDtS/hmSKrrbI9mb1YtHF9NeP3
         zfwxw56Bsl2n1cMEr2ddvzHIFJwXMLbJaLTGs6Q0khWgTTiPz65WD814ecroeRie4XCh
         z2OFxI/hHGK/61pAsJfhTU4K9uq14Z8pyz6MHCmlQt0szamStaaDW7wtfS7/yuzM095f
         iQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUrnipHWIVNYqAHprd1IoPl4wTY3rtZWQdh7AeLuch6E00Yh3hhJ3pTaGhgd6bmThXcGAE/UELqtg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxPQhxPw7EphnYO+WbFI2yfD0coeWLbVNZ5HEpZKUlv5JHONd16
	fiw9ZaiuxQrL32WN/lW57W2pQGY4UeYS8Yp8/B9aFH0846z7SCEgu2DUnLNOGYBvHX51vFaPv2l
	XFaBOwUQ54nj0msM2Mnr7S7h5iOwTZHbvMofr
X-Google-Smtp-Source: AGHT+IHncuvNfkVVzZbghAlJbAwxjbVyh32QscthAjLXY72htpg/D0KOmtR77I78hlFRlVDBEDu6y88291u3TBKhK3k=
X-Received: by 2002:a05:6870:390a:b0:25d:e3d:b441 with SMTP id
 586e51a60fabf-277c81ed3a6mr19881931fac.40.1725546507820; Thu, 05 Sep 2024
 07:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240904145538.2538-1-jon.mason@arm.com> <Zth2nGkLSl7EOJH8@nuoska>
In-Reply-To: <Zth2nGkLSl7EOJH8@nuoska>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 5 Sep 2024 09:28:17 -0500
Message-ID: <CAPoiz9zzonKUHnk-cVHszyC84xefBqGL6ow4+MEzru4jh-492A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm/libts: Patch to fix 6.10 kernel builds breaks
To: mikko.rapeli@linaro.org
Cc: jon.mason@arm.com, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Sep 2024 14:28:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6065

On Wed, Sep 4, 2024 at 10:02=E2=80=AFAM Mikko Rapeli via
lists.yoctoproject.org
<mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org> wrote:
>
> Hi,
>
> On Wed, Sep 04, 2024 at 09:55:36AM -0500, Jon Mason via lists.yoctoprojec=
t.org wrote:
> > The ts-tee driver was upstreamed into the v6.10 kernel.  Remove
> > arm-tstee driver package, since the upstream one should be used.
> >
> > Parselogs is failing on the qemuarm64-secureboot tests because the
> > arm ffs linux kernel driver requires gicv3 to be in the DT and logs an
> > error if not (though still appears to work).
>
> I think it would be better to filter out the specific warnings via
> meta-arm side ignore list entries in
> meta-arm/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64-secureboot.tx=
t.
> File content is the error string which is acceptable for now.
>
> poky/meta/lib/oeqa/runtime/cases/parselogs-ignores-* has examples.

Thanks so much for letting me know about this.  I'll do as you suggest
and ignore the appropriate errors, and send out a v2

Thanks,
Jon

>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6060): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6060
> Mute This Topic: https://lists.yoctoproject.org/mt/108266536/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

