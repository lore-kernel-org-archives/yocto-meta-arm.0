Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A20C71153
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 01:42:19 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4632.1693359732082745435
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 18:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=lWA9E/KA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-76e09202322so318538585a.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 18:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1693359730; x=1693964530; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XIrwMp8zlq1/XDuFJAtAO03/6UDrf1HFtcmtKWa3S4=;
        b=lWA9E/KA2f+EzRRf4n2IGmYCEmy1umaEww8RWprbcm/+ez2T8ouVZfjkKbYUoMEPMa
         7RlkPiXa7hTLK/yV70c1aJvXMww057aH5j0PN795qrCBW/CPjJfNfBmMUSbOIGMGCHlV
         cPkrd3RgUTrpZBRSxHdkoJQpI1DRqhCSxqFvy5/WG1zjIj4aZB6crp5VH6dSAKtX9/Xp
         NSIA2sb/GO5e4W9np+1dpmRWDOAFEvXQIAfvmXvvOjqS8a5a8hjxkWiVp0Lpw9JCECFN
         DSSi8FUfM2cHB+9vzG0JUTZiFQPIbXtFBWIJ010Hg+P2C6pwgI9+MVfhIXnyEVwSx1It
         R0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693359730; x=1693964530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XIrwMp8zlq1/XDuFJAtAO03/6UDrf1HFtcmtKWa3S4=;
        b=f2LunCcdPYRFUt4Nk6s6ZCva6hNJAgLR3y536u9jmD6iEyLvM5aOcPcfJo3J6DBQlD
         4k/i4hVmFfMiHAXIoIp4/oBuBqC3InDQAniYbXTAh1/RWF4RBh8wTlxs3x9WkrSyYS8Y
         IXH/Kp/3GyGfME/LjDcGkxl6waZK+XFKWThtpyZXSEri+Hg7PmFcRF1B0qQOImhixKRN
         1gl1RLSBGYJu79mQELFX6uAJZMbCULvNM9Dt/Bi6KiwgqCDj2Iha1aNskjFA/A7wFzTQ
         EakTTohWzFUsDPAaygQmFYzENrpLp5GveNmLzYSs8dwwxyBvEcguiRib+kLUDtzBwcLB
         dVLQ==
X-Gm-Message-State: AOJu0YzGJk6t96rTwZK9C+CzVPz/uKeZ29/95KJhpcx8MAcU/ICUxBoW
	XuaOur+iBsILlUyhikhsRRVCLfCvlIlluKYjrRI=
X-Google-Smtp-Source: AGHT+IHqU/8rHlzWhXKZ2SuY5GGJ7pZNxq1IM/iFZNxg7uYBawHdL0T4R8J1b5QLJ3+FeJ0VxOIJzQ==
X-Received: by 2002:a05:620a:1990:b0:76f:339:96fd with SMTP id bm16-20020a05620a199000b0076f033996fdmr904747qkb.23.1693359730671;
        Tue, 29 Aug 2023 18:42:10 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cx22-20020a05620a51d600b0076ef004f659sm3481266qkb.1.2023.08.29.18.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 18:42:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-baser-aemv8r64: update u-boot to 2023.01
Date: Tue, 29 Aug 2023 21:41:55 -0400
Message-Id: <169335971720.1852220.14223635362089247260.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230828163021.3683277-1-jon.mason@arm.com>
References: <20230828163021.3683277-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 01:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5003


On Mon, 28 Aug 2023 11:30:21 -0500, Jon Mason wrote:
> u-boot patches rebase cleanly to u-boot v2023.01.  Update to that and
> get rid of the legacy version of u-boot that existed only for this
> machine.
> 
> 

Applied, thanks!

[1/1] arm-bsp/fvp-baser-aemv8r64: update u-boot to 2023.01
      commit: 5c7b2c18405c4b16dfb8de1647946f7596999a84

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

