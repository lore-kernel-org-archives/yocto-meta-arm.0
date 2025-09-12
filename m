Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7B5CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:52:05 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.15868.1757681516218304143
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 05:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Gik/bDaX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-76c20428924so4684226d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1757681515; x=1758286315; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5yThJ3R9KP7SRdIiCtxPv4PHHeTnY4ojOf7UzQ+wX8=;
        b=Gik/bDaXlFLpBs/IUO+8WBZx+D/DyHs3ocDEuuk+QTZIS3F57QbvR34UvLgZmZvrWj
         OJw0OqFy9x+EO6gHE7Hf6EcAbDQXs6KmHMAgbzu3lyoWtCRLuyp7LbFVQ0yoK+qnmss6
         3nZgVPqCSDqJGgy17wAFoS31J3EKhHSWeEXGBozdd7qUSAAQ/pkEtwEVdrh/ZN69AC62
         Y9fGv7T8qloRB5EzGCNa9sjxrVREm2YxYx7j8rbQYPDmbwn1/06SDRrZq+qXA/Bjic5e
         wijKddZjJgdLdNf1tJ3LI8mBzBSbYShbqAMdOG3e3TDqZY4L4755S5QXvf8VcR8FjoUh
         jtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681515; x=1758286315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5yThJ3R9KP7SRdIiCtxPv4PHHeTnY4ojOf7UzQ+wX8=;
        b=Q38N1+iyFDohgjfDz1GNEytiZV3LgCwxFLsH+ICIgrFNI2NVjtB8BIkCKkE21PJWZV
         fWKrEYDgKqeXL7KODE2iJL9vuoC4jMieGZlCfLEe+1h71MsbKu9EpCleOsZmt3K0q8my
         2RZEJ2xPnxrWQH/F2Gva8yRZtVtO6BHHeeggAygX7wx2DWODBUKr9/Y/yMFZjMSO0yqG
         BmXQhPihkv6ZrhNVVXTlRYyzwicyR7Efi2d7b8A9c2bQTd5pKOBqvfzk5pmY7T3KEMDB
         LUnkaTVIs2wBGKTPVWcgrBhVsV84kXcbyfLS9uHAvnsK3K9FxRcD4nVwvsL+KPuG5y5S
         19Wg==
X-Gm-Message-State: AOJu0YyUOH2tFld2mrnC1A0dUFwNC3fluAt4pp3vvJ4N9UbBkaLOM79G
	RgRSp9WSpbj0vD9UlUd9m9gX7ZcI20KanUpKkACN1r9PY4jujdxjWPPGWbpXeIyUJeyIQ61W9lU
	3RU8=
X-Gm-Gg: ASbGncuLgKWb0Qr3aTmztpcq7NwqydslBIvazcLekPn8IAZuV4EijmNPULJptC2FrP2
	m/FDq0zov2Ahu5qy4kXYiUeKYzdjJftDkbMek6Wxmm4/K7ujxYXzm+6/LC2qyGLYNhZ1lcw63MP
	YXRK89ByvUUrgFTY82v16eDcUUPM44wtkIxwRf0oUgyDAoPK9nNBUgcB9HNuAhUS8MbrnbTtYtY
	aUbyTZ0yx9OxknyVI9sNuqF/ktV4o2q4Nxrz7QwVM+tfS06YC07sNW1Oe8sRVnJ1aYW5gUQQETk
	A6cnEKj71XJ8MThEKMpSFQ9lbx6+Z5qsY7eQbEqJMzZmB9pQMYCTLdpnhFjIlfa0+RnWaVwDCfj
	vwrK/NAPPnCfMfNaFDiQQp3qa
X-Google-Smtp-Source: AGHT+IEDLfxH+RaIRFuO21Q+XB+O8LA1QoIUjeCPexsIIAPs3M8axLUa0P4/jd0MPw7Esdr9AmilwQ==
X-Received: by 2002:a05:6214:224e:b0:722:429a:f9a5 with SMTP id 6a1803df08f44-767c88fa0f6mr31278566d6.65.1757681514993;
        Fri, 12 Sep 2025 05:51:54 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b431cda9sm26977976d6.5.2025.09.12.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:51:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone1000: update for wic renaming --extra-space
Date: Fri, 12 Sep 2025 08:49:27 -0400
Message-Id: <175768136748.537781.14192649291056083920.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250909131349.3162917-1-ross.burton@arm.com>
References: <20250909131349.3162917-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 12:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6705


On Tue, 09 Sep 2025 14:13:49 +0100, Ross Burton wrote:
> wic in oe-core has renamed --extra-space to --extra-filesystem-space[1],
> so update the workaround here.
> 
> [1] oe-core 39d10137b86 ("wic: rename wks flag --extra-space to --extra-filesystem-space")
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone1000: update for wic renaming --extra-space
      commit: 7e193e9813bc9f0cd8893a50ade968bcd54954db

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

