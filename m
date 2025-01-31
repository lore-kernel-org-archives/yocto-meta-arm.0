Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CD7C0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 07:45:49 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.14917.1738309543168952658
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 23:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FfUcTSj1;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227c56b11so16884201fa.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 23:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738309541; x=1738914341; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLIoBmioRKvfXN6+qz2jTNJl0nw6Q8qvJqQjBQly+x8=;
        b=FfUcTSj13Q+E+tifTGfnZFmVahvHq0iafrFk/tMIdPHu1f/s/jeaCiG6fP1JgKS6SN
         q8IcWKQT8uQCY5JSdetFKHFW9ZYX52jOHs0uoTqcbGRh4kWobUWxw7Etl8LoqSMX4PLv
         RgOF5f26ayY5qsgABzSK/sh/AcxkqRyOvxfJP9sAeH3t7jVJohPLxy+R0is6q+C+SSc9
         pI/iXJMH9FSCtcGIIZ0roMwT7rdBBr0tyal7IoTUbR+wxYPrr55j60SaJc0Z+ed0tiWU
         iK/e8f0nW1KoPM0jnckIOUa7+AslUHl66IYZBdh/wylP0KYgRcelCkl5LR7THRkseRYn
         UMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738309541; x=1738914341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLIoBmioRKvfXN6+qz2jTNJl0nw6Q8qvJqQjBQly+x8=;
        b=hSSrdJJiGSvkazl5INaeBzbiHrbhbw500+0YtbnJifrHejEMBoH3vAYfTcUCGEiIfK
         VDlSFeFmpFSalhgBMtAnU7wpHhHqUYbNyB78rcdU56/zg93oDwEZ5DE2pZ0er6PHdjpF
         X4IslmJ4t98h43z10o72WIRM3QUUqjAlzwXbmymv60zu74yz2rZlLT4QCavF79A9uqOF
         m9gXWsJI9zQJ+6jVVx5cQ/BM5lrgt37Vm9CbeADUQ7VjQoxHdQ8dmG6rpbcgRdiiu84a
         5/5uhjBy+xPVlricqLlYqzbkYjCLTFbDqLgYvMbhtitF48V4G3rxIz9ArqYpb3yA21U6
         imag==
X-Forwarded-Encrypted: i=1; AJvYcCUtnh2w5BGdFjRjeX6ycLWv8keeRtye/dkAfPFc/uIbUOKh5Y67BUc1ABM83SUYHselNUQhlADBPw==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwhyYERbvpScN8Mzc1n9G7osi4AINgR5fyK3YcQoDdmdDR2nKGr
	ChpJocz4OT4c8UVRMP+tGaYKyoYN4yBuTkwDBrO0kjAInE0OEfLHWFe/5pBblYw=
X-Gm-Gg: ASbGncsehY4ySAvLiHnw1Usj4V7/4ekFH8xd8GlqKzwI/l3Q8OGyhMg+gNUJZvlSS/9
	PnuzBQVB+Rav/WO5S0lJ849YIUM0bpStAYc4ZgDT6I/peoR+s8JX27ZtFmDpVaA9YLdUhpERW1T
	Ihl/AnLbxBgMwuYE/CtYz1vNO5eYhPiRLxqJC7MPVVd71erbs1jWuV74LglEq12x5QiC4oL4+n1
	QgyDKaHktyyezBWb3S536gOV2oEqMumbIzdVR0KEgBiepoXyQDuO8O7QJtiDqHWmc6ZKoO/3trW
	pXQpBxIjA/dFquuUs1QypnBu7dhbCfsD7aSUJ5i9
X-Google-Smtp-Source: AGHT+IGVbUL8OPIY/zdJEySwq1N6u6xqzWk7lgTETa/b95d2sIiN7zGDhpVVwyDaHITOLq057y2AlA==
X-Received: by 2002:a2e:a883:0:b0:306:501:4752 with SMTP id 38308e7fff4ca-307968d719fmr39758331fa.11.1738309541246;
        Thu, 30 Jan 2025 23:45:41 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7795sm4705261fa.79.2025.01.30.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 23:45:39 -0800 (PST)
Date: Fri, 31 Jan 2025 09:45:36 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] systemd-boot: update systemd-bootaarch64.efi
 path
Message-ID: <Z5x_oJfq3o5GhSVG@nuoska>
References: <20250127072356.852345-1-mikko.rapeli@linaro.org>
 <CAPoiz9wANA-Tgub4G+AXs_yQf9-NyKsSOJX5J0z=qOu8=jA42A@mail.gmail.com>
 <181F17E3A23753E5.21193@lists.yoctoproject.org>
 <181F3119A56BC89E.31881@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <181F3119A56BC89E.31881@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Jan 2025 07:45:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6363

Hi,

On Wed, Jan 29, 2025 at 04:46:02PM +0200, Mikko Rapeli via lists.yoctoproject.org wrote:
> On Wed, Jan 29, 2025 at 09:03:59AM +0200, Mikko Rapeli via lists.yoctoproject.org wrote:
> > On Tue, Jan 28, 2025 at 03:33:28PM +0000, Jon Mason wrote:
> > > On Mon, Jan 27, 2025 at 7:24 AM Mikko Rapeli via
> > > lists.yoctoproject.org
> > > <mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
> > > >
> > > > poky updated systemd from 256 to 257 which changed
> > > > the build time path.
> > > >
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > 
> > > I tried this out a couple weeks ago.
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/8885513336
> > > Essentially, systemd changed more than just the location.  It changed
> > > UKI fairly significantly, and that is failing to generate an
> > > authenticated image.
> > > I was able to bisect it to the systemd commit
> > > https://github.com/systemd/systemd/commit/2188c759f97e40b97ebe3e94e82239f36b525b10
> > > 
> > > I ran out of time to bug this further, and meant to email you with the above.
> > > 
> > > I'm hesitant to apply a patch that doesn't fully resolve the issue
> > > (though Ross might have a different opinion).  So, if you can manage
> > > to fix the systemd UKI issue, I'd be willing to take it then.
> > 
> > Ok I will have a look. oe-core has pretty good selftests for uki.bbclass and
> > systemd-boot so I would have expected them to catch major regressions, apart
> > from secureboot which is the addition to them in meta-arm.
> 
> FYI: discussion and analysis is happening in upstream systemd bugreport
> https://github.com/systemd/systemd/issues/35851

I've sent a proposal to fix/workaround this regression to poky/oe-core.
Once that goes in and this patch is applied in meta-arm, then
qemuarm64-secureboot and uefi-secureboot work and all tests pass. Used this build
config which also runs the tests:

$ kas build ci/poky.yml:ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

Cheers,

-Mikko

