Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.11414.1604490000162836777
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 03:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=EG/f+n6s;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id 23so22572601ljv.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Nov 2020 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYV3UCV+45fnFL6q0ivajVAqTeS1Uy2ZdQO8QNrVS2s=;
        b=EG/f+n6sQHyQJRjF/EbyMLdBwxzryLHk5v1OtgayoP4itJ5L2S5qR8eCIgtOUVZtOU
         dkT0HWPUxcyX1UiwUIjGFlkPxCUwqtilz65vCPx0V0Wz5ipX0CFe/T7b4Ao3mgI02VVD
         +ihLStHn0prmfYBXR3CDEbuWT//ETcuaGgLodctgu9G6iLiGRJRsg5X7b5d/W0LZ/RaT
         DyHGXqEVkUenawElFrRsN6fOX3JRMM3J2SBeAl8BxTadqCLTRdRFk29OcGVx/x6WfRw5
         bKnpPvgOmwHmgNkCa3dyH6ikRZ+qjeRoTzVXiEXKFF0XaFHxCjDnpg2x/HIRatrs1jb4
         drUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYV3UCV+45fnFL6q0ivajVAqTeS1Uy2ZdQO8QNrVS2s=;
        b=dcrDSee6edOrLRGq8M5mYpCXL7ecdA8gFQ9czYRTEmkVXZNJZ2mbC/fXkKVyPxQ3CA
         QGqJ5BK/yE2Aa6+13K3BjiKSbJVbiivhyaEi+9jn6+p7fVTvvWWUdIemlPMMLodU16uQ
         0y05ssGZaY2oxNSls3BkItNynrv7VXAAWHz8LTB36zGr4r5iX/IEEWnqcRq0sURxG673
         VcweTcUOdw+KZNKadMZsKa3vbtON1Wc2k29l23fRfLT8vPmbZK42LAmndhjBcFr9rFrn
         2HKt7OsyyhIdiTzCX7XMa4wcaj1xYBTapA02BHU7Bg3iUSArNLKs4SlwhWTnoKiyH1hk
         AwMA==
X-Gm-Message-State: AOAM531PyOYSV7jbdJtDTNoKPkKWgxe3iFLWGHyCKu91h/kPUDoz1Ru1
	iZqsCoQpX6g1VHUO12PhSlFBkWwCdOXneMUHBtlVHg==
X-Google-Smtp-Source: ABdhPJwz1X0VAPTNaEseMolL6OwFCk0uOjSxDkMD+hA6Q83jDMXYtqkh06K50ZfLdpF5UOVGnlFuSznbArp0+PMUpVo=
X-Received: by 2002:a2e:995a:: with SMTP id r26mr10074081ljj.329.1604489998000;
 Wed, 04 Nov 2020 03:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20201102153341.2844482-1-ross.burton@arm.com> <20201102153341.2844482-4-ross.burton@arm.com>
 <20201104011807.GC19155@denix.org>
In-Reply-To: <20201104011807.GC19155@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 4 Nov 2020 11:39:47 +0000
Message-ID: <CAAnfSTsJhiJZaS7j54uV=8rVZ0BtH0xf1_L6kPKNdfWeeLQt7w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/7] arm/optee-client: rewrite recipe
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2020 at 01:18, Denys Dmytriyenko <denis@denix.org> wrote:
> > -require optee.inc
>
> Was this a mistake?

No, the client library is sufficiently different that optee.inc
doesn't bring any gains.

Ross
