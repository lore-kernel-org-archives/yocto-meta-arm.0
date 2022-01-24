Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE8DC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:56:31 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.907.1643054190740058102
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 11:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=K5pSxNpR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f173.google.com with SMTP id i14so14858744ila.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 11:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IZGKrpOkgltJ/Wcw3ojges+TU+dFYwsn0VvIzW8KeZc=;
        b=K5pSxNpR5aMPdHtBOGLwexFz2YakLLQLtNupis89xP4DNEVYkI5llyJjX5b0ZPy3uJ
         SH4GpQFsMIRy5Q3LOVT7NhwsfsKNwRHIFKAARY8fYjy6hjNLSX23F9OqXqivLj45X2PL
         ZcsESxCoiYViKUeLKrtvldLprx7y8pBCcWcm+7MZmZ5wHuEJJgazXI2hYYCk3opfESVF
         m+pBgfgHHsA2ozo5AzAWx2lHi22EFYv2/4Dil9GgCpeu+81CVXQERhltf7u0EXVd7paE
         SkSlLbsC+fTrHmovtIKIOLZWI/ZmNnNG1rBedeR4D4frQDP02Kk9bIAVkY7Cwkw+EoNn
         mjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZGKrpOkgltJ/Wcw3ojges+TU+dFYwsn0VvIzW8KeZc=;
        b=BFtQbNEeWQ4YVn5dZN5I9GYUkTeYXzhh9xLdckuCx8W2gA79TWOQYJ8B4iYAckiyKw
         8QyAa+f+pKUriy6ygomwO+i4TP6SleNV6EhzAGjmVMtiRAZWxwrajYhUYooO2nLGUv7N
         qYsCKj2ny6eyUUupSl2TwZafJg5Q+0cHB4EzQ5FsnBJFW95bs/fhF7TRYkSlIqAiFDy4
         tfK557osmDYP+hc5d+qs4Otakq0Aynjsg76eCTBHfEUtNf7zMY85CTSZdJh4aksSXkAE
         ocMA/sYTpE6snmVk7jhOz/DEdHiRJ9Slc2u054qganXtSfTA27ZuP5wJWJ0/RZMpnl1c
         7dIA==
X-Gm-Message-State: AOAM532+e+SFCMdDkASVxDVjmFyn8ggdzfQpIwLqjWmLfZbDb8IA0vu4
	RgMwnYkWlqLX6R8Uu8vX03XqWEi9eKbMgA==
X-Google-Smtp-Source: 
 ABdhPJy3uEkDD9QoNMi46QZact4WI1RZiJSrRQ94C6yfGWSNQYI3XiAn5jOM+LYcny0Jd59T8e/WsA==
X-Received: by 2002:a05:6e02:501:: with SMTP id
 d1mr9282526ils.285.1643054190010;
        Mon, 24 Jan 2022 11:56:30 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:de27:316a:4e43:577b])
        by smtp.gmail.com with ESMTPSA id u2sm7924224ilv.1.2022.01.24.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:56:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/4] arm/trusted-firmware-m: use relative paths for
 SRC_URI destsuffix
Date: Mon, 24 Jan 2022 14:53:54 -0500
Message-Id: <164305403724.317553.3790964692839974742.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124162947.3796440-1-ross.burton@arm.com>
References: <20220124162947.3796440-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 19:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2908

On Mon, 24 Jan 2022 16:29:44 +0000, Ross Burton wrote:
> It's not recommended to use ${S} in SRC_URI as S contains references
> to the version which results in a circular list of variable lookups.
> 
> destsuffix is relative to WORKDIR and defaults to git/, so use relative
> paths with the same result.

Applied, thanks!

[1/4] arm/trusted-firmware-m: use relative paths for SRC_URI destsuffix
      commit: 841179266847669f71cb2ea66d55bd62ec28249b
[2/4] arm-bsp/trusted-firmware-m: use SRCPV in the corstone1000 overrides
      commit: 82d91ee3ac1dce0a314414e5ead8cb898caf0236
[3/4] arm-bsp/optee-os: use SRCPV in the corstone1000 overrides
      commit: 1fbdea98ce2738dda827af070e0156b907f97422
[4/4] arm/psa-arch-tests: set PV correctly
      commit: ed737688f26131a63d67622ed4f8cc21055d7dfc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

