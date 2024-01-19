Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7418BC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:52:57 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.22486.1705672374927049298
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 05:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=sIi/Mp8G;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.48, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-46988038b26so224299137.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705672373; x=1706277173; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rkdUORb5tEoEkRyIw91BCxWmxigkVtHcpoxaxZdr0Y=;
        b=sIi/Mp8GEZkAHltxRPrCSkb/8h3IfmTLnFz0R199plj5nYWQia9P1A6qh8jOUYGwGk
         u8A7ke2HpawTdYqSuf61YmCq2yTr8/tTnkgoEdnNvo3teRYQ7BJY0VuGe8bF2AnND54G
         HhWmh6DrAYHhEfAH0RnyiEt5RTK5OIuQkWPmmSi9ebRACcMjL0fzhwQZABAHGtD71m1J
         rjEqyVlikzXNLNthe9QdClsA4ugmBKGKrPsAykmq/Tlq7SUIQsDIua7PuaO7pFpaaUky
         jBDxlkStrPN6PPot+7oTL6ls6E0j75RJDcI2Z0IZD1xD1Rq8yrkoxJ8balKv48JZ5cfv
         R+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672373; x=1706277173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rkdUORb5tEoEkRyIw91BCxWmxigkVtHcpoxaxZdr0Y=;
        b=fX3tB1Bkc22M74etqU6kNUcFgAfknKYbZf2WfIiiRgwobeNWepExU7Ye/OZQgx/FBV
         JTQx9ErWDuzRFyEqi/OeSHIsRklioEQY6PXHod68HgpI/HFpWlJbtx0Md617TSnQBqS5
         EVPrpddezW17fMXzQS31nuSClhQ1djC7dKCuEjKqoZiQbIsr2YjRF/BugD/YLhyRTOdq
         JfXgmaQNe0atXiPpdG1CCxjjIwE47EAk++PDgV1rSEJs5nPwnzIwHGxFQZPSGbZJyU/C
         edZJsZXCuOFUa79+4H9cjNbKX1Ngbig4SkERxlBqMzlnljRk/BvkJy6mEmE1XiYrTO1N
         Balg==
X-Gm-Message-State: AOJu0YzyPWTBUUGu6v+8OIvAVwsjEQVGhYkiY08IH8lHWO3r9H7CKtlU
	KaALiMrY+G1wR5dnr7YaNZmaIaP7uJI5JZ6XIkd2aWEQzKRfoY1sv8xtfly4EzIc2le+BcobVzI
	=
X-Google-Smtp-Source: AGHT+IH6tWFZwK7kQRFW2llbM4BRbgz/FZEkJnOjAoz2AOWvVDSJn6Td6e/+WWGWGDxmZGWBAE8Q6g==
X-Received: by 2002:a05:6102:f09:b0:469:9e7f:a65 with SMTP id v9-20020a0561020f0900b004699e7f0a65mr593774vss.64.1705672372964;
        Fri, 19 Jan 2024 05:52:52 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y10-20020a056214016a00b0068182e10e28sm2032680qvs.48.2024.01.19.05.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:52:52 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	vikas.katariya@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Downgrade linux yocto kernel (N1SDP)
Date: Fri, 19 Jan 2024 08:51:37 -0500
Message-Id: <170567229733.3021912.13398080351806845039.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240118170445.564619-1-vikas.katariya@arm.com>
References: <20240118170445.564619-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 13:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5346


On Thu, 18 Jan 2024 17:04:43 +0000, vikas.katariya@arm.com wrote:
> From: Vikas Katariya <vikas.katariya@arm.com>
> 
> This patchset downgrades the linux yocto kernel for N1SDP to 6.1
> and removes 6.5 reciepe which is end of life.
> 
> Vikas Katariya (2):
>   arm-bsp/n1sdp: Downgrade to 6.1 linux yocto kernel
>   arm-bsp/linux-yocto: Remove EOL Linux yocto kernel 6.5
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/n1sdp: Downgrade to 6.1 linux yocto kernel
      commit: 1c21b457dbd02e2bf65b51133fc9987c009274e7
[2/2] arm-bsp/linux-yocto: Remove EOL Linux yocto kernel 6.5
      commit: 1cad3c3813cc52c89010c081b70a28c1e0981e74

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

