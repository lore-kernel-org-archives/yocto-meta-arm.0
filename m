Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD78C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:01:31 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.19658.1750168888490693931
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 07:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kznPaxvX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d0a47f6692so635798285a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750168887; x=1750773687; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kKQhMyP18oFpVKyDTXEk3DhkeReum40oO8LreSfAGA=;
        b=kznPaxvXp066kUgKre9CZV864HTxQDAY4CPxOx+3HfNf8hsA+G4ctQzV0oNocFtXkl
         hQsJKC0M5141yEo1h0HG+xIB6C+ZJkYMYNVUXVT7Xtqsgox+2DQdK9//6IUpzRot7kgb
         P3Xj0XEsH1wpC+kRZeO5dDV3hK3AjXwDpoD7VJ68T5/uKU7Ho9RtAdMFfqoVsQslmrcz
         33A/kiDQRaYHQHauqJrq9/nvmediyGasOGKfdztvU5XkCikZdUzpA1LQauiJ4Q8D3ur5
         Qk5UXcrPZoOMQeWEHi8LmEAoXmIEhtBjpmcbz7gY9RampEBCnamcL5yTLCpMTxkNwIag
         Q3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168887; x=1750773687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kKQhMyP18oFpVKyDTXEk3DhkeReum40oO8LreSfAGA=;
        b=iE1T+Q2v3igGQWy4wKfHkIxMQ9GrAIjtYz5k2aTk1SEndcp8drHLK4HWNvVU5AaBL7
         doCQaPF2XnsSp9aXDmc4N5SYN1XGz0YngASUprdtl3RevPGv78Bb9qKxImG1qfUwf8x2
         ojqu1SRCGP7SJiZssw0OHxzkTngbQZ5WCSDScrHyF7lVavuRok+3DPFUS0oHSB3oahTF
         MLRA4Km5dW5vbW1nDK0abRe6LgoB5Y2igcPcupmT1PCrTTlCv1zpV4AgajgJ+0KYgNZT
         WzLBwu7MNv75q0vVlnDi2f/exTBL0/z6zk2f5rAZQSlr/muzzMPq7QtEziGHUK2vSYvf
         yaHQ==
X-Gm-Message-State: AOJu0YwXCZw3tZcviF4SOiH8AmGZ2f9FQ/MqChIkv8Ib2kjtSV4Cv+HE
	hegsS28X7j+BPTHylM5CBWmq5z5bGZBVaVmBgRFHAZX+nKzhBB1eApxiF8q7uUqgNwTZ05YblXs
	NAQk=
X-Gm-Gg: ASbGncuM9iXvV2Qj2l3Fk25y94WXpwszusQsf+oB+vmJEEY76V866w7Mx2o8KsShTkx
	1DVg9gmPGB5du9C7wQ8MwbcQB5a4lqTGNTpkoajyCtx3W9LSp8ww2nW7IyucwqGciRv7QmWJIOA
	7xFUReie7Q/12cWYFph461IHQseUbiFpVMwk1vg9sJ9tUktmbWAGI6AkXJWrDNHhGueDyReCMF3
	EXW9ETFIv9J8Kzzl7yoTZzSawJVe0aYbGQUCmuoZlNnjYHqGF3v8GRA28dQt9lR2y6L0NeQUh9X
	hM7cRIP7e7VK1bCM2dALVLIOeYL9r87rMJQLHkqGGAL/AlQXKnm/rA==
X-Google-Smtp-Source: AGHT+IGER81GuecxVUqeV9nzfDkeNOSHwX0XenmFfCGbKI5lmmBUMk7dGe02ZeGwK3Bfq5sTvhxRWg==
X-Received: by 2002:a05:620a:4115:b0:7d3:a6d0:dcbf with SMTP id af79cd13be357-7d3c6cd9f92mr1820120485a.27.1750168887125;
        Tue, 17 Jun 2025 07:01:27 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eac10esm650166785a.58.2025.06.17.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:01:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] arm-bsp/trusted-services: corstone1000: Update PSA Crypto patch status to Backport
Date: Tue, 17 Jun 2025 10:00:46 -0400
Message-Id: <175016884823.1970111.9536261483298666774.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616055605.372335-1-hugues.kambampiana@arm.com>
References: <20250616055605.372335-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 14:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6559


On Mon, 16 Jun 2025 06:56:05 +0100, Hugues KAMBA MPIANA wrote:
> Modify the upstream status of the patch to align a PSA crypto struct with
> TF-M from Pending to Backport as it is included in TS v1.2.0 release candidate.
> 
> 

Applied, thanks!

[1/1] arm-bsp/trusted-services: corstone1000: Update PSA Crypto patch status to Backport
      commit: d8a93ac113a1a495ec3499b81d144e2f00aeca86

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

