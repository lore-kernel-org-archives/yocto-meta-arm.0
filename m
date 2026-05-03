Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8691CD3424
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 14:32:10 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24870.1777818726431625570
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 03 May 2026 07:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=f8aVHlNl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d6b9bca48so48930401cf.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 03 May 2026 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1777818724; x=1778423524; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSr9IlSEe1ufJmsr2Do7E28ZhArEE/ZXOXTCwty0TOk=;
        b=f8aVHlNlZ8QoaBETcuCv9W0sBcABUrhqXVqlUDdKy/OC5T1KEFeD1TZC0BRiDdjfIv
         JgyQ8gAbco7lmGgG7uRWn5MYTJWyxYO65d9INaNRgUQKhjH8/DG6suN4PPeB39zsMu7T
         iLundMXYGh3im1gfR6rxVouhxJM3Uzlvh6m+BiTLPxQkdknluMoWtg/nqDdoyqb5Fitf
         xX4fJrexh3XQavoHV7cw7Bqxvm+y5iYZy3NTmYmgwsXaRcSM9dnE/jOm6CuBElipn6QA
         5LJ94Qtec+eA9nwP/zBayJPWkbPEuQHQkLJGukgnVfH8nKMMBVeU5hM0xf8Mah5y80VN
         /QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777818724; x=1778423524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LSr9IlSEe1ufJmsr2Do7E28ZhArEE/ZXOXTCwty0TOk=;
        b=XXFSLOR5v9emmVD5sSmRgCiayMb2EHwwH32FuGd7JVnlpGOxD5zhEUYUaxzcvc6Ne6
         XqoKtFzjF3d/iVBHr2Fex5L3qBUIhQGc9Ne9caP7JlgG984pvtXCXhZnxXdWTDcNbPQM
         /uBqR59AQ92VfOBuq0QbhZ+QM5Vi8FXpN+MytpiDN93L442QyfpKzVGXY20w7/0sFkL2
         A/vkojX0El9JFXovEaAsJYXyesX6jkZRc8T/4zCqH40lQJi1ctGvi9lAe+kt4RnABMaM
         OSbhcJ45F7ZAnBtP231HQ/Tkd7Zwn/SyVfhoIov3wtWTWmEsxJo8i+FMT7+DVumHvGVp
         3f3g==
X-Gm-Message-State: AOJu0Yz6KBv7f0Q3WnxrrdlxGff4kEkLlPZ7bWFcDGCftX1nM5jQtkzb
	KMDEE6JY6niFWRUhPTd6USPzwPw/vK0e2HGMCHCK5O2q0xLPqrYf3SN8Jpzzs29sbRGYd5xukoE
	VGR8=
X-Gm-Gg: AeBDieukc0E5p+xT4HLa/gOk5DY8HIIXfjS0o1pyN5yMpTyrRYheMKZumBek+ilzP6X
	7kwfzzExZFnAGYzS+2a4qHO+I1H9t6lhmMiEzuyLN8Dwc0he1iQ1ffgkLsuj6lR2F1Gk/SNgKkv
	msX68Z34Rz3Vg2/Pj5JWDtQkwOCD8ZPYuvNqrAWYEBBrzO1ueEgvUk7oqjw+7/v0N4tP+Kp1DqV
	93ekUTtBXtVr6zKX1vkYG1esEHWcnF2Pw/K0WLWRKNdRI2ZNALhB4GIea1UWiLu7RXUGWrV/Jx5
	znZ2wP4CrjR7XP47aAphrK/8/ZXlKft34ndpOgedIercmFNn3udkZ7zfk1M4P2suqSCJKU+Kogw
	Y5W2nWVmqGbztSg0di/7gkrpGetZZrV4JMsqE2SfeWkSb20F62+OnntguDKTfahpus4lYrLURUU
	e82EjPMrmQmJjkuHgTcEj133M=
X-Received: by 2002:ac8:7d85:0:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-5104bf3b42dmr85560931cf.37.1777818723869;
        Sun, 03 May 2026 07:32:03 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa6f5fsm90873016d6.21.2026.05.03.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:32:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Michael Safwat <michael.safwat@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/u-boot: fix Corstone1000 FVP detection in patch set
Date: Sun,  3 May 2026 10:31:51 -0400
Message-Id: <177781871146.1774488.262926738892302388.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260427124338.2280651-1-michael.safwat@arm.com>
References: <20260427124338.2280651-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 03 May 2026 14:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7034


On Mon, 27 Apr 2026 13:43:37 +0100, Michael Safwat wrote:
> Update the Corstone1000 U-Boot patches to detect FVP platforms
> by matching "fvp" in the device tree name instead of relying on
> the exact arm/corstone1000-fvp string.
> 
> This fixes FVP-specific handling for Corstone1000 variants,
> including capsule image selection and virtio setup.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: fix Corstone1000 FVP detection in patch set
      commit: 325134ea69f74df439d56ee00b97947a3a4dce77
[2/2] arm-bsp/u-boot: corstone1000: disable EFI debug support
      commit: eb9b2afff9e2f5136274c9bbbf6b711716db1098

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

