Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CC7C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:19:46 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.3160.1752567577745211650
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 01:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aQ8nd6G5;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso45773741fa.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752567576; x=1753172376; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJCx5U8aTGw9UNT8i/QPFdLGruqHzbIhj8ccVwjeKkY=;
        b=aQ8nd6G5OoBuTJHC3BUC26J80KcW0vx/pKotXilJfVb+ZKzK2G1zWm6QLy0LgPlHfW
         PQoDRSzA2/6ilL5lOCvK0bNVrlg8uf03f3dj3632if2hTvoCa/rJFuyBw8RGUIzG/9rN
         WkfhSA6LWnoYCQGa7xhDx+I82NmXonou5VVe2q6c6v81cii+mpBB2yGRnRemT2M0ZDF6
         RKP6LLFvX4idmG0bLDlXVOYRV5VPerOwRvJt8NjTIHawC0vrU8dGaja8cvnmwd5PX5wO
         3OP+NBaZRBlb2+sGTWyqkTgR3rm3uE+KkOR8E22xgtm4N2Pp38SSUd0ta7minW6vnnqF
         PJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567576; x=1753172376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJCx5U8aTGw9UNT8i/QPFdLGruqHzbIhj8ccVwjeKkY=;
        b=IGGyyPf7ZW8L5bG4czgkC+IQ6R7DSRUjD5L54zLrIQ3ef0ZjybiSUKX+kI0+ex3dr7
         MKn3oOMNfHIaVCFdmkLU4+Fp6OyJDECdM0jZnKJQi+ZvBK4DOgYUUvD0gwNRI0EI1UNq
         lXnHQ5lxPZUUZ5RWyrme4tnpJswzazVTl7ljBSNpAKcVhg9puoIQEF916L50gAsT2YCT
         0qoeGQetb8b/K6tJINA8UEfTrtuN8S4ZgJpOW+WKoTFPZgJ1PU9/pfK1PJHz+gXbyGgZ
         2qEkj7eC88eQJjAxtcZrMJPC/HtpsS2PkSrd2lsDSmaG/RD+r07Lk1+/z4EkLtpkXnRr
         LbXA==
X-Forwarded-Encrypted: i=1; AJvYcCWqekcpFoY0xogBDUPUNRfmg1kHJymhOHmfvpizgkzcZ/47yBww8SJb1MPOYQtZU5hvXx9OoG5BaA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyr8bV7Qrud+d4ya8WStLU2RlwLZSOUdTCyZAx4bv/pDJFmNTwY
	58XF6ydQl0GTsfW6hBMZ9k1Vr3bxAblmicCEN7EZdjzGRLfONNSeM07DX4vyKU1eIY0=
X-Gm-Gg: ASbGnctRoUmROPPLfGl45ScHCa9xduUTrB5Zv46grXXdP1LQnZec04P5XvGdCuO0DP/
	LIswxSwda4QSBbA/pq1gnIUsRGxdOOaknUCplJjUxqXu/UbWeoSKzSoG4+o/h82T21EelfYiLK4
	TlcWmRJ7dVBiqgbeIqrAAvdD7X4ARY63uFGCnn7CD5ijbcNOPv1mhc2WRAHByKgDuplat/xjEOu
	Dy5VrHPnJLrS3oRhvPj6PqoVViESHPAoBtYIZ4Lu7cwXaoZYy41yeKUBhKyLnZLf06l0VbAqt6m
	u5hOWsEsJJEEKaaYH8uReWYrHWqL0/JJdpABZ5XDpAfBnfqGlQwZp9n5OU4tfXVX7Z1rlTy9MR2
	5QV9mQLWwPxnpyvYT0lK34nfL4eDKRHCggdtfWQ8W6RyRzPsDO2v1sEM=
X-Google-Smtp-Source: AGHT+IFrGYgoMEi9/RM+ojpKLEq56HwXiWVyzRIzJLadxRQFmWUNxzb75WCu5hveWeDN/vd8C2+HqQ==
X-Received: by 2002:a2e:be05:0:b0:32a:8030:7004 with SMTP id 38308e7fff4ca-330532d044bmr49022401fa.4.1752567574441;
        Tue, 15 Jul 2025 01:19:34 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm17992531fa.40.2025.07.15.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:19:34 -0700 (PDT)
Date: Tue, 15 Jul 2025 11:19:32 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: m.grand@trustngo.tech,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Full secure boot with qemuarm64
Message-ID: <aHYPFA6oxnJBa4_r@nuoska>
References: <MR1P264MB1841ADD5E68964B57B0DA05BE157A@MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM>
 <18525E398D470BE8.3909@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18525E398D470BE8.3909@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6614

Hi,

On Tue, Jul 15, 2025 at 11:06:41AM +0300, Mikko Rapeli via lists.yoctoproject.org wrote:
> On Tue, Jul 15, 2025 at 07:57:28AM +0000, Michael Grand via lists.yoctoproject.org wrote:
> > Dear all,
> > 
> > I'm trying to develop a PoC of a fully secure embedded software. Because this PoC is intended for educational use, I don't want to depend on a specific hardware vendor and therefore, I'm using qemuarm64 as target.
> > 
> > Unfortunately, i'm struggling in having a working secure boot (TF-A + OP-TEE + U-boot + kernel) and I cannot find useful (and working) information on the internet. Do somebody has some kind of a minimal working secure boot example based on qemuarm64 ?
> 
> Check the meta-arm layer and build for example
> "kas build ci/qemuarm64-secureboot:ci/uefi-secureboot.yml:ci/testimage.yml"
> 
> These build u-boot for UEFI secureboot and then load a UKI binary
> signed with matching keys, which includes kernel and initrd.
> 
> The testimage part boots the thing with u-boot and checks that
> boot was secure. The config files have the details.

Boots with qemu, I mean to write.

Cheers,

-Mikko

