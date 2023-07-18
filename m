Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0000EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 13:11:09 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.7111.1689685865873323581
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=4hcbBZCe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-765ae938b1bso524670685a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689685864; x=1692277864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liSG/6PQVg+tCNl3EyWV3x1aE+O0Mqta+rJQ9A6NvJo=;
        b=4hcbBZCesJJnCpzZickbg6jrKUn403AFI0OvO5ou1V1UeDVQNDcVK/KPS5PUWXe96c
         X9M2WyhF2rv0k3xZgUMefn7l+Yt4vSYi6xExcvBUdvxJjHM+NMoIFCyFdkFhdt6zkalr
         hYfbBcoV1NuxZGCD6x+KxaG0BsBVkDYnx/lAj0dwnXpo+eCFmh2xA0vSu895fuCjg/uj
         NsKNIucoRuUBoqMQYIWg8/r2uDK1J3ATpljjpf77G2SLPvWh0qLTFrKg/jind14QOE+u
         kcB2yxq3WEmYDFd800wnwwu4DqN/FzKllERTwCynYKO3GpuKHRHmIn5mN1F7oUA+4HAm
         lPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689685864; x=1692277864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liSG/6PQVg+tCNl3EyWV3x1aE+O0Mqta+rJQ9A6NvJo=;
        b=R3Dma1cUP6LEDTin9XeDoksapVeS9fk0dYvCghboGshr1HtKSbdSyzK/q3BcjUNadT
         S49kdaxMSNamtq8YHGCNYYFksuSXOkoGBXPYI4/Uykx/mxl5pSRfskc//kmum532PPlc
         FiM4rBxx3YqBz0B4TxauIwVdR47M4SPi+H1GMCSyJ/vA1C1KA3J/VSU0Ug+LF1r8l3hU
         HUpf3cVjnL3NgZeoR24Q6eYl66sbiKVfNA+Wjlnu3nVwIf9pWIus2bc2dPNLADIFdp30
         RKd8lTPohljnREufUZkG4+MWrRAgvY/ab4yNKaoI6ooRMSB1eMHBkmbCYONUCqpNaSLV
         wK6g==
X-Gm-Message-State: ABy/qLYCS8pxVwPgOP4ov29oVadI4KD6ysuKyHQU17nekdaEt895FUVf
	Ul+V9//Vanv8gNwmKdej0jZKbOxx24uO/pAOuBc=
X-Google-Smtp-Source: APBJJlG11a+JJ4E3U6jUZDldq1jhTx815nmC3Z/vcCPp+ZM7oJ4aYuTfYLpre07d5MH51QSw2ny78Q==
X-Received: by 2002:a0c:f013:0:b0:623:8fa2:bc17 with SMTP id z19-20020a0cf013000000b006238fa2bc17mr13582539qvk.35.1689685864317;
        Tue, 18 Jul 2023 06:11:04 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y11-20020a0ce04b000000b00636141d46c7sm702356qvk.94.2023.07.18.06.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 06:11:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/5] runfvp: Add missing conffile include
Date: Mon, 17 Jul 2023 22:41:46 -0400
Message-Id: <168964810669.748059.18036650017041788030.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717185626.1793017-1-peter.hoyes@arm.com>
References: <20230717185626.1793017-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 13:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4894


On Mon, 17 Jul 2023 19:56:22 +0100, Peter Hoyes wrote:
> Using runfvp without explicitly specifying the fvpconf path currently
> fails due to a missing fvp.conffile include.
> 
> 

Applied, thanks!

[1/5] runfvp: Add missing conffile include
      commit: cf0baaee0bc8cf9e8f07dc397e479a9b7b6002a0
[2/5] arm/oeqa: Merge all OEFVP*Target classes
      commit: ea762113ce68d2307d7a06b2a5ea3542ff2ed360
[3/5] arm/OEFVPTarget: Add support for model state transitions
      commit: 67dabb0bee3122098cbe79becd973a7b40a0b411
[4/5] arm/oeqa: Convert linuxboot test case into fvp_boot
      commit: 7ed86c025ef88b3992530c9fccd4ab3c8897254b
[5/5] arm/oeqa: Introduce the fvp_devices test suite
      commit: 0b574210aacff865c3adbcaa1fe48d9e1a88f05b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

