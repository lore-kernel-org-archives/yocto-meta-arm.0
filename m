Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BEDC71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:39:21 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.9348.1749818342606051946
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jun 2025 05:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pmiEpuge;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d38d1eae03so186435885a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jun 2025 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749818341; x=1750423141; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhfDf6irxtOTBiicLqeVVHnjbWYxPKOCQblPg2kk4pY=;
        b=pmiEpuge+idBTH/2JJzeJwFNR1Zq9esLf67htFJWKoxz5Ul4CMXIKt5XAkgb1mQp8u
         s3yRYZj3yVS243/hP/59pFYqrU7+tpuj2f/0RHlROvcuw8hVM6tkyEbtFrxufiG7BMMn
         Uq29sA1fO8nZ4vTb3zGDEprXU7Ovu40mqEKEKHugGoX9SuzLvggx+pH45xzODNHCNKFV
         0NO3jAmceHZcl4JVLGF+sZvGd/YlbtRRioyPiH34Nhxbcd5IqXjSgLPaaKspo3cYRC4L
         U2KcKOGSJG5UoOm+k/eeEsCevtqDQKQ+YIx5+SEJG+9OJQcGU65SZs3VPOmE4z6v0WDw
         8XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818341; x=1750423141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhfDf6irxtOTBiicLqeVVHnjbWYxPKOCQblPg2kk4pY=;
        b=Nr8fY8Ny4hILrhvX9xQw1z7cMnn08k3xyB9G2b7gUEED6hGBxS+SR4rCfq1CoXYWGI
         WuPZcNR9VHapI/8u6ZX3UKLP912N/KHlM5R4SVM3HjmNa6ihliYl3uqybQ7JPSP9Jiui
         KjCg3MwxVjTQMtbnHxdpoklg9ZBc4DAOeSZeL+SRf0jiMzHe4udop80ORxrFsU9hBVt8
         vQo/c742lozeejLeSJ4ixq8zHn9V4IVf9GFYuYUhRmGR4Bjmhb7KMDA7ACr+oJQaGaVd
         XOTtFoho1X7TA8FdABVo7peqjMyrQM1C9aWp1uFHsvRBOmB0327yWaU/ELVeXF8OsCn9
         bk4w==
X-Gm-Message-State: AOJu0Yy0itaxApmslXHLij/mXftz+gGGJuSiJ3iJUjE1Y4HTizcWlcJA
	2sUOMVhHAM40eSAhmUKzmiABIFA5PxIaOtmXxM1Knk/KHV/lZRNWotrczA7vjvbTdfPOdvK9e3L
	qOrafuA==
X-Gm-Gg: ASbGncuGv5NFW4d2oNZ7vjkAksYan650p99R6Y6CqSP59iUn5k7eVU8kQ/hZk9J8Ggv
	bunEnArBXR3A6/S9YrDu9lvu5BzwRx2lTbyKf4LtN9QvEeaTCGPDx1F+xgXXCPHQJI6he8Tjkrh
	9fUgaPF7/U8ovzs5cfGh6BMXK8C+rnGZpd7qcYeZQKNSO5VOq91UkNqE3T2MGg7f6dZEuEEzUvG
	WiatWkJc7Os1DMUSPc5ZaQy/UI77ixLIOIhXko8mt4x5h6SGoYwOaxLdN802+w0QIsZiACJ9Fc/
	UbqVBLBKzgvQbnxwhkj3UjtOl/DQGV3LRNLuwZvUqJXS2f4o4TOdAg==
X-Google-Smtp-Source: AGHT+IG9LRz/vGLWW3ZMcQGQgsxQuZYz+BvT1kbgcVyHiL7evo9s6FGoXZYcUWOdFUA17xV8g/PWSA==
X-Received: by 2002:a05:620a:40c8:b0:7c5:99a6:a1ae with SMTP id af79cd13be357-7d3bc3053f8mr435718785a.0.1749818341408;
        Fri, 13 Jun 2025 05:39:01 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dc9e15sm167915985a.9.2025.06.13.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:39:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] CI/fvp-base-ts: append the testcases
Date: Fri, 13 Jun 2025 08:38:50 -0400
Message-Id: <174981833026.1355268.10743072814785525408.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612130541.88191-1-jon.mason@arm.com>
References: <20250612130541.88191-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jun 2025 12:39:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6548


On Thu, 12 Jun 2025 09:05:40 -0400, Jon Mason wrote:
> The test cases for fvp-base will not fully run because the trusted
> servies ones are the only ones (instead of being appended to the list).
> Correcting this issue so that all the tests can be run.
> 
> 

Applied, thanks!

[1/2] CI/fvp-base-ts: append the testcases
      commit: 690a9c4d0bcd0c15b6ce61e53b65b8585a0f7fc4
[2/2] arm/trusted-services: use zero padding for unions
      commit: 2b7c24760edd7f168ba6bb1c87488cb8069dee81

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

