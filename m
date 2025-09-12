Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC28CAC58F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:51:55 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.15865.1757681513727159244
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 05:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=KguPPDMh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-81076e81aabso156156385a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1757681512; x=1758286312; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtvnTCQKiMZVzyk3MhqhLr/Hbx+ASI2Zj1SsXCRCM1w=;
        b=KguPPDMhNrdqUGMPixzXTsVXyhkdphueiQtHYotKIjECAhBq804xKUdWW0a9MIrh2q
         mR91Ry3nlHR+ZmBujsETaQyT7v93NBQFaL3VGWd8qn0HI3/R8UFpZQ236FvArBYd6g6D
         3yGMJIzxFeZD2mLHH8MZ2OYvXx3QxjaSVWaXvfiPweOyVlKy3WrIK7LX4/NAl6BPd+zH
         Lh77IcZQyhOqfmtLtkPjzUhfySmioI6EXI+usdwY4SJFqQp61NkEU+f+V0iRr6zHAyfg
         TS5dGmipCdDAgYiBfbjyOvm6bnxSgTNaO3eE81wkSYTRGeLR3gRqLsWxkBIbmM13CPk+
         mysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681512; x=1758286312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtvnTCQKiMZVzyk3MhqhLr/Hbx+ASI2Zj1SsXCRCM1w=;
        b=ZghMyg9zRcrno0qyhyvIBLV/ts1u6eJijKjXhPKC+Aotc9QRUXNiBCDFUwxVOhuY3K
         1XijJAT8vaanSYkJEHKyeafdlPelITdG677JK/wbdWiBpVrimMp4zyW9/PcjSN3leXsK
         KO7vwcwRYrF2tg0YjrdQVz28rhbUAvsM2xLKueM3Px3MVNqR+X1BGyIreIW7XMzi0A54
         9mDYXPbleXKoMbWNuYQ9wcrI45qEwMdF2uXmvSCblnu0IIy4hUhJDP8YQ/ZfVqi32tyS
         MZ7N0IEObeDJYMwdW/4dG6jYtmbRHWUaHoBaj8yf7hjSYB0Ur7yNQJERh2k62i0oBNFV
         KWnQ==
X-Gm-Message-State: AOJu0Yw5a+T3r+MyNhGGEMofDsUl4TkNygte65hBL0V4MKjp3wLh0mjx
	UVl5w3FRpvexJs/siLCyxcTun8OMdhZoU0EqV8U1oSrYwBRLWm4Y65K81JBUstExuplDMxFGMD5
	rZ3s=
X-Gm-Gg: ASbGncvz/E15mUo70rnwUlaWcgVX+QZoi0YEkhGoac39hbzXshVDqmTgiJ05GpJiaGC
	9f40XULO7GgOZvGZ6uqQcyLyAwDSLTAvonrKDw8mxKESKmvaR1IMATssEOh75tCuErtIJdZP2n4
	vQa318n02fniyVMd0CSONXg2TvcHbUZaKi/1U5w0jwfClm/G/pbvE1F1ty787IH1H82tD0Ex7lD
	hqwhDXxsjfTldv5LxA67Hhv1oxQPaGmsyEkw0j+iUa1XZbcCE/y8MAKuEvP5fIHkPQbqFO3/u0o
	70YILXoN09RaFIpuKrA/vUN8qjUlHlmWb0+nMw/VIZChPiNzlX2cs6ROhdxnO2hV9MxlqAOhLJ/
	e5UD1dMHnjg4wuKzeAn3lVmz0q5DgcefzXmI=
X-Google-Smtp-Source: AGHT+IGuk7gNcY27O0j4SigSjOPf0GZIULPyFpY5FKENF/MZs31Hf/TTs9Ve/0FwjDETohRgG3H0GA==
X-Received: by 2002:a05:622a:613:b0:4b5:f54b:a7fc with SMTP id d75a77b69052e-4b77d05c32dmr27352051cf.3.1757681512295;
        Fri, 12 Sep 2025 05:51:52 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b780290365sm7562191cf.18.2025.09.12.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 05:51:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: Re: [PATCH 0/3] Add new recipe for Trusted-Firmware-M v2.2.1 and upgrade Trusted-Firmware-M version to 2.2.1 for Corstone-1000
Date: Fri, 12 Sep 2025 08:49:24 -0400
Message-Id: <175768136749.537781.658093651402426439.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
References: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6702


On Wed, 10 Sep 2025 13:51:09 +0100, Harsimran Singh Tungal wrote:
> This merge request include changes to add new recipe for Trusted-Firmware-M v2.2.1 in
> meta-arm and upgrade Trusted-Firmware-M version to 2.2.1 for Corstone-1000.
> The move to Trusted-Firmware-M v2.2.1 makes the BL1 code larger, while the provisioning
> bundle can be trimmed. At the same time BL2 and TF-M binary addresses now need to begin on
> a 0x100-byte boundary for Cortex-M0+ based platforms.
> 
> Key changes
> ===========
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-firmware-m: Add new recipe for Trusted-Firmware-M v2.2.1
      commit: 5a34655c1ca8ac5cd261ffc71e6ed10da4b940ec
[2/3] arm/trusted-firmware-m: Add alignment checks for Cortex-M0+ based platform binaries
      commit: c7581dfab24ce3859151f556102ac0254635e423
[3/3] arm-bsp: corstone1000: Upgrade Trusted-Firmware-M v2.2.1
      commit: a059fc317f5b16458e0c19f3632e81498c86a73c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

