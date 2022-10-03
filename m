Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E61DC4332F
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:38:59 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.176.1664815137888579661
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=VRW5OX+Z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id mg6so1929216qvb.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zDV82F1C6YYO8rNTZqQ/WnwjMX/6mJ4JWBTaYjNDADs=;
        b=VRW5OX+ZqZktUGYR4L0fm5l5WV7p+hrIP3/eGwjXObRdQ3/tV+bSsRaXIoAOEvjKI9
         HLY58SWS6pFP1CaQuAQsvAWIvjjNPaHg8hdGPk5b3dUUAOjwmT73Alt5tRuVBc5QRM+S
         h7k1b+7e2eNUyt6YVPBD3jbk57E/dq9Lj+gdPQmYqh6TsCyOEhNQWzvBFKbXpfHIuRPL
         SspWDKZ1crRs2SjxrMyz50494HR5GIgP3XxHDthNGb4RAfKTTz2aNo9rAuigTSBUSXC9
         jvxYc+m+rc9OjGnoMVJa6zUrmjXpGomFZinD21Y2uTvuM/pgLFgTH8IEqe94IMI9CLHA
         fCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zDV82F1C6YYO8rNTZqQ/WnwjMX/6mJ4JWBTaYjNDADs=;
        b=OLoblRmZM32PFYIVTZSIS4aR1xGDGraXqDpt8Hazl5ZEWrQiww0qe7yrZEfnVKJPxy
         HVp7lbS/EhUybk9WmdmY2WLh0e7UeVOpJdZqmp+qm1kN5IUic8+QxVGoK21v99jbNbyW
         Uwlh3ovZv5lGeXA96Jg209DF5ImO84/H5tFIFsMIaUZCMrgCxBMMU4yqQDODOh21IqjW
         unmhVfCdtJhFfZx0tnE9CNuNCCQmPTV0zMUcU9lQ72v2Mf7lNElrrwvaJYSCbOBu1F4V
         Kc0UPXIT8lbf5PQ0yP7maeradVjrUw90YBSkjs0IiAJPbeyTEHg9wt3oj32aDBX4opmS
         oKQQ==
X-Gm-Message-State: ACrzQf2jROAOzL3od43a37nf+lbFhFs8+shJVjJlycJ5Z46dteAjzZpT
	Gl8SWXedeefA2CO5f8wBw0jC+BU3n+IBww==
X-Google-Smtp-Source: 
 AMsMyM4ANtCmSj3IelkrdHtXRlRSLXP8enK6r+JBqW+O98cc3z915oO/vuK611pRmwkX2qrVrmRfyQ==
X-Received: by 2002:a05:6214:2686:b0:4af:630c:78f2 with SMTP id
 gm6-20020a056214268600b004af630c78f2mr16967237qvb.52.1664815136615;
        Mon, 03 Oct 2022 09:38:56 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u5-20020a05620a454500b006bb87c4833asm12101268qkp.109.2022.10.03.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:38:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/trusted-firmware-m: Make branch names
 configurable
Date: Mon,  3 Oct 2022 12:37:46 -0400
Message-Id: <166481506585.1286959.2859657611207739548.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221003112959.2123869-1-peter.hoyes@arm.com>
References: <20221003112959.2123869-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 16:38:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3910

On Mon, 3 Oct 2022 12:29:57 +0100, Peter Hoyes wrote:
> In order to support overriding the branch names in other layers, extract
> the branch name for each repository and set using default assignment.

Applied, thanks!

[1/3] arm-bsp/trusted-firmware-m: Make branch names configurable
      commit: ff4a322c838f5c12caf78597dbd2ab777195b0f6
[2/3] arm/classes: Migrate TF-M image signing to bbclass
      commit: 97c7e9f08e6643884cf078a60cf54a8243fbe5cf
[3/3] arm-bsp/corstone1000: Refactor image signing to use new bbclass
      commit: fc26f65b1ca2680293a120a1660a4f226e8e4d16

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

