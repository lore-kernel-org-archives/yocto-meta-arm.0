Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CDCC433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 13:45:38 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.7288.1665755138090174183
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 06:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=0M/sKDmA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id b25so2438100qkk.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 06:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2djRS4zONVrhEEBjglpQ0Z+AOG7rb+OTvyqNA/LyWAk=;
        b=0M/sKDmAfCfS42IDYoeQPbUr2F4d9oQGkcMg7IpXSRfg3JmVcgHuH8OFgUYbp/qiFK
         qqKXVnu+OK/sOikNnL1vxRt38hN4IrKhPs4M8Ze2Kbxl2d3QfoTTzI5CYobQNY/2z6oR
         wtuGJF7PkHz3OHmunxRl5PP3dmrlbtOPr1ckqMSKKGihwkRkeGPAiDaIx8Rv6mvPRnCs
         FudCG+60KMa+N5ST5nn7S8mf0rWOQOCqUqxOKoDuYnX8nax0ash3PLPxjZ6VCLBDAwv8
         s0X+L6BWFDUNybND2AiNmEVG1jC2YJgc4gJmZMQEkbn75yzSBLuokuWZg4M6ClDm3nt8
         JzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2djRS4zONVrhEEBjglpQ0Z+AOG7rb+OTvyqNA/LyWAk=;
        b=7bCxJJt30SYdP1NYhQcE+EwRHQGGSFOgENfs0+jJyRzlm0vEVGP28hIRN8LVfFL8W9
         j1u+okKx7SOSrtUejZmFxqFLZOPhJewEJLZwSOfGSO53LmCkuPCrOAbfOFLPEQmxei9G
         d1K4we4CJkw/xlPSXQNUdnhieZpxhmLqvNKdSecbycxv0DpoNvaQUSXhqBDLwCxGvCVH
         STGtTGBCjFV7IEHmnmQiBWG2N+QyokVFkSwK0OQAx8ZGL52eYnkmGQuARwIlPzq5NcqB
         27I87qJu9x1w6xj0YSXCbUNq6G4H39uoc7HP4qcsavzieGwios/RKU+Q0lH8bW2x0BIm
         gCTA==
X-Gm-Message-State: ACrzQf3GNlEcvZgcSXbghmB6bMBIpczP9mEy+n0BNUcBtqpWHyizdJ6p
	Qu/yYeUdMnsrid5wudk348fkvab2E6n+aA==
X-Google-Smtp-Source: AMsMyM5alrPk8uOR9jA6pFSuHFoJXvuuCu/UPdrU9K5KxN4+AJUcB7TdLoxJz3X0HtDp9LyiiY0c2w==
X-Received: by 2002:a05:620a:12d5:b0:6ee:9a95:8c72 with SMTP id e21-20020a05620a12d500b006ee9a958c72mr3673198qkl.362.1665755136431;
        Fri, 14 Oct 2022 06:45:36 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id i4-20020a05620a248400b006b5e296452csm2562913qkn.54.2022.10.14.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 06:45:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm/lib: Do not log FVP return codes < 0
Date: Fri, 14 Oct 2022 09:44:52 -0400
Message-Id: <166575509232.1155326.15586674182754372342.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221014092823.2888861-1-peter.hoyes@arm.com>
References: <20221014092823.2888861-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 13:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3971

On Fri, 14 Oct 2022 10:28:23 +0100, Peter Hoyes wrote:
> If a process is terminated using a signal, in Python its return code is
> -N, where N is the signal number (e.g. -15 for SIGTERM). Currently, all
> non-zero return codes are printed using logger.info, which gives the
> impression of an abnormal termination even when the process was
> explicitly terminated by FVPRunner.
> 
> Instead, only log return codes greater than zero.

Applied, thanks!

[1/1] arm/lib: Do not log FVP return codes < 0
      commit: d87c445b2420617013ff1acf2af17cb378fd8b16

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

