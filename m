Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107ABC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 13:03:19 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12079.1787749395890427229
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 06:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=LNHD6dY5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 74.125.224.54, mailfrom: jdmason@kudzu.us)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6682259cae6so1331052d50.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Aug 2026 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1787749395; x=1788354195; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/MjOwo9nWgpEPJcyTeKUseEaoIPC7uPfEN4D8k4+Yw=;
        b=LNHD6dY5G+24NE6J8CY27hmACf8kRdBWbKVGYhwriYmvbE2JY3GXlwpA2oUUjhltET
         oBhYNeU5aFZ0mTHyFABkz/X+ixxoeFOOIlCy1HFdYuvJZAOLx9gBXv/aY9pDTk2Zr7T+
         TB3BXWEhMa+CM1+fXTwvAYkxixYfD1sbrr7QPOgzj5ghK2aasqA7hj6xNsQqyExVOlne
         qYP4l+qRRLxbEQnK0WU/qIIynMZK/5ZiCYbBTh2+YjGRp5DINm6aS0DuVW1B6PNpmxgO
         bLWLBjl0Nis0wnBvorupVye/+e/KoyDV+Wdrg9Rz+b156z+HKWczjkEBfLABQy8klI/l
         ytUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749395; x=1788354195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/MjOwo9nWgpEPJcyTeKUseEaoIPC7uPfEN4D8k4+Yw=;
        b=AWvx8jBdXVnSqYlNOHKaymkMYI7d8Id6m8QVWN0L08e8E/E0ziZ2O0Ptj/5DdlGpfp
         aDIpJXwO7R9drmGEmhT1qzReEpDxN0JdDnFWI8UXb+65x5E69d5RyrbImXwKffJ/fBnx
         xe72vFIRT+TfOdr7EkSJ96dKkkPgdIXz0t5JlsXcliTh4ATCOxkYZdSGy1hpmKbnPPoB
         bIBtwpPyRlywtSHvq+pnXYW1RlHghX42rCzQxAHLw7AmjpWE4Ygqi3OvrNGv9UZGd3R8
         +E5p2efFJP4oa+yiGxwuZIGNulA3QfJlOvWkDIx5Vp6GDtiNywuhRhzLVvo9SM+c+Rjz
         hh2Q==
X-Gm-Message-State: AFuF++nyWTWcIuTw3tttBfGDjwdOzxT8eZkiNeJCi4czPmaX7R00ZaKF
	vOfYBjb3GoXssB2xzr/rvP82cEYbM9ik1PS4poABIakR5WU8Skja4cmmJW46gTwGZG1NJctobMe
	P3/KtpA==
X-Gm-Gg: AR+sD11t2ZgPPnqrJCHk1qSlpfX5VKoncDw0fGlP7U4CWrW7xtmicU8Wsjr6gvj8Xo8
	bWp50+rTu10KzNp18QHfUyd/TqjHkiBbSrVEWY8SUu5KTd7ZaMg0Y78FRH01enVCFdxLx92HYnh
	t0krFIwU5OpFRJm2n2AdZ0v1G8x5Iy7Isr6l4d0/ZQJaf/xBsysIp3mirmld+ruuOO5P+HPc5AW
	+yMkciphktR9Z9eWZ2h4+12do39FohFhpPrnhQoMInv78IsNJxStqYsuiID9ZuvWFQ1TdyN0VVh
	HpTFDWXrW067dFrD/kgtPDSXA5s/jf22dP7CBlZ7BM1Qc1BsKFaIQIEaV9eM97mnBOzBW8hgIrD
	ka7BS1Tv3Qieydp4XsUSLGrJMTuFlNmbs/lNWxfyKgUwRZPGhvDEQXbUuidlN86u1UyIUNFYeOM
	cwvYqtIXoX23yOc+zWfcX3mPl3M9VbtowY9D8QbS7M6xr8jE1+yslFJ4q2eHPH
X-Received: by 2002:a05:690e:414a:b0:66d:16ff:2126 with SMTP id 956f58d0204a3-66d25792f27mr2183708d50.30.1787749356883;
        Wed, 26 Aug 2026 06:02:36 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc6507b0bsm25228026d6.31.2026.08.26.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:02:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/uefi-secureboot: fix race with secureboot keys
Date: Wed, 26 Aug 2026 09:01:02 -0400
Message-Id: <178774926272.2785779.3332812066958255011.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260825174302.6960-1-jon.mason@arm.com>
References: <20260825174302.6960-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Aug 2026 13:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7144


On Tue, 25 Aug 2026 13:43:02 -0400, Jon Mason wrote:
> gen-sbkeys creates and installs the secure boot signing keys, certificates,
> and database used by U-Boot and systemd-boot.  Both recipes require these
> files during do_compile, but there was no dependency ensuring that
> gen-sbkeys:do_install completed first.
> 
> Add an explicit do_compile dependency on gen-sbkeys:do_install for both
> U-Boot and systemd-boot to prevent the race, which was causing intermittent
> CI failures.
> 
> [...]

Applied, thanks!

[1/1] arm/uefi-secureboot: fix race with secureboot keys
      commit: c051ce752398a454e7c77ad60b3d67e3ee465c3b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

