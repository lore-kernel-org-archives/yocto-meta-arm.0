Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152DDC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:31:44 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.8954.1663947099565401567
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vQ0hYnFy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id r20so229956qtn.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yKE6TtR69AmlDo+H4fIGNJRnALm9jKz3PYVLPesfkAs=;
        b=vQ0hYnFym5NLXbA9LDQ59X1mj70nT4YdFZQcmIkO0BbzmJNTSqr9t0X2b9BHbN2rDN
         Ir5fqj2MoluV725f4F4CeNB0PeJ3HWQXV47AZO4B2wQDzdZHg47vsWPUhgMG1F8DA9xW
         +yeXwq33ysRU7hVDmPDP3XYESyousTrtvCPNg1mkt1ZkIbesj1i9QN+qVp1qftKY/XE5
         5EBjIQEJ2FWHWaeS7s3rFDv4OJhlF2ZK8vHN4jZuNZBnwpEnz0k0qYc8DnYpFcX7Np9n
         tcSdHYGMAaKMipNSQPx2T1yTzyZsQYpiIGOOJFammwWJs7QuP+U4xbomflO/AszoKhlO
         UNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yKE6TtR69AmlDo+H4fIGNJRnALm9jKz3PYVLPesfkAs=;
        b=d7QU2YZEpbNtJ4E7rW1OnczleRrgphGcEdOoOsiW62yDRTD7R9HCDihZAvYrs9A4ul
         nDIYr+ZOpuWk+7oElemsGqqJgqJCPD0kl4HOn2DWhPc9OY1jjSpV6xPNZvYMYxJZxkXC
         mHCEJYFH6w6UUUx2A9OpRZsIaweGSVg5BAxiRqGOL1C5GOzRFGbksEiXjdnjP3UIaLKI
         0xJmiKv7oxEbZt/Y8/RPQTxx7w8MlqRboBd0EU+p9lB0DKpO4t8eUIHxDLcjnIe04wxw
         wWu8r/xTWC2D6T22V1GPtZGxnFFU8RASccN9Bwg7EvV4/CRykuiA27QjmThItaabytGY
         JlBA==
X-Gm-Message-State: ACrzQf0BIwbD7vnYKOAnxZGs7V/WpxJFW38C4nOTsQL0BBsqESzl2X4M
	63bB/ttKPPNEY5V6UGcrXUdhg4W+GW586A==
X-Google-Smtp-Source: 
 AMsMyM6NGMkLJg7RxtB3cKF3IhFze2lIQepgcSawQ7WWJEQSxStQVQCLCzIw4ATFSovWicrdlMDc6A==
X-Received: by 2002:ac8:5b05:0:b0:35c:e1ed:a816 with SMTP id
 m5-20020ac85b05000000b0035ce1eda816mr7583022qtw.208.1663947098142;
        Fri, 23 Sep 2022 08:31:38 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i7-20020ac84887000000b003434d3b5938sm5567002qtq.2.2022.09.23.08.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:31:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Add MHU and RPMSG driver for cs1k
Date: Fri, 23 Sep 2022 11:30:55 -0400
Message-Id: <166394706727.2062239.8156921519962755400.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922145956.56063-1-emekcan.aras@arm.com>
References: <20220922145956.56063-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:31:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3817

On Thu, 22 Sep 2022 15:59:54 +0100, emekcan.aras@arm.com wrote:
> The host uses MHUs to send/receive data from the external
> system in corstone1000. These commits add MHU mailbox device
> tree bindings and rpmsg mailbox driver. The host can now use
> the driver under /dev/rpmsg0_ctrl0 to communicate with external
> system.
> 
> Emekcan (2):
>   arm-bsp/u-boot: Add external system MHUs to u-boot device tree
>   arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: Add external system MHUs to u-boot device tree
      commit: b573b29b766f231b6d3a21b21426738b2ce9d69a
[2/2] arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000
      commit: be8890bb034cb7d850e975041baba04cca2fb93e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

