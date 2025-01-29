Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1535BC02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 14:46:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.13989.1738161966970432575
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 06:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fSW+JCM8;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3778bffdso7565810e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2025 06:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738161965; x=1738766765; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtFfJ0KQHKIo3eeykifTHVoI76AeGEwJlp6odYu3qxw=;
        b=fSW+JCM8BxYT3NPuyf+eY9fGdhZng7n+ILqxjPCxX8+5E7JSYduQAEWH6KpSsIhNFM
         bomE7Pr6ZCrAkH1H5KJHt4IDm6gnEQYKV/L6Z24xVCqkWCv6ukD8a5F9A0y1Egmg5dPU
         0zaQAQO2E0jPLnhQzpPw4pRU+kktnFjitAgmW85sPWf1l8DoJ8xfnf8Gc6D34eUz2OMU
         cEICDlOMRuAT2PtGrI/9lOgjfb9zKR4AUlSF0fIzcsAtNpPMpITxIdaKaLPn4FyyzsZG
         8y71UQVVEVg3jn7yTmNmf3VlvWspNh6SIVpEH7+wHZQY5/JmT+4NHO8C7l7mA3fSuRub
         5LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161965; x=1738766765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtFfJ0KQHKIo3eeykifTHVoI76AeGEwJlp6odYu3qxw=;
        b=v73qqoX1qBY1WfPMRgQ/ZSgwgssGLCAqrzBbEcltExWfDRK3FZJyQ5f5XuhgYZNmbY
         rsYy8aeaoURYAXJpG6RmQf+gTwJB3sEpdQsV2x7Ti6Gzdfs4kBRF7Zy/5qjj+syasHrM
         JGyBe5AHWsbiWTS/SLPSWxmEA/GacsMo4I1FN+XQc175yn+nzwwuBU/H141y8a+ZDLMN
         5Bkun43iiJpIavW1GFNDE8v89hKK8hh/jf+VO12+6obWe4GfYYVzSMd9Qof/+VB1NMK+
         WpYjMQkJ4rLR0Fl+c91SB7WwSTpohX+l8NSGf493aGTmS5uPx5INZ+ZmSM0RfjaOnPJu
         sA5w==
X-Forwarded-Encrypted: i=1; AJvYcCWjraLSwDdb4H1xNz0FwPf5J+561xP+DKuIYYiMh3wDEh24m9kakxUtTx3t94QJvVBJMMqqIByWxg==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxD8B692LqvbFT67f1ox6n25Es71v8ZtdpgWzCbn8s2Nr+NiJh0
	ivofHnMWev6WkW5hWTAgY+a0xzIXETt03gbDb2D/w0/yHqlIIK6MM17DYkqohCk=
X-Gm-Gg: ASbGncvkj/oxgf7Otr6z/1iLdjTLfMxdy1qiuFIaJPo9AYDzgSGadgomaC0yUc9iiIA
	6RpPFovTeWsQtr67JcZutmV4cxF3lelkT7gdKr5qHt7tUgposcLbGiiVQ6IKmPvyRtDpce8slBF
	ZQOwpaSFJj3lIzTiNJmLVvD7qP+tR8irwJKh1ReWgcQaHwO0owimdD7tHy4jUiXYCiYW5QOSjKw
	nPWpCoWkVI7ZxeTni3fbQxSHfJ2yCFY/JYMr9+/bx1x6dUcxnO/3kmshX17aktdKZvYw/1VR7ya
	sHqBgERrU4EmWY0smyQiP6mtA54ErVCWVHAyBxq6
X-Google-Smtp-Source: AGHT+IHeGBKteZmV90iEAwevQ+/YEsNuhwtOA9wgzyloVJ45JhHLHkQKhA5ThIKxTJ4fmfDgrWANWA==
X-Received: by 2002:a05:6512:3b26:b0:543:bb82:f402 with SMTP id 2adb3069b0e04-543e4c40552mr751354e87.53.1738161965034;
        Wed, 29 Jan 2025 06:46:05 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacb3ebsm21841181fa.34.2025.01.29.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:46:04 -0800 (PST)
Date: Wed, 29 Jan 2025 16:46:02 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] systemd-boot: update systemd-bootaarch64.efi
 path
Message-ID: <Z5o_KiAwK0IsRKT-@nuoska>
References: <20250127072356.852345-1-mikko.rapeli@linaro.org>
 <CAPoiz9wANA-Tgub4G+AXs_yQf9-NyKsSOJX5J0z=qOu8=jA42A@mail.gmail.com>
 <181F17E3A23753E5.21193@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <181F17E3A23753E5.21193@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2025 14:46:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6356

Hi,

On Wed, Jan 29, 2025 at 09:03:59AM +0200, Mikko Rapeli via lists.yoctoproject.org wrote:
> Hi,
> 
> On Tue, Jan 28, 2025 at 03:33:28PM +0000, Jon Mason wrote:
> > On Mon, Jan 27, 2025 at 7:24 AM Mikko Rapeli via
> > lists.yoctoproject.org
> > <mikko.rapeli=linaro.org@lists.yoctoproject.org> wrote:
> > >
> > > poky updated systemd from 256 to 257 which changed
> > > the build time path.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > 
> > I tried this out a couple weeks ago.
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8885513336
> > Essentially, systemd changed more than just the location.  It changed
> > UKI fairly significantly, and that is failing to generate an
> > authenticated image.
> > I was able to bisect it to the systemd commit
> > https://github.com/systemd/systemd/commit/2188c759f97e40b97ebe3e94e82239f36b525b10
> > 
> > I ran out of time to bug this further, and meant to email you with the above.
> > 
> > I'm hesitant to apply a patch that doesn't fully resolve the issue
> > (though Ross might have a different opinion).  So, if you can manage
> > to fix the systemd UKI issue, I'd be willing to take it then.
> 
> Ok I will have a look. oe-core has pretty good selftests for uki.bbclass and
> systemd-boot so I would have expected them to catch major regressions, apart
> from secureboot which is the addition to them in meta-arm.

FYI: discussion and analysis is happening in upstream systemd bugreport
https://github.com/systemd/systemd/issues/35851

Cheers,

-Mikko

