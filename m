Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB04C4453D
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 14:03:32 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12398.1769004204571641729
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 06:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nVcyO1jV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c5389c3d4cso728949985a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Jan 2026 06:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1769004203; x=1769609003; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DWAFBlxITYBE+5mHsleaki/jzbphUIU91G3n6ubomQ=;
        b=nVcyO1jVExTb1ZfCLsy73ZPZKvzsZWlRQUexnLoT2UqUc1xq8zex/d/X15XbWvvCH6
         9zNYThwjEvb3kqrp0RX36ETJHDIAEcqWzkJPV9EDEFU6ZAjaTcGPhpTWQYj03huMJiPL
         4i5rBY5GwOcRcIA6FUQTaRe13R1fdtqI8fotkPRPMMNSJEapTJDdPu/KLwJdkgFTdhqs
         C/8W5+t4D3fDUMsAAvdsH1WM5s/JWj1qUi+k2Z7Z0omWAwuVyTp2qRG9+xt5bIBHizK0
         QJ6L+0iXdsCHiDolxyQA13al2Qtcw1PyU+XIXVpsrmliQnqrirzJ5Un2MSU7YZpoz26c
         gHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004203; x=1769609003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DWAFBlxITYBE+5mHsleaki/jzbphUIU91G3n6ubomQ=;
        b=tDXLP+7KqMVRtFiSIOSPglLzieXFKsC6WXXDLJdMStQPVEQPNFXY9jbsFKqb8yWKw0
         jXQnn7IR5s2UtyAhvixM2FCpS6e2NGwvQvRCo7PUQTnCh3LADV1RfkBuqgJej7sOjuzG
         28JwT313HW9txG9r8FntqZYc6YeWEpj7R/P78T7wskbUg7QP9eYwU5TCxPXpGpJVAZO7
         JSuFU4XfkoEETdX3PIxX+k43NsOUwJL8dhY0yrzEaLj+PdcphtLj/U363P2KVSkDSqpP
         MPKNiCFCbS3/3cMz3CI5h5LxAHcFFc1LR13dFZ+2rz/18gh4+6B36F0NEI/c3K5TBsEA
         ILwA==
X-Gm-Message-State: AOJu0YwO1QJ2V6xgIucVlW1wrhSw8WYJBkzTVaPSHdzQdgWuXkuGK+7A
	QsGNo/KM7lYtJoV1TbeNSYDk2EKNZ1q8j0EJhfwI7uRxotovZ2oktFVO0lTnFbEEVNfxSBERCY1
	Xtqo=
X-Gm-Gg: AZuq6aK7iRdaufP0SaR/UMSuCi1bF2YRyRCeAiXvfPzPcVC/Ewk7Qd/0xHp2qEHuAAg
	c5phDIZQSQl3NE21XpT5SNUD0+J+JfiEIbQkgSaQKHOIopHsgYinl/JcPNdm1nDHxeirMvOPARJ
	6qUzAgkymXO30dbIjyWVcSs18Vqov0gEiicMFrUWgUFuVrJCukNMDiBDdxgpA57aLKOUBw1zNwE
	1hODkGiEkzIpsaVwRWzF+JpUQD8itOs296uoOb2TwDzOs5zUaJ9XyNGgj6ZSEAD/Cx/TqJk8hzS
	7wq8Ke/Nj2RIB28B0piYgKnUKb3uBZEyYLBNa/wBSMts3WE1Fv64fEoYegy0bRSb3YgKyaau+8h
	LP1bPkxfHP6e1P63u+vSIY+PJAW2TiZk70xUxGIUgQLg5P4jM/N6kg1OkFCM+WTH/HgerFP/7xl
	+W
X-Received: by 2002:a05:620a:3727:b0:8b2:f102:b904 with SMTP id af79cd13be357-8c6a66c82d1mr2469744185a.12.1769004202988;
        Wed, 21 Jan 2026 06:03:22 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c149esm1230799785a.18.2026.01.21.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:03:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH whinlatter v2 0/2] corstone1000: Fix Ethos-U test build for Cortex-A320 variant
Date: Wed, 21 Jan 2026 09:03:12 -0500
Message-Id: <176900419264.1958345.10544615744419905693.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260119114719.65080-1-hugues.kambampiana@arm.com>
References: <20260119114719.65080-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jan 2026 14:03:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6859


On Mon, 19 Jan 2026 11:47:17 +0000, Hugues KAMBA MPIANA wrote:
> Includes:
> * meta-ethos SHA change to include fix related to ML repos migration
> * documentation update for copyright notice year and Yocto release version
> 
> Changelog :
> ===========
> 
> [...]

Applied, thanks!

[1/2] corstone1000: Fix Ethos-U test build for Cortex-A320 variant
      (no commit info)
[2/2] arm-bsp/docs:corstone1000: Update copyright notice
      commit: de6e6fe7d57289fac5312635acf440e42b491a0d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

